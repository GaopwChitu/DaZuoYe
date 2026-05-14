package com.work.health.controller;

import com.work.health.service.OrderService;
import com.work.health.bean.Customer;
import com.work.health.bean.Order;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Resource
    private OrderService orderService;

    /**
     * 订单列表
     * @param order
     * @return
     */
    @GetMapping("/list")
    public List<Order> getOrderList(Order order){
        return orderService.getOrderList(order);
    }

    /**
     * 删除订单
     * @param order
     * @return
     */
    @PostMapping("/deleteById")
    public String deleteById(Order order){
        return orderService.deleteById(order);
    }

    /**
     * 删除购买人
     * @param order
     * @return
     */
    @PostMapping("/deleteCustomer")
    public String deleteCustomer(Order order){
        return orderService.deleteCustomer(order);
    }


    /**
     * 添加订单信息
     * @param order
     * @return
     */
    @PostMapping("/insertOrder")
    public String insertOrders(@RequestBody Order order){
        return orderService.insertOrders(order);
    }

    /**
     * 获取团购名单
     * @param customer
     * @return
     */
    @GetMapping("/customerList")
    public List<Customer> getCustomerList(Customer customer){
        return orderService.getCustomerList(customer);
    }

    /**
     * 修改订单状态
     * @param order
     * @return
     */
    @PostMapping("/updateStatus")
    public String updateStatus(Order order){
        return orderService.updateStatus(order);
    }

}
