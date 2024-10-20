package com.collabothon2024.k3mt.k3mt.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class CustomerDto {
    private Integer customerId;
    private LocalDateTime createdDate;
    private Integer score;
    private String companyName;
    private Integer cash;
}
