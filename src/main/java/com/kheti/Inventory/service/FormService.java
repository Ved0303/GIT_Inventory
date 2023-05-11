package com.kheti.Inventory.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.Form;
import com.kheti.Inventory.repository.FormRepository;

@Service
public class FormService {

	@Autowired
	FormRepository formRepository;

	public int createForm(String formName, float area, String areaType, float cutivationArea, String address1,
			String address2, String city, String state, int valveCapacity, int ownerId, int modifiedBy) {

		Form form = new Form(formName, area, areaType, cutivationArea, address1, address2, city, state, valveCapacity,
				ownerId, modifiedBy, new Date());

		System.out.println("call createForm(Form form) " + form.getFormName());
		return createForm(form);
	}

	public int createForm(Form form) {

		formRepository.save(form);
		System.out.println("Form with ID saved: " + form.getFormId());
		return form.getFormId();
	}

	public Form getFormById(int formId) {
		Optional<Form> form = formRepository.findById(formId);
		if (form.isPresent())
			return form.get();
		else
			return null;
	}
	
	/*
	 * public List<Form> getAllForms() { Iterable<Form> formsIter =
	 * formRepository.findAll(); List<Form> formLis=
	 * StreamSupport.stream(formsIter.spliterator(),
	 * false).collect(Collectors.toList()); return formLis; }
	 */
	public List<Form> getAllForms(int ownerId) {
		List<Form> formList = formRepository.findByOwnerId(ownerId);
		if(formList==null) {
			formList=new ArrayList<>();
		}
		return formList;
	}


}
