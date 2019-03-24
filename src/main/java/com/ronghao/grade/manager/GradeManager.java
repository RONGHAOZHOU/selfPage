package com.ronghao.grade.manager;


import com.ronghao.grade.bean.Grade;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.*;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

@Service("gradeManager")
public class GradeManager {

    public Grade searchGrade(String code) throws Exception {

//导入已存在的Excel文件，获得只读的工作薄对象
        Resource fileResource = new ClassPathResource("data.xls");

        InputStream fis = fileResource.getInputStream();
        Workbook wk = Workbook.getWorkbook(fis);
        //获取第一张Sheet表
        Sheet sheet = wk.getSheet(0);
        //获取总行数
        int rowNum = sheet.getRows();
        Grade grade = new Grade();
        boolean isFound = false;
//从数据行开始迭代每一行
        List<Grade> list = new ArrayList<>();
        for (int i = 1; i < rowNum; i++) {
            String number = sheet.getCell(0, i).getContents();
            if (number.equalsIgnoreCase(code)){

//getCell(column,row)，表示取得指定列指定行的单元格（Cell）
//getContents()获取单元格的内容，返回字符串数据。适用于字符型数据的单元格
//使用实体类封装单元格数据
                grade.setCode(sheet.getCell(0, i).getContents());
                grade.setPolitics(sheet.getCell(1, i).getContents());
                grade.setEnglish(sheet.getCell(2, i).getContents());
                grade.setMath(sheet.getCell(3, i).getContents());
                grade.setEconemy(sheet.getCell(4, i).getContents());
                grade.setTotal(sheet.getCell(5, i).getContents());
                grade.setRank(sheet.getCell(6, i).getContents());
                isFound = true;
            }
        }
        fis.close();
        wk.close();
        if (isFound) {
            return grade;
        }
        return null;
    }


    public void exportToExcel(String code,HttpServletResponse response) throws Exception {
        Grade myGrade = searchGrade(code);
        //获得输出流，该输出流的输出介质是客户端浏览器

        OutputStream output=response.getOutputStream();

        response.reset();

        response.setHeader("Content-disposition","attachment;           filename=MyGrades.xls");

        response.setContentType("application/msexcel");

        //创建可写入的Excel工作薄，且内容将写入到输出流，并通过输出流输出给客户端浏览

        WritableWorkbook wk=Workbook.createWorkbook(output);


///创建可写入的Excel工作表

        WritableSheet sheet=wk.createSheet("成绩表", 0);

//把单元格（column, row）到单元格（column1, row1）进行合并。

//mergeCells(column, row, column1, row1);

        sheet.mergeCells(0,0, 6,0);//单元格合并方法

//创建WritableFont 字体对象，参数依次表示黑体、字号12、粗体、非斜体、不带下划线、亮蓝色

        WritableFont titleFont=new WritableFont(WritableFont.createFont("黑体"),12,WritableFont.BOLD,false, UnderlineStyle.NO_UNDERLINE,Colour.LIGHT_BLUE);

//创建WritableCellFormat对象，将该对象应用于单元格从而设置单元格的样式

        WritableCellFormat titleFormat=new WritableCellFormat();

//设置字体格式

        titleFormat.setFont(titleFont);

//设置文本水平居中对齐

        titleFormat.setAlignment(Alignment.CENTRE);

//设置文本垂直居中对齐

        titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE);

//设置背景颜色

        titleFormat.setBackground(Colour.GRAY_25);

//设置自动换行

        titleFormat.setWrap(true);

//添加Label对象，参数依次表示在第一列，第一行，内容，使用的格式

        Label lab_00=new Label(0,0,"我的成绩",titleFormat);

//将定义好的Label对象添加到工作表上，这样工作表的第一列第一行的内容为‘学员考试成绩一览表’并应用了titleFormat定义的样式

        sheet.addCell(lab_00);

        WritableCellFormat cloumnTitleFormat=new WritableCellFormat();

        cloumnTitleFormat.setFont(new WritableFont(WritableFont.createFont("宋体"),10,WritableFont.BOLD,false));

        cloumnTitleFormat.setAlignment(Alignment.CENTRE);

        Label lab_01=new Label(0,1,"考生编号",cloumnTitleFormat);
        Label lab_11=new Label(1,1,"政治",cloumnTitleFormat);
        Label lab_21=new Label(2,1,"外语",cloumnTitleFormat);
        Label lab_31=new Label(3,1,"数学",cloumnTitleFormat);
        Label lab_41=new Label(4,1,"经济",cloumnTitleFormat);
        Label lab_51=new Label(5,1,"总分",cloumnTitleFormat);
        Label lab_61=new Label(6,1,"排名",cloumnTitleFormat);
        sheet.addCell(lab_01);
        sheet.addCell(lab_11);
        sheet.addCell(lab_21);
        sheet.addCell(lab_31);
        sheet.addCell(lab_41);
        sheet.addCell(lab_51);
        sheet.addCell(lab_61);

        sheet.addCell(new Label(0,2,myGrade.getCode()));

        sheet.addCell(new Label(1,2,myGrade.getPolitics()));
        sheet.addCell(new Label(2,2,myGrade.getEnglish()));
        sheet.addCell(new Label(3,2,myGrade.getMath()));
        sheet.addCell(new Label(4,2,myGrade.getEconemy()));
        sheet.addCell(new Label(5,2,myGrade.getTotal()));
        sheet.addCell(new Label(6,2,myGrade.getRank()));

//将定义的工作表输出到之前指定的介质中（这里是客户端浏览器）
        wk.write();
//操作完成时，关闭对象，释放占用的内存空间
        wk.close();
    }
}
