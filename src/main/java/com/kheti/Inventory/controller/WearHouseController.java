package com.kheti.Inventory.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kheti.Inventory.model.User;
import com.kheti.Inventory.model.WearHouse;
import com.kheti.Inventory.service.WearHouseService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class WearHouseController {

	@Autowired
	WearHouseService wearHouseService;

	@RequestMapping(value = "/createWearHouse", method = RequestMethod.GET)
	public String showCreateWearHousePage(ModelMap model, HttpServletRequest request) {
		System.out.println("WearHouse Controller -> showCreateWearHousePage");
		String wearHouseId=request.getParameter("wearHouseId");
		WearHouse wearHouse=null;
		if(wearHouseId!=null && !wearHouseId.isBlank()) {
			wearHouse=wearHouseService.getWearHouse(Integer.parseInt(wearHouseId));
			
		}
		model.put("wearHouse", wearHouse==null ?new WearHouse() : wearHouse);
		return "createWearHouse";
	}

	@RequestMapping(value = "/createWearHouse", method = RequestMethod.POST)
	public String createWearHouse(@ModelAttribute WearHouse wearHouse, ModelMap model, HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
	System.out.println("WearHouse Controller -> createWearHouse");

		System.out.println(
				"WearHouseName: " + request.getParameter("WearHouseName") );	
		wearHouse.setOwnerId(user.getOwnerId());
	
		int newWearHouseId = wearHouseService.saveWearHouse(wearHouse);
		System.out.println("New WearHouse Created with ID: " + newWearHouseId);
		model.put("wearHouse", wearHouse);
		model.put("errorMessage", "Record Saved Successfully");

		return "createWearHouse";
	}
	
	@RequestMapping(value = "/listWearHouse", method = RequestMethod.GET)
	public String listWearHouse(HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		System.out.println("WearHouse Controller -> listWearHouse");
		
		List<WearHouse> wearHouseList= wearHouseService.getAllWearHouse(user.getOwnerId());	
		request.setAttribute("wearHouseList", wearHouseList);

		return "listWearHouse";
	}

}
