package com.work.health.service;

import com.work.health.bean.Stacked;
import com.work.health.bean.Welcome;

import java.util.List;

public interface WelcomeService {

    /**
     * 获取数量
     * @return
     */
    public Welcome getCount();


    /**
     * 添加留言
     * @param welcome
     * @return
     */
    public String insertNews(Welcome welcome);

    /**
     * 获取留言列表
     * @param welcome
     * @return
     */
    public List<Welcome> getNewsList(Welcome welcome);

    /**
     * 获取堆积图数据
     * @return
     */
    public List<Stacked> getStackedList();

}
