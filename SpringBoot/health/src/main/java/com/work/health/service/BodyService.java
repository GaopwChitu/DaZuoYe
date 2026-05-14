package com.work.health.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.work.health.bean.Body;

import java.util.List;

public interface BodyService extends IService<Body> {

    boolean insert(Body body);

    void update(Body body);

    List<Body> getBodyListByUserId(Integer pid);

    Body getBodyById(Integer id);

    void updateBody(Body body);

    void deleteBodyById(Integer id);

}
