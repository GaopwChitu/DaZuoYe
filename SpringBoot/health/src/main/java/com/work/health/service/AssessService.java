package com.work.health.service;

import com.work.health.bean.Assess;

public interface AssessService {
    /**
     * 添加评价
     * @param assess
     * @return
     */
    public String insertAssess(Assess assess);

    /**
     * 获取数量
     * @return
     */
    public Assess getCount();
}
