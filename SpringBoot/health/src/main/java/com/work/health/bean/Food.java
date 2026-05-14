package com.work.health.bean;

import lombok.Data;

@Data
public class Food {
    private int id;
    private String communityCd;
    private String restaurant;
    private String foodName;
    private String foodImgUrl;
    private String foodPrice;
    private int total;
    private String createId;
}
