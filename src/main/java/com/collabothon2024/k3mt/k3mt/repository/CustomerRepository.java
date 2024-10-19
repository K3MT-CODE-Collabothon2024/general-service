package com.collabothon2024.k3mt.k3mt.repository;


import com.collabothon2024.k3mt.k3mt.entity.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<CustomerEntity, Integer> {
}
