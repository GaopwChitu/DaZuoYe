package com.work.health.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.work.health.bean.SportInfo;
import com.work.health.dao.SportInfoDao;
import com.work.health.service.SportInfoService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SportInfoServiceImpl extends ServiceImpl<SportInfoDao, SportInfo> implements SportInfoService { // 实现 SportInfoService 接口

    @Resource
    private SportInfoDao sportInfoDao;


    @Override
    public List<SportInfo> getAllSportInfos() {
        return sportInfoDao.selectList(null);
    }

    @Transactional
    @Override
    public boolean addSport(SportInfo sport) {
        QueryWrapper<SportInfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sport_type", sport.getSportType());
        List<SportInfo> list = this.baseMapper.selectList(queryWrapper);

        if (list.isEmpty()) {
            this.baseMapper.insert(sport);
            return true;
        } else {
            return false;
        }
    }


    @Override
    public void updateSport(SportInfo sport) {
        this.baseMapper.updateById(sport);
    }

    @Override
    public SportInfo getSportById(Integer id) {
        SportInfo sportInfo = this.baseMapper.selectById(id);
        return sportInfo;
    }

    @Override
    public void deleteUserById(Integer id) {
        this.baseMapper.deleteById(id);
    }












}
