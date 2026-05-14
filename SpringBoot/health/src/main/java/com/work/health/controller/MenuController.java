package com.work.health.controller;

import com.alibaba.fastjson.JSON;
import com.work.health.bean.MainMenu;
import com.work.health.dao.MenuDao;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class MenuController {
    @Resource
    MenuDao menuDao;

    @RequestMapping("/menus")
    public String getAllMenus(Integer id){
        HashMap<String ,Object> data = new HashMap<>();
        List<MainMenu> menus = menuDao.getMenus(id);
        if(menus!=null){
            data.put("menus", menus);
            data.put("flag", 200);
        }else {
            data.put("flag", 404);
        }
        String data_json = JSON.toJSONString(data);
        return data_json;
    }
}