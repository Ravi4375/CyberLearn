package com.cyberlearn.controller;

import com.cyberlearn.model.User;
import com.cyberlearn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;


    @GetMapping("/register")
    public String showRegister() {
        return "register";
    }


    @PostMapping("/register")
    public String register(@RequestParam String username, 
                          @RequestParam String email, 
                          @RequestParam String password, 
                          Model model,
                          org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {

        try {
            userService.registerUser(username, email, password) ;
             redirectAttributes.addFlashAttribute("su ccess", "Registration successful!  Please login");
            return "redirect:/login";


        } catch (Exception e) {

            model.addAttribute("error", "Registration failed: " + e.getMessage());

            return "register";
        }
    }


    // ye redirect kregaa
    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, 
                       @RequestParam String password, 
                       HttpSession session, 
                       Model model) {


        User user = userService.loginUser(username, password);
        if (user != null) {
            session.setAttribute("user", user);   //if user is not their
            return "redirect:/dashboard";

        } else {
            model.addAttribute("error", "Invalid username or password");

            return "login";
        }
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}