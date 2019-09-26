package com.ocpap.rest.serviceImpl;

import com.ocpap.rest.entity.Order;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.mapper.OrderMapper;
import com.ocpap.rest.service.OrderService;
import com.ocpap.rest.util.Instant;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int insert(Order order) {
        return orderMapper.insert(order);
    }

    @Override
    public int update(Order order) {
        return orderMapper.update(order);
    }

    @Override
    public Order findById(Integer id) {
        return orderMapper.findById(id);
    }

    @Override
    public Page<Order> findByPage(QueryVo vo) {
        Page<Order> page = new Page<Order>();
        //每页数

        vo.setSize(Instant.NEWSSIZE);
        if (null != vo) {
            // 判断当前页
            if (null != vo.getPage()) {
                page.setPage(vo.getPage());
                vo.setStartRow((vo.getPage() -1)*vo.getSize());
            }
            //总条数
            page.setTotal(orderMapper.count(vo));
            page.setRows(orderMapper.findAll(vo));
        }
        return page;
    }

    @Override
    public int delete(Integer id) {
        return orderMapper.delete(id);
    }
}
