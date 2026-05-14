package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Welcome {
    private int userNumber = 0;
    private int newsNumber = 0;
    private int communityNumber = 0;
    private int orderNumber = 0;
    private int id;
    private String username;
    private String news;
    private Date createTime;
}
