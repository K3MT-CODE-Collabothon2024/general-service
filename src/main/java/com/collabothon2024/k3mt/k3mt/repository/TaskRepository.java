package com.collabothon2024.k3mt.k3mt.repository;

import com.collabothon2024.k3mt.k3mt.entity.TaskEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.function.LongFunction;

public interface TaskRepository extends JpaRepository<TaskEntity, Integer> {
    List<TaskEntity> findByCustomerCustomerId(Integer customerId);
}
