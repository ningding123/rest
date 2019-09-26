package com.ocpap.rest.controller;
import com.alibaba.fastjson.JSONObject;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.entity.Student;
import com.ocpap.rest.service.StudentService;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @RequestMapping("list")
    public String list(QueryVo vo,Model model){

        Page<Student> page = studentService.findByStudent(vo);
        model.addAttribute("page",page);
        return "student-list";
    }
    @RequestMapping("echodata")
    public String echodata(Integer id,Model model){

        Student student = studentService.findById(id);
        model.addAttribute("student",student);
        return "student-edit";
    }
    @RequestMapping("add")
    public String add(){

        return "student-add";
    }
    @RequestMapping("insert")
    @ResponseBody
    public JSONObject insert(Student student){
        int ret = studentService.insert(student);
        JSONObject json = new JSONObject();
        if(ret>0){
            json.put("status","succ");
        }else{
            json.put("status","error");
        }
        return json;
    }
    @RequestMapping("update")
    @ResponseBody
    public JSONObject update(Student student){
        int ret = studentService.update(student);
        JSONObject json = new JSONObject();
        if(ret>0){
            json.put("status","succ");
        }else{
            json.put("status","error");
        }
        return json;
    }

    @RequestMapping("delete")
    @ResponseBody
    public JSONObject delete(Integer id){
        int ret = studentService.delete(id);
        JSONObject json = new JSONObject();
        if(ret>0){
            json.put("status","succ");
        }else{
            json.put("status","error");
        }
        return json;
    }

}
