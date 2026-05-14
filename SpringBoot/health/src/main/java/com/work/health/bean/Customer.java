package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Customer {
    private int id;
    private String orderNo;
    private String userId;
    private String orderCustomer;
    private Date orderTime;
    private int number;
    private boolean flag;
}
