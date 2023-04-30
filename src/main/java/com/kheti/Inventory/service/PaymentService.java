package com.kheti.Inventory.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.Payment;
import com.kheti.Inventory.repository.PaymentRepository;

@Service
public class PaymentService {
	
	@Autowired
	PaymentRepository paymentRepository;
	
	public int savePayment(Payment payment) {	
		paymentRepository.save(payment);
		System.out.println("Payment with ID saved: "+payment.getId());
		return payment.getId();
	}
	
	public Payment getPayment(int paymentId) {
		Optional<Payment> payment= paymentRepository.findById(paymentId);
		
		return payment.isPresent()? payment.get() : null;
	}
	
	public List<Payment> getAllPayment() {
		Iterable<Payment> paymentIter = paymentRepository.findAll();
		List<Payment> paymentList= StreamSupport.stream(paymentIter.spliterator(), false).collect(Collectors.toList());
		return paymentList;
	}
}
