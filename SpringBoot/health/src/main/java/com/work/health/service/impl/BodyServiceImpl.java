package com.work.health.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.work.health.bean.Body;
import com.work.health.dao.BodyDao;
import com.work.health.service.BodyService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BodyServiceImpl extends ServiceImpl<BodyDao, Body> implements BodyService {

    @Resource
    private BodyDao bodyDao;

    @Override
    public boolean insert(Body body) {
        LambdaQueryWrapper<Body> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Body::getId, body.getId());
        int count = this.baseMapper.selectCount(wrapper).intValue();
        if (count > 0) {
            this.baseMapper.update(body, wrapper);
            return false;
        } else {
            this.baseMapper.insert(body);
            return true;
        }
    }

    @Override
    public void update(Body body) {
        this.baseMapper.updateById(body);
    }


    @Override
    public List<Body> getBodyListByUserId(Integer pid) {
        return bodyDao.getBodyListByUserId(pid);
    }


    @Override
    public Body getBodyById(Integer id) {
        return this.baseMapper.selectById(id);
    }

    @Override
    public void updateBody(Body body) {
        this.baseMapper.updateById(body);
    }

    @Override
    public void deleteBodyById(Integer id) {
        this.baseMapper.deleteById(id);
    }
}
