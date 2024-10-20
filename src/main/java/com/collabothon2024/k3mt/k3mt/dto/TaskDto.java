package com.collabothon2024.k3mt.k3mt.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class TaskDto {
    private Integer priority;
    private String description;
    private String url;
    private String state;
    private String title;
    private String category;
    private LocalDateTime deadline;
}
