package com.ocpap.rest.service;

import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.entity.ReturnOrder;
import com.ocpap.rest.util.Page;

public interface ReturnService {

    int delete(Integer id);

    int insert(ReturnOrder returnOrder);

    int update(ReturnOrder returnOrder);

    Page<ReturnOrder> findByPage(QueryVo vo);

    ReturnOrder findById(Integer id);

    ReturnOrder findByOid(Integer id);
}
