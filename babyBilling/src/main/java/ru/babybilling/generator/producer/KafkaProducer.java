package ru.babybilling.generator.producer;

import lombok.RequiredArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Service;

import java.util.function.BiConsumer;

/**
 * Отправитель данных в Kafka
 */
@RequiredArgsConstructor
@Service
public class KafkaProducer {
    private final KafkaTemplate<String, String> kafkaTemplate;

    /** Отправка сообщения  в топик "cdr_events"
     * @param message запись CDR
     */
    public void sendMessage(String message) {

        try {
            kafkaTemplate.send("cdr_events", message).whenComplete(new BiConsumer<SendResult<String, String>, Throwable>() {
                @Override
                public void accept(SendResult<String, String> stringStringSendResult, Throwable throwable) {
                    System.out.println("Сообщение отправлено");
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
