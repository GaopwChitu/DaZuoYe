package com.work.health.dao;

import com.work.health.bean.CommunityRestaurant;
import com.work.health.bean.Food;
import com.work.health.bean.FoodOrder;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FoodOrderDao {

    /**
     * 获取餐饮订单
     * @param foodOrder
     * @return
     */
    public List<FoodOrder> getFoodOrderList(FoodOrder foodOrder);

    /**
     * 查询社区下是否已存在同名餐厅
     */
    public int countRestaurantByName(CommunityRestaurant communityRestaurant);

    // 删除餐厅
    public void deleteRestaurant(@Param("communityCd") String communityCd,
                          @Param("restaurant") String restaurant);

    // 删除该餐厅下所有菜品
    public void deleteFoodByRestaurant(@Param("communityCd") String communityCd,
                                @Param("restaurant") String restaurant);

    /**
     * 添加餐厅
     * @param communityRestaurant
     * @return
     */
    public int insertRestaurant(CommunityRestaurant communityRestaurant);

    /**
     * 获取餐厅下拉框
     * @param communityRestaurant
     * @return
     */
    public List<CommunityRestaurant> getRestaurants(CommunityRestaurant communityRestaurant);

    /**
     * 添加菜品
     * @param food
     * @return
     */
    public int insertFood(Food food);

    /**
     * 菜品列表
     * @param food
     * @return
     */
    public List<Food> getFoodList(Food food);

    /**
     * 添加餐饮订单
     * @param foodOrder
     * @return
     */
    public int insertFoodOrder(FoodOrder foodOrder);

    /**
     * 删除菜品订单
     * @param foodOrder
     * @return
     */
    public int deleteFoodOrderById(FoodOrder foodOrder);


    /**
     * 删除菜
     * @param food
     * @return
     */
    public int deleteFoodById(Food food);

    /**
     * 修改订单状态
     * @param foodOrder
     * @return
     */
    public int updateStatus(FoodOrder foodOrder);
}
