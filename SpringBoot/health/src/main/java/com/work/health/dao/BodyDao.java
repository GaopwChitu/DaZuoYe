package com.work.health.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.work.health.bean.Body;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BodyDao extends BaseMapper<Body> {
    List<Body> getBodyListByUserId(@Param("pid") Integer pid);
}
