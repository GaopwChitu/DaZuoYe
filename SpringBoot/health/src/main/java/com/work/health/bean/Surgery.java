package com.work.health.bean;

import lombok.Data;

import java.util.Date;

@Data
public class Surgery {
    private int id;
    private int healthyId;
    private int olderId;
    private String skin;
    private String lymph;
    private String thyroid;
    private String spine;
    private String limb;
    private String joint;
    private String head;
    private String eye;
    private String ears;
    private String nose;
    private String oralCavity;
    private String throat;
    private String workId;
    private int createId;
    private Date createTime;
    private int updateId;
    private Date updateTime;
}
