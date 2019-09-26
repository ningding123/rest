package com.ocpap.rest.serviceImpl;

import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.entity.ReturnOrder;
import com.ocpap.rest.mapper.ReturnMapper;
import com.ocpap.rest.service.ReturnService;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReturnServiceImpl implements ReturnService {

    @Autowired
    private ReturnMapper returnMapper;

    @Override
    public int delete(Integer id) {
        return returnMapper.delete(id);
    }

    @Override
    public int insert(ReturnOrder returnOrder) {
        return returnMapper.insert(returnOrder);
    }

    @Override
    public int update(ReturnOrder returnOrder) {
        return returnMapper.update(returnOrder);
    }

    @Override
    public Page<ReturnOrder> findByPage(QueryVo vo) {
        return null;
    }

    @Override
    public ReturnOrder findById(Integer id) {
        return returnMapper.findById(id);
    }

    @Override
    public ReturnOrder findByOid(Integer id) {
        return returnMapper.findByOid(id);
    }
}
