package com.work.health.service.impl;

import com.work.health.bean.CommunityRestaurant;
import com.work.health.bean.Food;
import com.work.health.bean.FoodOrder;
import com.work.health.dao.FoodOrderDao;
import com.work.health.service.FoodOrderService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class FoodOrderServiceImpl implements FoodOrderService {

    @Resource
    private FoodOrderDao foodOrderDao;

    /**
     * 获取餐饮订单
     * @param foodOrder
     * @return
     */
    @Override
    public List<FoodOrder> getFoodOrderList(FoodOrder foodOrder) {
        int pageStart = (foodOrder.getPageNum() - 1) * foodOrder.getPageSize();//分页
        foodOrder.setPageStart(pageStart);
        return foodOrderDao.getFoodOrderList(foodOrder);
    }

    @Override
    public void deleteRestaurant(String communityCd, String restaurant) {
        foodOrderDao.deleteRestaurant(communityCd, restaurant);
    }

    @Override
    public void deleteFoodByRestaurant(String communityCd, String restaurant) {
        foodOrderDao.deleteFoodByRestaurant(communityCd, restaurant);
    }

    /**
     * 添加餐厅
     * @param communityRestaurant
     * @return
     */
    @Override
    public String insertRestaurant(CommunityRestaurant communityRestaurant) {
        // 1. 查询是否已存在
        int count = foodOrderDao.countRestaurantByName(communityRestaurant);
        if (count > 0) {
            return "exists"; // 代表已存在
        }

        // 2. 不存在才添加
        int i = foodOrderDao.insertRestaurant(communityRestaurant);
        return i > 0 ? "success" : "error";
    }

    /**
     * 获取餐厅下拉框
     * @param communityRestaurant
     * @return
     */
    @Override
    public List<CommunityRestaurant> getRestaurants(CommunityRestaurant communityRestaurant) {
        return foodOrderDao.getRestaurants(communityRestaurant);
    }

    /**
     * 添加菜品
     * @param food
     * @return
     */
    @Override
    public String insertFood(Food food) {
        int i = foodOrderDao.insertFood(food);
        return i > 0 ? "success" : "error";
    }

    /**
     * 菜品列表
     * @param food
     * @return
     */
    @Override
    public List<Food> getFoodList(Food food){
        return foodOrderDao.getFoodList(food);
    }

    /**
     * 添加餐饮订单
     * @param foodOrder
     * @return
     */
    @Override
    public String insertFoodOrder(FoodOrder foodOrder){
        int i = foodOrderDao.insertFoodOrder(foodOrder);
        return i > 0 ? "success" : "error";
    }

    /**
     * 删除菜品订单
     * @param foodOrder
     * @return
     */
    @Override
    public String deleteFoodOrderById(FoodOrder foodOrder){
        int i = foodOrderDao.deleteFoodOrderById(foodOrder);
        return i > 0 ? "success" : "error";
    }

    /**
     * 删除菜
     * @param food
     * @return
     */
    @Override
    public String deleteFoodById(Food food){
        int i = foodOrderDao.deleteFoodById(food);
        return i > 0 ? "success" : "error";
    }

    /**
     * 修改订单状态
     * @param foodOrder
     * @return
     */
    @Override
    public String updateStatus(FoodOrder foodOrder){
        int i = foodOrderDao.updateStatus(foodOrder);
        return i > 0 ? "success" : "error";
    }
}
