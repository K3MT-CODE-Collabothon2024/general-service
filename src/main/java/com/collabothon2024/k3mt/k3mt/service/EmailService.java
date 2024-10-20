package com.collabothon2024.k3mt.k3mt.service;

import com.collabothon2024.k3mt.k3mt.entity.EmailEntity;
import com.collabothon2024.k3mt.k3mt.repository.EmailRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
@RequiredArgsConstructor
public class EmailService {

    private final EmailRepository emailRepository;

    public List<EmailEntity> getEmails() {
        return emailRepository.findAll();
    }

    public List<EmailEntity> getEmailsByCustomerId(Integer id) {
        return emailRepository.findByCustomerCustomerId(id);
    }
}
