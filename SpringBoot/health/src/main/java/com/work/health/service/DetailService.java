package com.work.health.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.work.health.bean.Detail;

import java.util.List;

public interface DetailService extends IService<Detail> {
    List<Detail> getDetailInfo(String sportName);

    void updateDetail(Detail detail);

    Detail getDetailById(Integer id);

    void deleteDetailById(Integer id);

    boolean addDetail(Detail detail);
}
