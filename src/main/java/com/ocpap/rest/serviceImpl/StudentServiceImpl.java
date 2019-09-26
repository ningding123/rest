package com.ocpap.rest.serviceImpl;

import com.ocpap.rest.entity.AdminAccount;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.entity.Student;
import com.ocpap.rest.mapper.StudentMapper;
import com.ocpap.rest.service.StudentService;
import com.ocpap.rest.util.Instant;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {


    @Autowired
    private StudentMapper studentMapper;
    @Override
    public int insert(Student student) {
        return studentMapper.insert(student);
    }

    @Override
    public int update(Student student) {
        return studentMapper.update(student);
    }

    @Override
    public Page<Student> findByStudent(QueryVo vo) {
        Page<Student> page = new Page<Student>();
        //每页数
        vo.setSize(Instant.NEWSSIZE);
        if (null != vo) {
            // 判断当前页
            if (null != vo.getPage()) {
                page.setPage(vo.getPage());
                vo.setStartRow((vo.getPage() -1)*vo.getSize());
            }
            if(null != vo.getAmName() && !"".equals(vo.getAmName().trim())){
                vo.setAmName(vo.getAmName().trim());
            }
            //总条数
            page.setTotal(studentMapper.count(vo));
            page.setRows(studentMapper.findAll(vo));
        }
        return page;
    }

    @Override
    public Student findById(Integer id) {
        return studentMapper.findById(id);
    }

    @Override
    public int delete(Integer id) {
        return studentMapper.delete(id);
    }

    @Override
    public List<Student> findAll(QueryVo vo) {
        return studentMapper.findAllStudent();
    }
}
