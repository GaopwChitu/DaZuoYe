package com.work.health.dao;

import com.work.health.bean.Pie;
import org.springframework.stereotype.Repository;

@Repository
public interface PieDao {
    /**
     * 获取数量
     * @return
     */
    public Pie getCount();
}
