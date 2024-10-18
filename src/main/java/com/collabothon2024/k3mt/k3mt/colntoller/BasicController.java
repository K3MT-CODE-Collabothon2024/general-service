package com.collabothon2024.k3mt.k3mt.colntoller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BasicController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, World!";
    }
}