package ru.bootcamp.babybilling.producer;

import lombok.RequiredArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Service;

import java.util.function.BiConsumer;

/**
 * Отправитель сообщений в Kafka.
 */
@RequiredArgsConstructor
@Service
public class KafkaProducer {
    private final KafkaTemplate<String, String> kafkaTemplate;

    /** Отправитель сообщения в топик "monthly_fee_events".
     * @param message сообщение о ежемесячном списании.
     */
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

    /** Отправитель сообщения в топик "withdraw_events".
     * @param message сообщение со счётом на оплату.
     */
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

