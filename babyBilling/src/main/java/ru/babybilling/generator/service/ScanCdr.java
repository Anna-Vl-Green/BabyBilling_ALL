package ru.babybilling.generator.service;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import ru.babybilling.generator.db.Calls;
import ru.babybilling.generator.db.CallsRepo;
import ru.babybilling.generator.db.SubscribersRepo;
import ru.babybilling.generator.producer.KafkaProducer;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ScanCdr {
    private static final Logger log = LoggerFactory.getLogger(ScanCdr.class);
    private final KafkaProducer producer;
    private final CallsRepo repo;
    private final SubscribersRepo repoSubs;

    public void scanCdr() throws IOException {
        File folder = new File("cdr");
        File[] listOfFiles = folder.listFiles();
        assert listOfFiles != null;
        for (File file : listOfFiles) {
            if (file.isFile()) {
                System.out.println(file.getName());
                readCDR((file));
            }
        }
    }

    public void readCDR(File file) throws IOException {
        List<String> linesCdr = Files.readAllLines(Paths.get("cdr/" + file.getName()));
        for (String line : linesCdr) {
            System.out.println(line);
            producer.sendMessage(line);
            saveCall(line);
        }
    }

    public void saveCall(String lineCall) {
        if (lineCall == null || lineCall.isEmpty()) {
            throw new IllegalArgumentException("Ошибка. Пустая строка CDR");
        } else {
            String[] parts = lineCall.split(",");
            var call = new Calls();
            call.setSubscriberId(repoSubs.findByMsisdn(parts[1]).getId());
            call.setContactedSubscriberId(repoSubs.findByMsisdn(parts[2]).getId());
            call.setStartTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(Long.parseLong(parts[3])), ZoneId.systemDefault()));
            call.setEndTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(Long.parseLong(parts[4])), ZoneId.systemDefault()));
            call.setCallType(Integer.valueOf(parts[0]));
            repo.save(call);
        }
    }
}
