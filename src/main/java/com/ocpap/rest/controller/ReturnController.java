package com.ocpap.rest.controller;

import com.alibaba.fastjson.JSONObject;
import com.ocpap.rest.entity.*;
import com.ocpap.rest.service.AdminService;
import com.ocpap.rest.service.OrderService;
import com.ocpap.rest.service.ReturnService;
import com.ocpap.rest.service.StudentService;
import com.ocpap.rest.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("returnorder")
public class ReturnController {

    @Autowired
    private ReturnService returnService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private AdminService adminService;
    @RequestMapping("list")
    public String list(QueryVo vo, Model model){
        vo.setSstatus(1);
        vo.setStatus(1);
        Page<Order> orderPage = orderService.findByPage(vo);
        for(int i = 0;i<orderPage.getTotal();i++){
            orderPage.getRows().get(i).setStuname(studentService.findById(orderPage.getRows().get(i).getStuid()).getName());
            orderPage.getRows().get(i).setDocname(adminService.findAdminById(orderPage.getRows().get(i).getDocid()).getAmName());
        }
        model.addAttribute("orderPage",orderPage);
        return "returnorder-list";
    }
    @RequestMapping("liststudent")
    public String liststudent(QueryVo vo, Model model){
        vo.setSstatus(1);
        vo.setStatus(1);
        Page<Order> orderPage = orderService.findByPage(vo);
        for(int i = 0;i<orderPage.getTotal();i++){
            orderPage.getRows().get(i).setStuname(studentService.findById(orderPage.getRows().get(i).getStuid()).getName());
            orderPage.getRows().get(i).setDocname(adminService.findAdminById(orderPage.getRows().get(i).getDocid()).getAmName());
        }
        model.addAttribute("orderPage",orderPage);
        return "returnorder-liststudent";
    }
    @RequestMapping("add")
    public String add(){
        return "returnorder-add";
    }
    @RequestMapping("echodata")
    public String echodata(Integer id,Model model){
        Order order = orderService.findById(id);
        ReturnOrder returnOrder = returnService.findByOid(order.getId());
        Student student = studentService.findById(order.getStuid());
        AdminAccount adminAccount = adminService.findAdminById(order.getDocid());
        model.addAttribute("student",student);
        model.addAttribute("adminaccount",adminAccount);
        model.addAttribute("order",order);
        model.addAttribute("returnorder",returnOrder);
        return "returnorder-edit";
    }
    @RequestMapping("insert")
    @ResponseBody
    public JSONObject insert(ReturnOrder returnOrder){
        JSONObject json = new JSONObject();
        int ret = returnService.insert(returnOrder);
        if(ret>0){
            json.put("status","succ");
        }else{
            json.put("status","error");
        }
        return json;
    }
    @RequestMapping("update")
    @ResponseBody
    public JSONObject update(ReturnOrder returnOrder){
        JSONObject json = new JSONObject();
        int ret = returnService.update(returnOrder);
        if(ret>0){
            json.put("status","succ");
        }else{
            json.put("status","error");
        }
        return json;
    }
}
