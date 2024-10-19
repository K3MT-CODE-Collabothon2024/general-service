// src/main/java/com/collabothon2024/k3mt/k3mt/entity/TaskEntity.java
package com.collabothon2024.k3mt.k3mt.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "due_tasks")
@RequiredArgsConstructor
public class TaskEntity {
    @Id
    @Getter
    @Setter
    @Column(name = "task_id", nullable = false)
    private Integer taskId;

    @Getter
    @Setter
    @Column(name = "priority", nullable = false)
    private Integer priority;

    @Getter
    @Setter
    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Getter
    @Setter
    @Column(name = "url", columnDefinition = "character varying")
    private String url;

    @Getter
    @Setter
    @Column(name = "state", columnDefinition = "character varying")
    private String state;

    @Getter
    @Setter
    @Column(name = "title", columnDefinition = "character varying")
    private String title;

    @Getter
    @Setter
    @Column(name = "category", columnDefinition = "character varying")
    private String category;

    @ManyToOne
    @Getter
    @Setter
    @JoinColumn(name = "customer_id", nullable = false)
    @JsonBackReference
    private CustomerEntity customer;
}