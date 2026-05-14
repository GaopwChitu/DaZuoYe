package com.work.health.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.work.health.bean.Body;
import com.work.health.bean.Community;
import com.work.health.bean.User;
import com.work.health.dao.UserDao;
import com.work.health.service.BodyService;
import com.work.health.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {

    @Autowired
    protected BodyService bodyService;

    @Autowired
    protected UserDao userDao;

    @Override
    public Map<String, Object> getBodyInfo(Integer id) {
        Map<String, Object> data = new HashMap<>();
        data.put("id", id);
        Integer pid = (Integer) data.get("id");
        List<Body> bodyList = bodyService.getBodyListByUserId(pid);
        Map<String, Object> result = new HashMap<>();
        result.put("bodyList", bodyList);
        return result;
    }

    @Override
    public Map<String, Object> register(User user) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        Map<String, Object> map = new HashMap<>();
        // 查询用户名是否已存在
        wrapper.eq(User::getUsername, user.getUsername());
        Long count = this.baseMapper.selectCount(wrapper);
        if (count > 0) {
            map.put("fail", false);
        } else {
            user.setAvatar("https://bpic.51yuansu.com/pic2/cover/00/35/43/58119f542530c_610.jpg");
            user.setRole("用户");
            int result = this.baseMapper.insert(user);
            if (result > 0) {
                map.put("success", true);
            } else {
                map.put("fail", false);
            }
        }
        return map;
    }

    @Override
    public List<Community> selectAddress() {
        return userDao.selectAddress();
    }
}
