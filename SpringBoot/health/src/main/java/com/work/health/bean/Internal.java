package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Internal {
    private int id;
    private int healthyId;
    private String olderId;
    private String heartRate;
    private String bloodPressure;
    private String bloodSugar;
    private String bloodFat;
    private String pulse;
    private String liverFunction;
    private String renalFunction;
    private String bloodRoutine;
    private String urinalysis;
    private String photo;
    private String workId;
    private int createId;
    private String createTime;
    private int updateId;
    private Date updateTime;

}
