package com.work.health.service.impl;

import com.work.health.bean.ShopMall;
import com.work.health.dao.ShopMallDao;
import com.work.health.service.ShopMallService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopMallServiceImpl implements ShopMallService {
    @Resource
    private ShopMallDao shopMallDao;

    /**
     * 获取商品列表
     * @param shopMall
     * @return
     */
    @Override
    public List<ShopMall> getGoodsList(ShopMall shopMall) {
        int pageStart = (shopMall.getPageNum() - 1) * shopMall.getPageSize();//分页
        shopMall.setPageStart(pageStart);
        return shopMallDao.getGoodsList(shopMall);
    }

    /**
     * 添加商品
     * @param shopMall
     * @return
     */
    @Override
    public String addGoods(ShopMall shopMall) {
        int i = shopMallDao.addGoods(shopMall);
        return i > 0 ? "success" : "error";
    }

    /**
     * 删除商品
     * @param shopMall
     * @return
     */
    @Override
    public String deleteGoodsById(ShopMall shopMall) {
        int i = shopMallDao.deleteGoodsById(shopMall);
        return i > 0 ? "success" : "error";
    }
}
