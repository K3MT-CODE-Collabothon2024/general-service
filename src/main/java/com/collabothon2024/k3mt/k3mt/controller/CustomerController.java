package com.collabothon2024.k3mt.k3mt.controller;

import com.collabothon2024.k3mt.k3mt.dto.CustomerDto;
import com.collabothon2024.k3mt.k3mt.entity.CustomerEntity;
import com.collabothon2024.k3mt.k3mt.service.CustomerService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/customers")
@AllArgsConstructor
public class CustomerController {

    private final CustomerService customerService;

    @GetMapping
    public ResponseEntity<List<CustomerDto>> getCustomers() {
        return ResponseEntity.ok(customerService.getCustomers());
    }

}
