package ru.bootcamp.babybilling;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableJpaRepositories
@EnableFeignClients(basePackages = "ru.bootcamp.babybilling")
@EnableWebMvc
public class Main {
    public static void main(String[] args) {
        var context = SpringApplication.run(Main.class, args);
    }
}