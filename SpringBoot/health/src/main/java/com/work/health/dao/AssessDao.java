package com.work.health.dao;

import com.work.health.bean.Assess;
import org.springframework.stereotype.Repository;

@Repository
public interface AssessDao {

    /**
     * 添加评价
     * @param assess
     * @return
     */
    public int insertAssess(Assess assess);

    /**
     * 修改监护人表
     * @param workId
     * @return
     */
    public int updateUserAssess(String workId);

    /**
     * 修改员工列表
     * @param workId
     * @return
     */
    public int updateWorkerAssess(String workId);


    /**
     * 获取数量
     * @return
     */
    public Assess getCount();
}
