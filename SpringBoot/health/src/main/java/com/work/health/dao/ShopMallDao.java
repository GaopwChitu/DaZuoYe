package com.work.health.dao;

import com.work.health.bean.ShopMall;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopMallDao {

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
    public int addGoods(ShopMall shopMall);

    /**
     * 删除商品
     * @param shopMall
     * @return
     */
    public int deleteGoodsById(ShopMall shopMall);
}
