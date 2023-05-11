package com.kheti.Inventory.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kheti.Inventory.model.ManPower;
import com.kheti.Inventory.model.User;
import com.kheti.Inventory.service.ManPowerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ManPowerController {

	@Autowired
	ManPowerService manPowerService;

	@RequestMapping(value = "/createManPower", method = RequestMethod.GET)
	public String showCreateManPowerPage(ModelMap model, HttpServletRequest request) {
		System.out.println("ManPower Controller -> showCreateManPowerPage");
		String manPowerId = request.getParameter("manPowerId");
		ManPower manPower = null;
		if (manPowerId != null && !manPowerId.isBlank()) {
			manPower = manPowerService.getManPower(Integer.parseInt(manPowerId));
		}
		model.put("manPower", manPower == null ? new ManPower() : manPower);
		return "createManPower";
	}

	@RequestMapping(value = "/createManPower", method = RequestMethod.POST)
	public String createManPower(@ModelAttribute ManPower manPower, ModelMap model, HttpServletRequest request,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		System.out.println("ManPower Controller -> createManPower");

		System.out.println("ManPowerName: " + request.getParameter("ManPowerName"));
		manPower.setOwnerId(user.getOwnerId());

		int newManPowerId = manPowerService.saveManPower(manPower);
		System.out.println("New ManPower Created with ID: " + newManPowerId);
		model.put("manPower", manPower);
		model.put("errorMessage", "Record Saved Successfully");

		return "createManPower";
	}

	@RequestMapping(value = "/listManPower", method = RequestMethod.GET)
	public String listManPower(HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		System.out.println("ManPower Controller -> listManPower");

		List<ManPower> manPowerList = manPowerService.getAllManPower(user.getOwnerId());
		request.setAttribute("manPowerList", manPowerList);

		return "listManPower";
	}

}
