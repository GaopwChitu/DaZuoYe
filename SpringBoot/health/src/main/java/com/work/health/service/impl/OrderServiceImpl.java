package com.work.health.service.impl;

import com.work.health.bean.Customer;
import com.work.health.bean.Order;
import com.work.health.dao.OrderDao;
import com.work.health.service.OrderService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderDao orderDao;

    /**
     * 获取代购单列表
     * 
     * @param order
     * @return
     */
    @Override
    public List<Order> getOrderList(Order order) {
        int pageStart = (order.getPageNum() - 1) * order.getPageSize();// 分页
        order.setPageStart(pageStart);
        return orderDao.getOrderList(order);
    }

    /**
     * 删除订单
     * 
     * @param order
     * @return
     */
    @Override
    public String deleteById(Order order) {
        int i = orderDao.deleteById(order);
        return i > 0 ? "success" : "error";
    }

    /**
     * 删除购买人
     * 
     * @param order
     * @return
     */
    @Override
    public String deleteCustomer(Order order) {
        int i = orderDao.deleteCustomer(order);
        return i > 0 ? "success" : "error";
    }

    /**
     * 获取团购名单
     * 
     * @param customer
     * @return
     */
    @Override
    public List<Customer> getCustomerList(Customer customer) {
        return orderDao.getCustomerList(customer);
    }

    /**
     * 添加订单信息
     * 
     * @param order
     * @return
     */
    @Override
    public String insertOrders(Order order) {
        // 初始状态为进行中(status=1)
        order.setOrderStatus("1");
        Customer customer = new Customer();
        customer.setOrderNo(order.getOrderNo());
        customer.setUserId(order.getUserId());
        customer.setNumber(order.getNumber());
        customer.setOrderCustomer(order.getOrderCustomer());
        Order o = new Order();
        List<Order> list = orderDao.getOrderList(o);
        boolean flag = false;
        for (int i = 0; i < list.size(); i++) {
            if (order.getGoodsId().equals(list.get(i).getGoodsId())) {
                customer.setOrderNo(list.get(i).getOrderNo());
                flag = true;
            }
        }
        if (flag) {
            orderDao.updateOrderNumber(order.getNumber(), order.getGoodsId(), customer.getOrderNo());
        } else {
            int i = orderDao.insertOrders(order);
            if (i == 0) {
                return "error";
            }
        }
        int j = orderDao.insertCustomer(customer);
        int x = orderDao.updateShopNumber(order.getNumber(), order.getGoodsId());
        if (x == 0) {
            return "error";
        }
        return j > 0 ? "success" : "error";
    }

    /**
     * 修改订单状态
     * 
     * @param order
     * @return
     */
    @Override
    public String updateStatus(Order order) {
        int i = orderDao.updateStatus(order);
        return i > 0 ? "success" : "error";
    }

}
