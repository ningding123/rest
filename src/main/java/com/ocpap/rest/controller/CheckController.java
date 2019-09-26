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
import com.ocpap.rest.util.TimeUtil;
import org.openxmlformats.schemas.spreadsheetml.x2006.main.impl.TableDocumentImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("student")
public class CheckController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private AdminService adminService;

    @RequestMapping("checklist")
    public String checklist(QueryVo vo,Model model){
        vo.setSstatus(2);
        vo.setStatus(2);
        Page<Order> orderPage = orderService.findByPage(vo);
        for(int i = 0;i<orderPage.getTotal();i++){
            orderPage.getRows().get(i).setStuname(studentService.findById(orderPage.getRows().get(i).getStuid()).getName());
            orderPage.getRows().get(i).setDocname(adminService.findAdminById(orderPage.getRows().get(i).getDocid()).getAmName());
        }
        model.addAttribute("page",orderPage);
        return "check-list";
    }
    @RequestMapping("checkstudent")
    public String checkstudent(Integer id,Model model){
        Order order = orderService.findById(id);
        Student student = studentService.findById(order.getStuid());
        AdminAccount adminAccount = adminService.findAdminById(order.getDocid());
        model.addAttribute("order",order);
        model.addAttribute("student",student);
        model.addAttribute("admin",adminAccount);
        return "print";
    }
    @RequestMapping("check")
    @ResponseBody
    public JSONObject check(Integer id){
        JSONObject json = new JSONObject();
        Order order = new Order();
        order.setId(id);
        order.setSstatus(1);
        order.setStatus(1);
        order.setCreatetime(TimeUtil.time());
        int ret = orderService.update(order);
        if(ret>0){
            json.put("status","succ");
            json.put("msg","审核成功");
        }else{
            json.put("status","error");
            json.put("msg","审核失败");
        }
        return json;
    }
}
