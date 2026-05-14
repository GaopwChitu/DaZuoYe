package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Medical {
    private int id;
    private String businessNo;
    private String roleId;
    private String doctor;
    private String username;
    private String businessType;
    private String businessContent;
    private String businessOrganization;
    private String businessStatus;
    private double price;
    private String createId;
    private Date createTime;
    private int total;
    private int pageNum = 1;//当前页
    private int pageSize = 10;//没页最大数
    private int pageStart;
}
