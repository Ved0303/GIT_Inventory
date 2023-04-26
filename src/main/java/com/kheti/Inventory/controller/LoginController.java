package com.kheti.Inventory.controller;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.kheti.Inventory.model.User;
import com.kheti.Inventory.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class LoginController {

    @Autowired
    LoginService loginService;
    
    @Autowired
    User user;
    
    @Bean
    @SessionScope
    public User getUser() {
    	return new User();
    }
    

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model){
        return "login";
    }
    
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String showWelcomePage(ModelMap model, @RequestParam String name, @RequestParam String password,HttpSession session){

        User user = loginService.getUser(name, password);
		
        if (null==user) {
            model.put("errorMessage", "Invalid Credentials");
            return "login";
        }
        
        session.setAttribute("user", user);
        
        return "welcome";
    }
    
    @RequestMapping(value="/welcome", method = RequestMethod.GET)
    public String welcome(){
    	
        return "welcome";
    }
    
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.setAttribute("user", null);
        session.invalidate();
        return "login";
    }

    
}
