package com.work.health.controller;

import com.work.health.service.PieService;
import com.work.health.bean.Pie;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/Pie")
public class PieController {
    @Resource
    private PieService pieService;

    /**
     * 获取数量
     * @return
     */
    @GetMapping("count")
    public Pie getCount(){
        return pieService.getCount();
    }

}
