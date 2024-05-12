package ru.bootcamp.brt.web.model;

import lombok.Data;

@Data
public class SubscriberPayDto {
    private String msisdn;
    private Integer money;
}
