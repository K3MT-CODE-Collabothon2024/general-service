package com.collabothon2024.k3mt.k3mt.controller;

import com.collabothon2024.k3mt.k3mt.dto.TaskDto;
import com.collabothon2024.k3mt.k3mt.service.TaskService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/tasks")
@AllArgsConstructor
@CrossOrigin
public class TaskController {

    private TaskService taskService;

    @GetMapping("/{customerId}")
    public ResponseEntity<List<TaskDto>> getTasksByCustomerId(@PathVariable Integer customerId) {
        return ResponseEntity.ok(taskService.getTasksByCustomerId(customerId));
    }

}
