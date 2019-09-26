package com.ocpap.rest.mapper;

import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.entity.Student;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface StudentMapper {

    int insert(Student student);

    int update(Student student);

    List<Student> findAll(QueryVo vo);

    int count(QueryVo vo);

    Student findById(Integer id);

    int delete(Integer id);

    List<Student> findAllStudent();
}
