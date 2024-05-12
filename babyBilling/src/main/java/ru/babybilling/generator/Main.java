package ru.babybilling.generator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import ru.babybilling.generator.service.Commutator;
import ru.babybilling.generator.service.ScanCdr;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@SpringBootApplication
@EnableJpaRepositories
public class Main {
    public static void main(String args[]) throws IOException {
        var context = SpringApplication.run(Main.class, args);
        context.getBean(Commutator.class).generate();
        ExecutorService service = Executors.newFixedThreadPool(5);
        service.submit(() -> context.getBean(Commutator.class).generate());
        service.submit(() -> context.getBean(Commutator.class).generate());
        service.submit(() -> context.getBean(Commutator.class).generate());
        service.submit(() -> context.getBean(Commutator.class).generate());
        service.submit(() -> context.getBean(Commutator.class).generate());
        service.shutdown();
        context.getBean(ScanCdr.class).scanCdr();
    }
}
