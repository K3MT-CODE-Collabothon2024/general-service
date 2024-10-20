package com.collabothon2024.k3mt.k3mt.repository;

import com.collabothon2024.k3mt.k3mt.entity.EmailEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmailRepository extends JpaRepository<EmailEntity, Integer> {
    List<EmailEntity> findByCustomerCustomerId(Integer customerId);
}
