package com.work.health.service.impl;

import com.work.health.bean.Stacked;
import com.work.health.bean.Welcome;
import com.work.health.dao.WelcomeDao;
import com.work.health.service.WelcomeService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WelcomeServiceImpl implements WelcomeService {
    @Resource
    private WelcomeDao welcomeDao;

    /**
     * 获取数量
     * @return
     */
    @Override
    public Welcome getCount() {
        return welcomeDao.getCount();
    }

    /**
     * 添加留言
     * @param welcome
     * @return
     */
    @Override
    public String insertNews(Welcome welcome) {
        int i = welcomeDao.insertNews(welcome);
        return i > 0 ? "success" : "error";
    }

    /**
     * 获取留言列表
     * @param welcome
     * @return
     */
    public List<Welcome> getNewsList(Welcome welcome){
        return welcomeDao.getNewsList(welcome);
    }

    /**
     * 获取堆积图数据
     * @return
     */
    @Override
    public List<Stacked> getStackedList(){
        return welcomeDao.getStackedList();
    }
}
