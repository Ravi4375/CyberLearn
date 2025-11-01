package com.cyberlearn.controller;

import com.cyberlearn.model.User;
import com.cyberlearn.model.QuizAttempt;
import com.cyberlearn.model.QuizSession;
import com.cyberlearn.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProfileController {

    @Autowired
    private QuizService quizService;

    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        
        // Get fresh user data from database
        User freshUser = quizService.getUserById(user.getId());
        if (freshUser != null) {
            user = freshUser;
            session.setAttribute("user", user); // Update session , when user enter the profile page
        }
        
        List<QuizSession> quizSessions = quizService.getUserQuizSessions(user.getId());
        
        model.addAttribute("user", user);
        model.addAttribute("attempts", quizSessions);
        
        return "profile";
    }

    @GetMapping("/leaderboard")
    public String showLeaderboard(Model model) {
        List<User> topUsers = quizService.getTopUsers();
        model.addAttribute("topUsers", topUsers);
        return "leaderboard";
    }
    
    @GetMapping("/analytics")
    public String showAnalytics(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        
        List<QuizSession> quizSessions = quizService.getUserQuizSessions(user.getId());
        
        int totalQuizzes = quizSessions.size();
        int totalCorrect = 0;
        int totalQuestions = 0;
        
        for (QuizSession quiz : quizSessions) {
            totalCorrect = totalCorrect + quiz.getScore();
            totalQuestions = totalQuestions + quiz.getTotalQuestions();
        }
        
        model.addAttribute("totalQuizzes", totalQuizzes);
        model.addAttribute("totalCorrect", totalCorrect);
        model.addAttribute("totalQuestions", totalQuestions);
        model.addAttribute("totalScore", user.getTotalScore());
        
        return "analytics";
    }



}