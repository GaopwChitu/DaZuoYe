package com.work.health.bean;

import lombok.Data;

@Data
public class PassW {
    private int id;
    private String oldPassword;
    private String newPassword;
    private String passwordConfirm;
}
