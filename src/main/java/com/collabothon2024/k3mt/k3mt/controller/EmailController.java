package com.collabothon2024.k3mt.k3mt.controller;

import com.collabothon2024.k3mt.k3mt.entity.EmailEntity;
import com.collabothon2024.k3mt.k3mt.service.EmailService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/email")
@CrossOrigin
public class EmailController {

    private final EmailService emailService;

    @GetMapping("/{customerId}")
    public ResponseEntity<List<EmailEntity>> getEmails(@PathVariable Integer customerId) {
        return ResponseEntity.ok(emailService.getEmailsByCustomerId(customerId));
    }

}
