package com.kheti.Inventory.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kheti.Inventory.model.Organization;
import com.kheti.Inventory.service.OrganizationService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class OrganizationController {

	@Autowired
	OrganizationService organizationService;

	@RequestMapping(value = "/createOrganization", method = RequestMethod.GET)
	public String showCreateOrganizationPage(ModelMap model, HttpServletRequest request) {
		System.out.println("Organization Controller -> showCreateOrganizationPage");
		String organizationId=request.getParameter("organizationId");
		Organization organization=null;
		if(organizationId!=null && !organizationId.isBlank()) {
			organization=organizationService.getOrganization(Integer.parseInt(organizationId));
			
		}
		model.put("organization", organization==null ?new Organization() : organization);
		return "createOrganization";
	}

	@RequestMapping(value = "/createOrganization", method = RequestMethod.POST)
	public String createOrganization(@ModelAttribute Organization organization, ModelMap model, HttpServletRequest request) {
	System.out.println("Organization Controller -> createOrganization");

		System.out.println(
				"OrganizationName: " + request.getParameter("OrganizationName") );		
	
		int newOrganizationId = organizationService.saveOrganization(organization);
		System.out.println("New Organization Created with ID: " + newOrganizationId);
		model.put("organization", organization);
		model.put("errorMessage", "Record Saved Successfully");

		return "createOrganization";
	}
	
	@RequestMapping(value = "/listOrganization", method = RequestMethod.GET)
	public String listOrganization(HttpServletRequest request) {
		System.out.println("Organization Controller -> listOrganization");
		
		List<Organization> organizationList= organizationService.getAllOrganization();	
		request.setAttribute("organizationList", organizationList);

		return "listOrganization";
	}

}
