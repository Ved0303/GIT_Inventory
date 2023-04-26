package com.kheti.Inventory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HeaderController {


    @RequestMapping(value="/header", method = RequestMethod.GET)
    public String header(ModelMap model,@RequestParam String title){
    	model.put("title", title);
    	System.out.println("in Header Get");
        return "header";
    }
    
    @RequestMapping(value="/header", method = RequestMethod.POST)
    public String headerPost(ModelMap model,@RequestParam String title){
    	model.put("title", title);
    	System.out.println("in Header POST");
        return "header";
    }

    @RequestMapping(value="/footer", method = RequestMethod.GET)
    public String footer(){
    	System.out.println("in Footer Get");
        return "footer";
    }
    
    @RequestMapping(value="/footer", method = RequestMethod.POST)
    public String footerPost(){
    	System.out.println("in Footer post");
        return "footer";
    }

}
