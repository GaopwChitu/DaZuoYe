package com.work.health.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.work.health.bean.Community;
import com.work.health.bean.User;

import java.util.List;
import java.util.Map;

public interface UserService extends IService<User> {
    Map<String, Object> getBodyInfo(Integer id);

    Map<String, Object> register(User register);

    public List<Community> selectAddress();

}
