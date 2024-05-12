package ru.bootcamp.babybilling.producer;

import lombok.RequiredArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Service;

import java.util.function.BiConsumer;

@RequiredArgsConstructor
@Service
public class KafkaProducer {
    private final KafkaTemplate<String, String> kafkaTemplate;

    public void sendMessageMonthlyFee(String message) {

        try {
            kafkaTemplate.send("monthly_fee_events", message).whenComplete(new BiConsumer<SendResult<String, String>, Throwable>() {
                @Override
                public void accept(SendResult<String, String> stringStringSendResult, Throwable throwable) {
                    System.out.println();
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendMessageWithdraw(String message) {

        try {
            kafkaTemplate.send("withdraw_events", message).whenComplete(new BiConsumer<SendResult<String, String>, Throwable>() {
                @Override
                public void accept(SendResult<String, String> stringStringSendResult, Throwable throwable) {
                    System.out.println();
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    }

