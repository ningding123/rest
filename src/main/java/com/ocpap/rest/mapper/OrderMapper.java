package com.ocpap.rest.mapper;

import com.ocpap.rest.entity.Order;
import com.ocpap.rest.entity.QueryVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {

    int insert(Order order);

    int update(Order order);

    Order findById(Integer id);

    List<Order> findAll(QueryVo vo);

    int count(QueryVo vo);

    int delete(Integer id);
}
