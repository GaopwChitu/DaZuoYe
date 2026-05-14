package com.work.health.bean;

import lombok.Data;

@Data
public class Join {
    private int id;
    private String joinId;
    private String joinName;
    private String joinTime;
    private int activeId;
    private boolean flag;
}
