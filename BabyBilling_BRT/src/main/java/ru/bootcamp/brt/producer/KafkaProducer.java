package ru.bootcamp.brt.producer;

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

    /** Отправитель сообщения в топик "tariff_events". Отправляет массив уникальных идентификаторов тарифов
     * @param message сообщение со списком тарифов
     */
    public void sendMessageTariff(String message) {

        try {
            kafkaTemplate.send("tariff_events", message)
                    .whenComplete(new BiConsumer<SendResult<String, String>, Throwable>() {
                @Override
                public void accept(SendResult<String, String> stringStringSendResult, Throwable throwable) {
                    System.out.println();
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /** Отправитель сообщения в топик "call_events".  Отправляет cdrPlus - расширенную запись о звонке абонента
     *  и состоянии его счёта тарифов.
     * @param message сообщение cdrPlus.
     */
    public void sendMessageCall(String message) {

        try {
            kafkaTemplate.send("call_events", message)
                    .whenComplete(new BiConsumer<SendResult<String, String>, Throwable>() {
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
