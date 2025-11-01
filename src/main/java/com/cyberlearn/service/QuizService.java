package com.cyberlearn.service;

import com.cyberlearn.model.*;
import com.cyberlearn.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.time.LocalDateTime;

@Service
public class QuizService {

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private AnswerOptionRepository answerOptionRepository;
    
    @Autowired
    private QuizAttemptRepository quizAttemptRepository;
    
    @Autowired
    private QuizSessionRepository quizSessionRepository;
    
    @Autowired
    private CategoryRepository categoryRepository;
    
    @Autowired
    private UserRepository userRepository;

    public List<Question> getQuestionsByCategory(Long categoryId) {
        return questionRepository.findByCategoryId(categoryId);
    }

    public List<AnswerOption> getAnswerOptions(Long questionId) {
        return answerOptionRepository.findByQuestionId(questionId);
    }
    
    public boolean isAnswerCorrect(Long answerId) {
        AnswerOption option = answerOptionRepository.findById(answerId).orElse(null);
        return option != null && option.getIsCorrect();
    }
    
    public List<QuizAttempt> getUserAttempts(Long userId) {
        return quizAttemptRepository.findByUserIdOrderByAttemptTimeDesc(userId);
    }
    
    public List<QuizSession> getUserQuizSessions(Long userId) {
        return quizSessionRepository.findByUserIdOrderByAttemptTimeDesc(userId);
    }


    //ye top 10 user dega humko, jinka score achha h
    public List<User> getTopUsers() {
        return userRepository.findTop10ByOrderByTotalScoreDesc();
    }
    
    public AnswerOption getAnswerOption(Long answerId) {
        return answerOptionRepository.findById(answerId).orElse(null);
    }
    
    public void saveQuizAttempt(User user, Question question, String selectedAnswer, boolean isCorrect) {
        QuizAttempt attempt = new QuizAttempt();
        attempt.setUser(user);
        attempt.setQuestion(question);
        attempt.setSelectedAnswer(selectedAnswer);
        attempt.setIsCorrect(isCorrect);
        attempt.setAttemptTime(java.time.LocalDateTime.now());
        quizAttemptRepository.save(attempt);
    }
    
    public void saveQuizSession(User user, Long categoryId, int score, int totalQuestions, double percentage) {
        Category category = categoryRepository.findById(categoryId).orElse(null);
        if (category != null) {
            QuizSession session = new QuizSession();
            session.setUser(user);
            session.setCategory(category);
            session.setScore(score);
            session.setTotalQuestions(totalQuestions);
            session.setPercentage(percentage);
            session.setAttemptTime(LocalDateTime.now());
            quizSessionRepository.save(session);
        }
    }
    
    public void updateUserScore(User user, int scoreToAdd) {
        user.setTotalScore(user.getTotalScore() + scoreToAdd);
        userRepository.save(user);
    }
    
    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }
    
    public int calculateWeightedScore(List<Question> questions, int correctAnswers) {
        if (questions == null || questions.isEmpty() || correctAnswers <= 0) {
            return correctAnswers * 10; // Default scoring
        }
        
        int totalPoints = 0;
        int answeredCorrectly = 0;
        
        for (Question question : questions) {
            if (question != null && answeredCorrectly < correctAnswers) {
                int points = getPointsForDifficulty(question.getDifficulty());
                totalPoints += points;
                answeredCorrectly++;
            }
        }
        return totalPoints > 0 ? totalPoints : correctAnswers * 10;
    }
    
    private int getPointsForDifficulty(Question.DifficultyLevel difficulty) {
        if (difficulty == null) return 10;
        switch (difficulty) {
            case BEGINNER: return 10;
            case INTERMEDIATE: return 15;
            case ADVANCED: return 20;
            default: return 10;
        }
    }
}