package com.work.health.controller;

import com.work.health.bean.Assess;
import com.work.health.service.AssessService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/assess")
public class AssessController {
    @Resource
    private AssessService assessService;

    /**
     * 添加评价
     * @param assess
     * @return
     */
    @PostMapping("/addAssess")
    public String insertAssess(@RequestBody Assess assess){
        return assessService.insertAssess(assess);
    }

    /**
     * 获取数量
     * @return
     */
    @GetMapping("/count")
    public Assess getCount(){
        return assessService.getCount();
    }
}
