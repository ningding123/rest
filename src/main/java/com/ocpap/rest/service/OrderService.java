package com.ocpap.rest.service;

import com.ocpap.rest.entity.Order;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.util.Page;

public interface OrderService {

    int insert(Order order);

    int update(Order order);

    Order findById(Integer id);

    Page<Order> findByPage(QueryVo vo);

    int delete(Integer id);
}
