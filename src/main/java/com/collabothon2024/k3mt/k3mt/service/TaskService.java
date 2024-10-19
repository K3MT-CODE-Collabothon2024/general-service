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
        List<TaskDto> taskDtos = taskRepository.findAll().stream()
                .map(taskMapper::toDto)
                .toList();
        return taskDtos;
    }

    // return all tasks for one customer
    public List<TaskDto> getTasksByCustomerId(Integer customerId) {
        List<TaskDto> taskDtos = taskRepository.findByCustomerCustomerId(customerId).stream()
                .map(taskMapper::toDto)
                .toList();
        return taskDtos;
    }
//
//    // set state of a task
//    public TaskDto setState(Integer taskId, String state) {
//        TaskDto taskDto = taskMapper.toDto(taskRepository.findById(taskId).get());
//        taskDto.setState(state);
//        taskRepository.save(taskMapper.toEntity(taskDto, ));
//        return taskDto;
//    }


}
