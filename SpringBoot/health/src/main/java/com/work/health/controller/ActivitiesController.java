package com.work.health.controller;

import com.work.health.service.ActivitiesService;
import com.work.health.bean.Activities;
import com.work.health.bean.Join;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/active")
public class ActivitiesController {

    @Resource
    private ActivitiesService activitiesService;

    /**
     * 活动列表
     * 
     * @param activities
     * @return
     */
    @GetMapping("/list")
    public List<Activities> getActiveList(Activities activities) {
        return activitiesService.getActiveList(activities);
    }

    /**
     * 活动详情
     * 
     * @param id
     * @return
     */
    @GetMapping("/info")
    public Activities getActiveInfo(int id) {
        return activitiesService.getActiveInfo(id);
    }

    /**
     * 删除
     * 
     * @param activities
     * @return
     */
    @PostMapping("/deleteById")
    public String deleteActive(Activities activities) {
        return activitiesService.deleteActive(activities);
    }

    /**
     * 修改
     * 
     * @param activities
     * @return
     */
    @PostMapping("/updateInfo")
    public String updateActive(@RequestBody Activities activities) {
        return activitiesService.updateActive(activities);
    }

    /**
     * 添加
     * 
     * @param activities
     * @return
     */
    @PostMapping("/insertActive")
    public String insertActive(@RequestBody Activities activities) {
        return activitiesService.insertActive(activities);
    }

    /**
     * 添加参与者
     * 
     * @param join
     * @return
     */
    @PostMapping("/join")
    public String addJoinList(@RequestBody Join join) {
        return activitiesService.addJoinList(join);
    }

    /**
     * 参赛者名单
     * 
     * @param join
     * @return
     */
    @GetMapping("/joinList")
    public List<Join> getJoinList(Join join) {
        return activitiesService.getJoinList(join);
    }

    /**
     * 删除参赛者
     * 
     * @param join
     * @return
     */
    @PostMapping("/deleteJoins")
    public String deleteJoins(Join join) {
        return activitiesService.deleteJoins(join);
    }

    /**
     * 根据join记录ID删除参赛者（管理员操作）
     * 
     * @param id join记录的主键ID
     * @return
     */
    @PostMapping("/deleteJoinById")
    public String deleteJoinById(int id) {
        return activitiesService.deleteJoinById(id);
    }
}
