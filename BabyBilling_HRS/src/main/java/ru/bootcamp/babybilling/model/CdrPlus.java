package ru.bootcamp.babybilling.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * Сущность звонка абонента "Ромашка"
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CdrPlus {
    private Long msisdn;
    private Long secondMsisdn;
    private Integer tariffId;
    private Integer amountMinutes;
    private Integer type;
    private Boolean isToStranger;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
}