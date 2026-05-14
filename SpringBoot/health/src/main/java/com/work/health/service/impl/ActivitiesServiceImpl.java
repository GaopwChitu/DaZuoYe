package com.work.health.service.impl;

import com.work.health.bean.Activities;
import com.work.health.bean.Join;
import com.work.health.dao.ActivitiesDao;
import com.work.health.service.ActivitiesService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivitiesServiceImpl implements ActivitiesService {

    @Resource
    private ActivitiesDao activitiesDao;

    /**
     * 活动列表
     * 
     * @param activities
     * @return
     */
    @Override
    public List<Activities> getActiveList(Activities activities) {
        int pageStart = (activities.getPageNum() - 1) * activities.getPageSize();// 分页
        activities.setPageStart(pageStart);
        return activitiesDao.getActiveList(activities);
    }

    /**
     * 活动详情
     * 
     * @param id
     * @return
     */
    @Override
    public Activities getActiveInfo(int id) {
        return activitiesDao.getActiveInfo(id);
    }

    /**
     * 删除
     * 
     * @param activities
     * @return
     */
    @Override
    public String deleteActive(Activities activities) {
        int i = activitiesDao.deleteActive(activities);
        return i > 0 ? "success" : "error";
    }

    /**
     * 修改
     * 
     * @param activities
     * @return
     */
    @Override
    public String updateActive(Activities activities) {
        int i = activitiesDao.updateActive(activities);
        return i > 0 ? "success" : "error";
    }

    /**
     * 新增
     * 
     * @param activities
     * @return
     */
    @Override
    public String insertActive(Activities activities) {
        int i = activitiesDao.insertActive(activities);
        return i > 0 ? "success" : "error";
    }

    /**
     * 添加参与者
     * 
     * @param join
     * @return
     */
    @Override
    public String addJoinList(Join join) {
        List<Join> lists = activitiesDao.getJoinList(join);
        for (int i = 0; i < lists.size(); i++) {
            if (join.getJoinId().equals(lists.get(i).getJoinId())
                    && join.getJoinName().equals(lists.get(i).getJoinName())) {
                return "已报名";
            }
        }
        join.setFlag(true);
        activitiesDao.updateJoinNumber(join.getActiveId(), join.isFlag());
        int i = activitiesDao.addJoinList(join);
        return i > 0 ? "success" : "error";
    }

    /**
     * 获取参赛者名单
     * 
     * @param join
     * @return
     */
    @Override
    public List<Join> getJoinList(Join join) {
        return activitiesDao.getJoinList(join);
    }

    /**
     * 删除参赛者
     * 
     * @param join
     * @return
     */
    @Override
    public String deleteJoins(Join join) {
        join.setFlag(false);
        activitiesDao.updateJoinNumber(join.getActiveId(), join.isFlag());
        int i = activitiesDao.deleteJoins(join);
        return i > 0 ? "success" : "error";
    }

    /**
     * 根据join记录ID删除参赛者（管理员操作）
     * 
     * @param id join记录的主键ID
     * @return
     */
    @Override
    public String deleteJoinById(int id) {
        Join join = activitiesDao.getJoinById(id);
        if (join == null) {
            return "error";
        }
        join.setFlag(false);
        activitiesDao.updateJoinNumber(join.getActiveId(), join.isFlag());
        int i = activitiesDao.deleteJoinById(id);
        return i > 0 ? "success" : "error";
    }
}
