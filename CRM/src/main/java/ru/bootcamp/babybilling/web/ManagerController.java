package ru.bootcamp.babybilling.web;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.bootcamp.babybilling.db.entity.Managers;
import ru.bootcamp.babybilling.db.repo.ManagersRepo;

@RestController
@Slf4j
@RequiredArgsConstructor
public class ManagerController {
    private final ManagersRepo repo;

    @PostMapping("/managers")
    public void managerIdentification(String username) {
        Managers authManager = repo.findByUsername(username);
        if (authManager != null) {
            log.info("{} авторизован", username);
        } else {
            log.info("Ошибка. Неправильный логин или пароль");
        }
    }
}
