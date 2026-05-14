package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Order {
    private int id;
    private String goodsId;
    private String userId;
    private String orderNo;
    private String goodsName;
    private String shopName;
    private String imgUrl;
    private String orderPrice;
    private int orderNumber;
    private int number;
    private String orderCustomer;
    private String orderStatus;
    private Date createTime;
    private String createId;
    private String updateId;
    private String role;
    private int total;
    private int pageNum = 1;// 当前页
    private int pageSize = 10;// 没页最大数
    private int pageStart;
}
