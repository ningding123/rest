package com.ocpap.rest.mapper;

import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.entity.ReturnOrder;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ReturnMapper {

    int insert(ReturnOrder returnOrder);

    int update(ReturnOrder returnOrder);

    int delete(Integer id);

    List<ReturnOrder> findAll(QueryVo vo);

    int count(QueryVo vo);

    ReturnOrder findById(Integer id);

    ReturnOrder findByOid(Integer oid);
}
