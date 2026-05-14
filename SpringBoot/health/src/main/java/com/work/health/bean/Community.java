package com.work.health.bean;

import lombok.Data;


import java.util.Date;

@Data
public class Community {
    private int id;
    private String communityCd;
    private String communityName;
    private String communityPlace;
    private String communityArea;
    private int peopleNumber;
    private int total;
    private boolean state;//状态
    private Date updateTime;
    private int pageNum = 1;//当前页
    private int pageSize = 10;//没页最大数
    private int pageStart;
}
