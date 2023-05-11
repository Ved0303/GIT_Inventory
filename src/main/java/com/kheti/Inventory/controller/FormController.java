package com.kheti.Inventory.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kheti.Inventory.model.Crop;
import com.kheti.Inventory.model.Form;
import com.kheti.Inventory.model.User;
import com.kheti.Inventory.service.CropService;
import com.kheti.Inventory.service.FormService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FormController {

	@Autowired
	FormService formService;

	@Autowired
	CropService cropService;

	static Map<String, String> areaTypes = new LinkedHashMap();
	static {
		areaTypes.put("acer", "Acer");
		areaTypes.put("bigha", "Bigha");
	}

	@RequestMapping(value = "/createForm", method = RequestMethod.GET)
	public String showCreateFormPage(ModelMap model, HttpServletRequest request) {
		System.out.println("Form Controller -> showCreateFormPage");
		String formId=request.getParameter("formId");
		Form form=null;
		if(formId!=null && !formId.isBlank()) {
			form=formService.getFormById(Integer.parseInt(formId));
			
		}
		model.put("form", form==null ?new Form() : form);
		request.setAttribute("areaTypes", areaTypes);

		return "createForm";
	}

	@RequestMapping(value = "/createForm", method = RequestMethod.POST)
	public String createForm(@ModelAttribute Form form, ModelMap model, HttpServletRequest request,HttpSession session) {
		System.out.println("Form Controller -> createForm");
		User user=(User)session.getAttribute("user");

		System.out.println(
				"formName: " + request.getParameter("formName") + "  areaType=" + request.getParameter("areaType"));
		
		form.setModifiedBy(user.getId());
		form.setModifiedOn(new Date());
		form.setOwnerId(user.getOwnerId());

		System.out.println(form);
		List<Crop> corpList = new ArrayList<>();
		form.setCropList(corpList);
		int cropCount = Integer.parseInt(request.getParameter("cropCount"));
		System.out.println("cropCount : " + cropCount);

		for (int i = 0; i < cropCount; i++) {
			String cropName = request.getParameter("cropName" + i);
			if (cropName == null || cropName.isBlank())
				continue;// seems this row is getting deleted

			String variety = request.getParameter("variety" + i);
			String valveNumbers = request.getParameter("valveNumbers" + i);
			String isActiveStr = request.getParameter("isActive" + i);
			String cropAreaStr = request.getParameter("cropArea" + i);
			boolean isActive = isActiveStr != null && "true".equals(isActiveStr);
			float cropArea = Float.parseFloat(cropAreaStr);

			Crop crop = null;
			String cropId = request.getParameter("cropId" + i);
			if (null != cropId && Integer.parseInt(cropId) > 0) {
				crop = cropService.getCrop(Integer.parseInt(cropId));
				crop.setCropName(cropName);
				crop.setFormId(form.getFormId());
				crop.setCropVariety(variety);
				crop.setValveList(valveNumbers);
				crop.setActive(isActive);
				crop.setCropArea(cropArea);
				crop.setUpdatedBy(user.getId());
				crop.setUpdatedOn(new Date());
			} else {
				crop = new Crop(form.getFormId(), cropName, variety, cropArea,  isActive, new Date(), null,
						user.getId(), null, valveNumbers);
			}
			cropService.saveCrop(crop);
			System.out.println("Crop: " + i + " : " + crop);
			corpList.add(crop);
		
			model.put("errorMessage", "Record Saved Successfully");
			
			
		}

		int newFormId = formService.createForm(form);
		System.out.println("New Form Created with ID: " + newFormId);
		model.put("form", form);
		request.setAttribute("areaTypes", areaTypes);

		return "createForm";
	}
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(HttpServletRequest request) {
		System.out.println("Form Controller -> listForm");
		
		List<Form> formList= formService.getAllForms();	
		request.setAttribute("formList", formList);

		return "listForm";
	}

}
