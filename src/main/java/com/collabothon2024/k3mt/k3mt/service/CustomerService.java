package com.collabothon2024.k3mt.k3mt.service;

import com.collabothon2024.k3mt.k3mt.dto.CustomerDto;
import com.collabothon2024.k3mt.k3mt.mapper.CustomerMapper;
import com.collabothon2024.k3mt.k3mt.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final CustomerMapper customerMapper;

    public List<CustomerDto> getCustomers() {
        return customerRepository.findAll().stream()
                .map(customerMapper::toDto)
                .toList();
    }

}
