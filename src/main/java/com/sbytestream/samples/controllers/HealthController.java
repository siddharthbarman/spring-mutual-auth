package com.sbytestream.samples.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;
import java.time.Instant;
import java.util.Date;

@RestController
@RequestMapping("/health")
public class HealthController {
    private static Instant startedAt = Instant.now();

    @GetMapping(value = "/")
    public String health() {
        Instant end = Instant.now();
        Duration timeElapsed = Duration.between(startedAt, end);
        return String.format("Uptime: : %d minutes", + timeElapsed.toMinutes());
    }
}
