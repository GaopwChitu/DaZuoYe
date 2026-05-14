package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Assess {
    private int id;
    private String assess;
    private String createName;
    private Date createTime;
    private String workId;
    private String roleId;
    private String veryPoor;
    private String disappointed;
    private String generally;
    private String satisfy;
    private String surprise;
}
