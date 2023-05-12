package com.kheti.Inventory.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestEx {
	
	@CrossOrigin("*")
	@GetMapping(path = "/random")
	public String getRandom(){
		
		int n=(int)(Math.random()*10000);
	System.out.println("In RestEx getRandom "+n);
		return ""+n;
	}

}
