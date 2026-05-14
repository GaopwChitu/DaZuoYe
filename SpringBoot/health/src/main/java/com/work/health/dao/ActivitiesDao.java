package com.work.health.dao;

import com.work.health.bean.Activities;
import com.work.health.bean.Join;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActivitiesDao {

    /**
     * 活动列表
     * 
     * @param activities
     * @return
     */
    public List<Activities> getActiveList(Activities activities);

    /**
     * 活动详情
     * 
     * @param id
     * @return
     */
    public Activities getActiveInfo(int id);

    /**
     * 删除
     * 
     * @param activities
     * @return
     */
    public int deleteActive(Activities activities);

    /**
     * 修改
     * 
     * @param activities
     * @return
     */
    public int updateActive(Activities activities);

    /**
     * 添加
     * 
     * @param activities
     * @return
     */
    public int insertActive(Activities activities);

    /**
     * 添加参与者
     * 
     * @param join
     * @return
     */
    public int addJoinList(Join join);

    /**
     * 修改人数
     * 
     * @param id
     * @return
     */
    public int updateJoinNumber(int id, boolean flag);

    /**
     * 获取参赛者名单
     * 
     * @param join
     * @return
     */
    public List<Join> getJoinList(Join join);

    /**
     * 删除参赛者
     * 
     * @param join
     * @return
     */
    public int deleteJoins(Join join);

    /**
     * 根据join记录ID查询参赛者
     * 
     * @param id
     * @return
     */
    public Join getJoinById(int id);

    /**
     * 根据join记录ID删除参赛者
     * 
     * @param id
     * @return
     */
    public int deleteJoinById(int id);

}
