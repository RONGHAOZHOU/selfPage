package com.ronghao.grade.controller;

import com.ronghao.grade.bean.Grade;
import com.ronghao.grade.manager.GradeManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/grade")
public class GradeController {
    @Autowired
    GradeManager gradeManager;


    @RequestMapping("/getGrades")
    @ResponseBody
    public Map<String,Object> getGrades(@RequestBody HashMap<String ,
            Object> param) {
        Map<String, Object> result = new HashMap<>();
        try {
            String number = (String) param.get("number");
            Grade grade = gradeManager.searchGrade(number);
            if (grade != null) {
                result.put("code", grade.getCode());
                result.put("politics", grade.getPolitics());
                result.put("english", grade.getEnglish());
                result.put("math", grade.getMath());
                result.put("econemy", grade.getEconemy());
                result.put("total", grade.getTotal());
                result.put("rank", grade.getRank());
                result.put("success", "true");
                return result;
            } else {
                result.put("success", "false");
                return result;
            }
        } catch (Exception e) {
            result.put("success", "false");
            return result;
        }
    }

    @RequestMapping("/getExcel")
    public ResponseEntity<byte[]> getExcel(HttpServletRequest request) throws IOException {
        ServletContext servletContext = request.getServletContext();
        String fileName= "data.xls";
        String realPath = servletContext.getRealPath("/"+fileName);//得到文件所在位置
        InputStream in=new FileInputStream(new File(realPath));//将该文件加入到输入流之中
        byte[] body=null;
        body=new byte[in.available()];// 返回下一次对此输入流调用的方法可以不受阻塞地从此输入流读取（或跳过）的估计剩余字节数
        in.read(body);//读入到输入流里面

        fileName=new String(fileName.getBytes("utf-8"),"iso8859-1");//防止中文乱码
        HttpHeaders headers=new HttpHeaders();//设置响应头
        headers.add("Content-Disposition", "attachment;filename=" + fileName);
        headers.setContentType(MediaType.valueOf("application/msexcel"));
        HttpStatus statusCode = HttpStatus.OK;//设置响应吗
        ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(body, headers, statusCode);
        return response;
    }

    @RequestMapping("/exportToExcel")
    public void exportToExcel(HttpServletRequest request, HttpServletResponse response,String code) throws IOException {
//        String number = (String) param.get("number");
        try {
            gradeManager.exportToExcel(code, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}
