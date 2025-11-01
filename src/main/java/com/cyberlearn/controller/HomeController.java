package com.cyberlearn.controller;

import com.cyberlearn.model.Category;
import com.cyberlearn.service.CategoryService;
import com.cyberlearn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService CategoryService;

    @GetMapping("/")
    public String home() {
        return "index";
    }


    @GetMapping("/dashboard")
    public String dashboard(Model model, javax.servlet.http.HttpSession session) {

        Object userObj = session.getAttribute("user");

        if (userObj == null) {
            return "redirect:/login";
        }

        if (userObj != null) {
            model.addAttribute("user", userObj);
        }

        List<Category> categories = CategoryService.findAll();
           model.addAttribute("categories", categories);
        return "dashboard";

    }

}