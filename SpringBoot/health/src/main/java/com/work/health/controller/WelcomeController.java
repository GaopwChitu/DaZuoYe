package com.work.health.controller;

import com.work.health.bean.Stacked;
import com.work.health.bean.Welcome;
import com.work.health.service.WelcomeService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/Welcome")
public class WelcomeController {
    @Resource
    private WelcomeService service;

    /**
     * 获取数量
     * @return
     */
    @GetMapping("/number")
    public Welcome getCount() {
        return service.getCount();
    }

    /**
     * 添加留言
     * @param welcome
     * @return
     */
    @PostMapping("/news")
    public String insertNews(@RequestBody Welcome welcome){
        return service.insertNews(welcome);
    }

    /**
     * 获取留言列表
     * @param welcome
     * @return
     */
    @GetMapping("/list")
    public List<Welcome> getNewsList(Welcome welcome){
        return service.getNewsList(welcome);
    }

    /**
     * 获取堆积图数据
     * @return
     */
    @GetMapping("/stackedList")
    public List<Stacked> getStackedList(){
        return service.getStackedList();
    }
}
