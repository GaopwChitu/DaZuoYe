package com.work.health.dao;

import com.work.health.bean.Stacked;
import com.work.health.bean.Welcome;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WelcomeDao {
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
    public int insertNews(Welcome welcome);

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
