// src/main/java/com/collabothon2024/k3mt/k3mt/entity/TaskEntity.java
package com.collabothon2024.k3mt.k3mt.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "due_tasks")
@RequiredArgsConstructor
public class TaskEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "task_id")
    private Long taskId;

    @ManyToOne
    @Getter
    @Setter
    @JoinColumn(name = "customer_id", nullable = false)
    @JsonBackReference
    private CustomerEntity customer;

    @Getter
    @Setter
    @Column(name = "title", nullable = false, length = 255)
    private String title;

    @Getter
    @Setter
    @Column(name = "category", length = 100)
    private String category;

    @Getter
    @Setter
    @Column(name = "description")
    private String description;

    @Getter
    @Setter
    @Column(name = "url", length = 255)
    private String url;

    @Getter
    @Setter
    @Column(name = "priority")
    private Integer priority;

    @Getter
    @Setter
    @Column(name = "state", length = 255, nullable = false)
    private String state;

    @Getter
    @Setter
    @Column(name = "deadline")
    private LocalDateTime deadline;
}