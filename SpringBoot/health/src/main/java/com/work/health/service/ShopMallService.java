package com.work.health.service;

import com.work.health.bean.ShopMall;

import java.util.List;

public interface ShopMallService {

    /**
     * 获取商品列表
     * @param shopMall
     * @return
     */
    public List<ShopMall> getGoodsList(ShopMall shopMall);

    /**
     * 添加商品
     * @param shopMall
     * @return
     */
    public String addGoods(ShopMall shopMall);

    /**
     * 删除商品
     * @param shopMall
     * @return
     */
    public String deleteGoodsById(ShopMall shopMall);
}
