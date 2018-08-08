package cn.pol.demo;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;

import cn.sm.entity.ClassTable;

public class Demo {

	
	public HSSFWorkbook exportData(String fileName , List<ClassTable> list) {
		// 创建工作空间
		HSSFWorkbook wb = new HSSFWorkbook();
		// 创建表
		HSSFSheet sheet = wb.createSheet(fileName);
		sheet.setDefaultColumnWidth(20);
		sheet.setDefaultRowHeightInPoints(20);
 
		// 创建行
		HSSFRow row = sheet.createRow((int) 0);
 
		// 生成一个样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);// 水平居中
		style.setVerticalAlignment(VerticalAlignment.CENTER);// 垂直居中
 
		// 背景色
		style.setFillForegroundColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		style.setFillBackgroundColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
 
		// 设置边框
		style.setBorderBottom(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		style.setBorderTop(BorderStyle.THIN);
 
		// 生成一个字体
		HSSFFont font = wb.createFont();
		font.setFontHeightInPoints((short) 10);
		font.setColor(HSSFColor.HSSFColorPredefined.BLACK.getIndex());
		font.setBold(true);
		font.setFontName("宋体");
 
		// 把字体 应用到当前样式
		style.setFont(font);
		
		// 添加表头数据
		String[] excelHeader = { "日期", "星期", "起止日期", "班级", "授课地点", "课堂内容", "课时折算", };
		for (int i = 0; i < excelHeader.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(excelHeader[i]);
			cell.setCellStyle(style);
		}
		// 添加单元格数据
		int tmp = 1;
		for(ClassTable data : list) {
			row = sheet.createRow(tmp);
			row.createCell(0).setCellValue(data.getDate());
			row.createCell(1).setCellValue(data.getWeek());
			row.createCell(2).setCellValue(data.getCreatedate()+"-"+data.getWeek());
			row.createCell(3).setCellValue(data.getClasstype());
			row.createCell(4).setCellValue(data.getAddress());
			row.createCell(5).setCellValue(data.getClasscontent());
			row.createCell(6).setCellValue(data.getClassconversion());
			tmp++;
		}
		
		/*for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(list[i]);
			row.createCell(1).setCellValue("line" + i + ":row" + 2);
			row.createCell(2).setCellValue("line" + i + ":row" + 3);
			row.createCell(3).setCellValue("line" + i + ":row" + 3);
			row.createCell(4).setCellValue("line" + i + ":row" + 3);
			row.createCell(5).setCellValue("line" + i + ":row" + 3);
			row.createCell(6).setCellValue("line" + i + ":row" + 3);
			row.createCell(7).setCellValue("line" + i + ":row" + 3);
		}*/
		return wb;
	}
	
}
