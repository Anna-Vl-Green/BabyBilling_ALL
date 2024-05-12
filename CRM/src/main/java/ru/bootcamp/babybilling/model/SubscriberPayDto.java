package ru.bootcamp.babybilling.model;

import lombok.Data;

@Data
public class SubscriberPayDto {
    private String msisdn;
    private Integer money;
}
