package com.collabothon2024.k3mt.k3mt.service;

import com.collabothon2024.k3mt.k3mt.dto.TaskDto;
import com.collabothon2024.k3mt.k3mt.mapper.TaskMapper;
import com.collabothon2024.k3mt.k3mt.repository.TaskRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class TaskService {

    private final TaskRepository taskRepository;
    private final TaskMapper taskMapper;

    public List<TaskDto> getTasks() {
        return taskRepository.findAll().stream()
                .map(taskMapper::toDto)
                .toList();
    }

    public List<TaskDto> getTasksByCustomerId(Integer customerId) {
        return taskRepository.findByCustomerCustomerId(customerId).stream()
                .map(taskMapper::toDto)
                .toList();
    }



}
