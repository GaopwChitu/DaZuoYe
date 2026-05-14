package com.work.health.controller;

import com.work.health.service.ShopMallService;
import com.work.health.bean.ShopMall;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/shop")
public class ShopMallController {

    @Resource
    private ShopMallService shopMallService;

    /**
     * 获取商品列表
     * @param shopMall
     * @return
     */
    @GetMapping("/list")
    public List<ShopMall> getGoodsList(ShopMall shopMall){
        return shopMallService.getGoodsList(shopMall);
    }

    /**
     * 添加商品
     * @param shopMall
     * @return
     */
    @PostMapping("/addGoods")
    public String addGoods(@RequestBody ShopMall shopMall){
        return shopMallService.addGoods(shopMall);
    }


    /**
     * 删除商品
     * @param shopMall
     * @return
     */
    @PostMapping("/deleteById")
    public String deleteGoodsById(ShopMall shopMall){
        return shopMallService.deleteGoodsById(shopMall);
    }


}
