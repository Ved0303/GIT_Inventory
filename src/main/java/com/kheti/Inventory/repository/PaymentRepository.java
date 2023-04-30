package com.kheti.Inventory.repository;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.Payment;

public interface PaymentRepository extends CrudRepository<Payment, Integer> {

}
