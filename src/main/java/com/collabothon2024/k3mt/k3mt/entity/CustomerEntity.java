// src/main/java/com/collabothon2024/k3mt/k3mt/entity/CustomerEntity.java
package com.collabothon2024.k3mt.k3mt.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "customers")
@RequiredArgsConstructor
@AllArgsConstructor
public class CustomerEntity {

    @Id
    @Getter
    @Setter
    @Column(name = "customer_id", nullable = false)
    private Integer customerId;

    @Getter
    @Setter
    @Column(name = "created_date", nullable = false)
    private LocalDateTime createdDate;

    @Getter
    @Setter
    @Column(name = "score", nullable = false)
    private Integer score;

    @Getter
    @Setter
    @Column(name = "company_name", columnDefinition = "character varying", nullable = false)
    private String companyName;

    @Getter
    @Setter
    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonBackReference
    private List<TaskEntity> tasks;
}