package ru.babybilling.generator.model;

import lombok.Data;

/**
 * Сущность CDR
 */
@Data
public class Cdr {
    private String callType;
    private String firstNum;
    private String secondNum;
    private Long startTime;
    private String endTime;
}
