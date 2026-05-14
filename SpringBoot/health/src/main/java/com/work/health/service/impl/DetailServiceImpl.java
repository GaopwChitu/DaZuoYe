package com.work.health.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.work.health.bean.Detail;
import com.work.health.dao.DetailDao;
import com.work.health.service.DetailService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DetailServiceImpl extends ServiceImpl<DetailDao, Detail> implements DetailService {


    @Override
    public List<Detail> getDetailInfo(String sportName) {
        LambdaQueryWrapper<Detail> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Detail::getSportType, sportName);
        return this.list(queryWrapper);
    }




    @Transactional
    @Override
    public boolean addDetail(Detail detail) {
        QueryWrapper<Detail> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sport_type", detail.getSportType());
        List<Detail> list = this.baseMapper.selectList(queryWrapper);
        if (list.isEmpty()) {
            this.baseMapper.insert(detail);
            return true;
        } else {
            return false;
        }
    }


    @Override
    public void updateDetail(Detail detail) {
        // 更新用户表中的数据
        this.baseMapper.updateById(detail);
    }

    @Override
    public Detail getDetailById(Integer id) {
        Detail detail = this.baseMapper.selectById(id);
        return detail;
    }

    @Override
    public void deleteDetailById(Integer id) {
        this.baseMapper.deleteById(id);
    }
}
