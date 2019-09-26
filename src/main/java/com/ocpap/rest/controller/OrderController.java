package com.ocpap.rest.controller;

import com.alibaba.fastjson.JSONObject;
import com.ocpap.rest.entity.AdminAccount;
import com.ocpap.rest.entity.Order;
import com.ocpap.rest.entity.QueryVo;
import com.ocpap.rest.entity.Student;
import com.ocpap.rest.service.AdminService;
import com.ocpap.rest.service.OrderService;
import com.ocpap.rest.service.StudentService;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private AdminService adminService;
    @RequestMapping("list")
    public String list(QueryVo vo, Model model){
        Page<Order> orderPage = orderService.findByPage(vo);
        for(int i = 0;i<orderPage.getTotal();i++){
            orderPage.getRows().get(i).setStuname(studentService.findById(orderPage.getRows().get(i).getStuid()).getName());
            orderPage.getRows().get(i).setDocname(adminService.findAdminById(orderPage.getRows().get(i).getDocid()).getAmName());
        }
        model.addAttribute("orderPage",orderPage);
        return "order-list";
    }
    @RequestMapping("add")
    public String add(QueryVo vo,Model model){

        List<Student> studentList = studentService.findAll(vo);
        List<AdminAccount> adminAccounts = adminService.findAll(vo);
        model.addAttribute("student",studentList);
        model.addAttribute("admin",adminAccounts);
        return "order-insert";
    }
    @RequestMapping("echodata")
    public String echodata(QueryVo vo,Integer id,Model model){
        Order order = orderService.findById(id);
        List<Student> studentList = studentService.findAll(vo);
        List<AdminAccount> adminAccounts = adminService.findAll(vo);
        model.addAttribute("student",studentList);
        model.addAttribute("admin",adminAccounts);
        model.addAttribute("order",order);
        return "order-edit";
    }
    @RequestMapping("insert")
    @ResponseBody
    public JSONObject insert(Order order){
        order.setStatus(2);
        JSONObject json = new JSONObject();
        int ret = orderService.insert(order);
        if(ret>0){
            json.put("status","succ");
        }else{
            json.put("status","error");
        }
        return json;

    }
    @RequestMapping("update")
    @ResponseBody
    public JSONObject update(Order order){

        JSONObject json = new JSONObject();
        int ret = orderService.update(order);
        if(ret>0){
            json.put("status","succ");
        }else{
            json.put("status","error");
        }
        return json;
    }
}
