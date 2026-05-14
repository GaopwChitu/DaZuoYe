package com.work.health.bean;

import lombok.Data;

@Data
public class Hospital {
    private int id;
    private String hospitalId;
    private String hospitalName;
    private String logo;
    private String address;
    private String grade;
    private String registerTime;
    private String createId;
    private String updateId;
    private int total;
    private int pageNum = 1;//当前页
    private int pageSize = 6;//没页最大数
    private int pageStart;

}
