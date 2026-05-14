package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Stacked {
    private int userCount;
    private int orderCount;
    private int newsCount;
    private Date loginTime;
}
