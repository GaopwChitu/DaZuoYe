package com.work.health.service;

import com.work.health.bean.Activities;
import com.work.health.bean.Join;

import java.util.List;

public interface ActivitiesService {

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
    public String deleteActive(Activities activities);

    /**
     * 修改
     * 
     * @param activities
     * @return
     */
    public String updateActive(Activities activities);

    /**
     * 添加
     * 
     * @param activities
     * @return
     */
    public String insertActive(Activities activities);

    /**
     * 添加参与者
     * 
     * @param join
     * @return
     */
    public String addJoinList(Join join);

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
    public String deleteJoins(Join join);

    /**
     * 根据join记录ID删除参赛者（管理员操作）
     * 
     * @param id join记录的主键ID
     * @return
     */
    public String deleteJoinById(int id);
}
