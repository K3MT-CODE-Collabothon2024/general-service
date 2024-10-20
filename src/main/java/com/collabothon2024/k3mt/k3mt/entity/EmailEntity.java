package com.collabothon2024.k3mt.k3mt.entity;


import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;


import java.time.LocalDateTime;

@Entity
@Table(name = "mails")
@RequiredArgsConstructor
public class EmailEntity {

    @Id
    @Getter
    @Setter
    @Column(name = "email_id")
    private Integer emailId;

    @ManyToOne
    @Getter
    @Setter
    @JoinColumn(name = "customer_id", nullable = false)
    @JsonBackReference
    private CustomerEntity customer;


    @Getter
    @Setter
    @Column(name = "date", nullable = false, updatable = false)
    private LocalDateTime date = LocalDateTime.now();

    @Getter
    @Setter
    @Column(name = "subject", nullable = false, length = 255)
    private String subject;

    @Getter
    @Setter
    @Column(name = "sender")
    private String sender;
}
