package com.work.health.service.impl;

import com.work.health.bean.Pie;
import com.work.health.dao.PieDao;
import com.work.health.service.PieService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;


@Service
public class PieServiceImpl implements PieService {
    @Resource
    private PieDao pieDao;

    /**
     * 获取数量
     * @return
     */
    public Pie getCount(){
        return pieDao.getCount();
    }
}
