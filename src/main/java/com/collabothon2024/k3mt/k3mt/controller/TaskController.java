package com.collabothon2024.k3mt.k3mt.controller;

import com.collabothon2024.k3mt.k3mt.dto.TaskDto;
import com.collabothon2024.k3mt.k3mt.dto.TaskStatus;
import com.collabothon2024.k3mt.k3mt.service.TaskService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/tasks")
@AllArgsConstructor
public class TaskController {

    private TaskService taskService;

    @GetMapping("/{customerId}")
    public ResponseEntity<List<TaskDto>> getTasksByCustomerId(@PathVariable Integer customerId) {
        return ResponseEntity.ok(taskService.getTasksByCustomerId(customerId));
    }

//    @PostMapping("/setState/{taskId}")
//    public ResponseEntity<TaskDto> setState(@PathVariable Integer taskId, @RequestBody TaskStatus taskDto) {
//        return ResponseEntity.ok(taskService.setState(taskId, taskDto.getState()));
//    }

}
