package com.cyberlearn.controller;

import com.cyberlearn.model.*;
import com.cyberlearn.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Controller
@RequestMapping("/quiz")
public class QuizController {

    @Autowired
    private QuizService quizService;

    @GetMapping("/{categoryId}")
    public String startQuiz(@PathVariable Long categoryId, Model model, HttpSession session) {

        List<Question> questions = quizService.getQuestionsByCategory(categoryId);

        if (questions.isEmpty()) {
            model.addAttribute("categoryId", categoryId);
            return "quiz";
        }

        session.setAttribute("categoryId", categoryId);

        Map<Long, List<AnswerOption>> questionOptions = new HashMap<>();

        for (Question question : questions) {
            List<AnswerOption> options = quizService.getAnswerOptions(question.getId());
            questionOptions.put(question.getId(), options);
        }

        model.addAttribute("questions", questions);
        model.addAttribute("questionOptions", questionOptions);
        model.addAttribute("categoryId", categoryId);

        return "quiz";
    }


    @PostMapping("/submit")
    public String submitAnswer(HttpServletRequest request, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }


        Long categoryId = (Long) session.getAttribute("categoryId");

        List<Question> questions = quizService.getQuestionsByCategory(categoryId);
        
        int score = 0;

        List<WrongAnswer> wrongAnswers = new java.util.ArrayList<>();
        
        for (int i = 0; i < questions.size(); i++) {
            Question question = questions.get(i);
            String paramName = "question_" + question.getId();
            String answerValue = request.getParameter(paramName);
            
            boolean isCorrect = false;
            String selectedAnswerText = "No answer selected";
            
            if (answerValue != null) {
                Long answerId = Long.parseLong(answerValue);
                isCorrect = quizService.isAnswerCorrect(answerId);
                selectedAnswerText = getAnswerText(answerId);
                
                if (isCorrect) {
                    score++;
                } else {
                    WrongAnswer wrongAnswer = new WrongAnswer();
                    wrongAnswer.questionNumber = i + 1;
                    wrongAnswer.questionText = question.getQuestionText();
                    wrongAnswer.userAnswer = selectedAnswerText;
                    wrongAnswer.correctAnswer = getCorrectAnswerText(question.getId());
                    wrongAnswer.explanation = getCorrectAnswerExplanation(question.getId());
                    wrongAnswers.add(wrongAnswer);
                }
            } else {
                WrongAnswer wrongAnswer = new WrongAnswer();
                wrongAnswer.questionNumber = i + 1;
                wrongAnswer.questionText = question.getQuestionText();
                wrongAnswer.userAnswer = selectedAnswerText;
                wrongAnswer.correctAnswer = getCorrectAnswerText(question.getId());
                wrongAnswer.explanation = getCorrectAnswerExplanation(question.getId());
                wrongAnswers.add(wrongAnswer);
            }
            
            // Save quiz attempt
            quizService.saveQuizAttempt(user, question, selectedAnswerText, isCorrect);
        }
        
        int totalQuestions = questions.size();
        double percentage = (score * 100.0) / totalQuestions;
        
        // Simple scoring: 10 points per correct answer
        int finalScore = score * 10;
        int bonusPoints = (percentage == 100.0) ? 50 : 0;
        finalScore += bonusPoints;
        
        // Save quiz session
        quizService.saveQuizSession(user, categoryId, score, totalQuestions, percentage);
        
        // Update user's total score
        quizService.updateUserScore(user, finalScore);
        
        model.addAttribute("baseScore", score * 10);
        model.addAttribute("bonusPoints", bonusPoints);
        model.addAttribute("finalScore", finalScore);
        
        // Update user in session
        session.setAttribute("user", quizService.getUserById(user.getId()));
        
        model.addAttribute("score", score);
        model.addAttribute("totalQuestions", totalQuestions);
        model.addAttribute("percentage", percentage);
        model.addAttribute("wrongAnswers", wrongAnswers);
        
        return "results";
    }
    
    private String getAnswerText(Long answerId) {
        AnswerOption option = quizService.getAnswerOption(answerId);
        return option != null ? option.getOptionText() : "Unknown";
    }
    
    private String getCorrectAnswerText(Long questionId) {
        return quizService.getAnswerOptions(questionId).stream()
            .filter(AnswerOption::getIsCorrect)
            .map(AnswerOption::getOptionText)
            .findFirst().orElse("Unknown");
    }
    
    private String getCorrectAnswerExplanation(Long questionId) {
        return quizService.getAnswerOptions(questionId).stream()
            .filter(AnswerOption::getIsCorrect)
            .map(AnswerOption::getExplanation)
            .findFirst().orElse("No explanation available");
    }
    
    public static class WrongAnswer {
        public int questionNumber;
        public String questionText;
        public String userAnswer;
        public String correctAnswer;
        public String explanation;
    }
}