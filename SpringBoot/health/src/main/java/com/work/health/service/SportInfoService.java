package com.work.health.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.work.health.bean.SportInfo;

import java.util.List;

public interface SportInfoService extends IService<SportInfo> {
    //获取所有运动种类信息
    List<SportInfo> getAllSportInfos();

//    //根据适宜心率获取运动种类信息
//    List<SportInfo> getSportInfosBySuitableHeartRate(int heartRate);
//
//    //根据适宜时间和适宜频率获取运动种类信息
//    List<SportInfo> getSportInfosBySuitableTimeAndFrequency(int time, int frequency);
//
//    //根据推荐速度范围获取运动种类信息
//    List<SportInfo> getSportInfosByRecommendedSpeedRange(int minSpeed, int maxSpeed);

    boolean addSport(SportInfo sport);

    void updateSport(SportInfo sport);

    SportInfo getSportById(Integer id);

    void deleteUserById(Integer id);
}
