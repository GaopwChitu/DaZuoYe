package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Activities {
    private int id;
    private String joinId;
    private String activeName;
    private String activeTime;
    private String duration;
    private String activeArea;
    private String activeStyle;
    private String createName;
    private int activeNumber;
    private int total;
    private String createId;
    private Date createTime;
    private String updateId;
    private Date updateTime;
    private int pageNum = 1;//当前页
    private int pageSize = 10;//没页最大数
    private int pageStart;
}
