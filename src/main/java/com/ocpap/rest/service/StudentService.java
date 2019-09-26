package com.ocpap.rest.service;

import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.entity.Student;
import com.ocpap.rest.util.Page;

import java.util.List;

public interface StudentService {

    int insert(Student student);

    int update(Student student);

    Page<Student> findByStudent(QueryVo vo);

    Student findById(Integer id);

    int delete(Integer id);

    List<Student> findAll(QueryVo vo);
}
