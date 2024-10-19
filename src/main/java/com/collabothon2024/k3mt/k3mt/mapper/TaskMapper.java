// src/main/java/com/collabothon2024/k3mt/k3mt/mapper/TaskMapper.java
package com.collabothon2024.k3mt.k3mt.mapper;

import com.collabothon2024.k3mt.k3mt.dto.TaskDto;
import com.collabothon2024.k3mt.k3mt.entity.TaskEntity;
import com.collabothon2024.k3mt.k3mt.entity.CustomerEntity;
import org.springframework.stereotype.Component;

@Component
public class TaskMapper {

    public TaskDto toDto(TaskEntity taskEntity) {
        TaskDto taskDto = new TaskDto();
        taskDto.setPriority(taskEntity.getPriority());
        taskDto.setDescription(taskEntity.getDescription());
        taskDto.setUrl(taskEntity.getUrl());
        taskDto.setState(taskEntity.getState());
        taskDto.setTitle(taskEntity.getTitle());
        taskDto.setCategory(taskEntity.getCategory());
        return taskDto;
    }

    public TaskEntity toEntity(TaskDto taskDto, CustomerEntity customerEntity) {
        TaskEntity taskEntity = new TaskEntity();
        taskEntity.setCustomer(customerEntity);
        taskEntity.setPriority(taskDto.getPriority());
        taskEntity.setDescription(taskDto.getDescription());
        taskEntity.setUrl(taskDto.getUrl());
        taskEntity.setState(taskDto.getState());
        taskEntity.setTitle(taskDto.getTitle());
        taskEntity.setCategory(taskDto.getCategory());
        return taskEntity;
    }
}