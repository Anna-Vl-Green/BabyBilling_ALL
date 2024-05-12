package ru.bootcamp.babybilling.web;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import ru.bootcamp.babybilling.client.BrtClient;
import ru.bootcamp.babybilling.model.SubscriberPayDto;
import ru.bootcamp.babybilling.model.SubscriberUpgradeDto;

@RestController
@Slf4j
@RequiredArgsConstructor
public class SubscriberController {
    private final BrtClient brtClient;

    @PostMapping("/subscriber/pay")
    public ResponseEntity<String> subscriberPay(@RequestBody SubscriberPayDto dto) {
        log.info("Принят запрос на пополнение счёта: {}", dto);
        return ResponseEntity.ok(brtClient.subscriberPay(dto));
    }

    @PostMapping("/subscriber/auth")
    public ResponseEntity<String> subscriberAuth(String msisdn) {
        return ResponseEntity.ok(brtClient.subscriberAuth(msisdn));
    }

    @PostMapping("/subscriber/upgrade")
    public ResponseEntity<String> subscriberUp(@RequestBody SubscriberUpgradeDto dto) {
        return ResponseEntity.ok(brtClient.subscriberUpgrade(dto));
    }

    @PostMapping("/subscriber/create")
    public ResponseEntity<String> subscriberCreate(@RequestBody SubscriberUpgradeDto dto) {
        return ResponseEntity.ok(brtClient.subscriberCreate(dto));
    }

}
