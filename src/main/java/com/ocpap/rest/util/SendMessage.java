package com.cloud.pay.util;

import com.alibaba.fastjson.JSONObject;
import okhttp3.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import static com.cloud.pay.util.parseGetAuthInfoXML.parseGetAuthInfoXML;

public class SendMessage {

    private static Logger log = LoggerFactory.getLogger(SendMessage.class);
    public static int sendcode(String mobile, HttpSession session){
        int code = (int)((Math.random()*9+1)*100000);
        String msg="您的验证码为"+code+"请在1分钟内输入。感谢您对小未云的支持，祝您生活愉快！ ";
        String url = "http://222.73.117.158/msg/HttpBatchSendSM";
        JSONObject json = new JSONObject();
        String param="";
        json.put("account","N4701481");
        json.put("password","ugkdVRFw0");
        json.put("report","true");
        json.put("msg",msg);
        json.put("phone",mobile);
        JSONObject json1 = new JSONObject();
        OkHttpClient client = new OkHttpClient();
        RequestBody body = RequestBody.create(MediaType.parse("application/json;charset=utf-8"),json.toString());
        Request requestOk = new Request.Builder()
                .url("https://smssh1.253.com/msg/send/json")
                .post(body)
                .build();
        Call call = client.newCall(requestOk);//3.使用client去请求
        try {
            String xmlRes = call.execute().body().string();//4.获得返回结果
            log.info(xmlRes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }
}
