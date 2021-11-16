package com.main.sheerhouse.commons;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.main.sheerhouse.admin.domain.PayAndSetVO;

public class ApachePOI{

	public static void excelDownload(HttpServletResponse response ,String fileName, List<PayAndSetVO> excelList){
		System.out.println(excelList.toString());
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("결제-정산내역");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		CellStyle headStyle = wb.createCellStyle();
		headStyle.setAlignment(HorizontalAlignment.CENTER);

		headStyle.setBorderTop(BorderStyle.THIN);
        headStyle.setBorderBottom(BorderStyle.THIN);
        headStyle.setBorderLeft(BorderStyle.THIN);
        headStyle.setBorderRight(BorderStyle.THIN);
		
        CellStyle bodyStyle = wb.createCellStyle();
        bodyStyle.setBorderTop(BorderStyle.THIN);
        bodyStyle.setBorderBottom(BorderStyle.THIN);
        bodyStyle.setBorderLeft(BorderStyle.THIN);
        bodyStyle.setBorderRight(BorderStyle.THIN);

        
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
        cell.setCellValue("no");
        cell = row.createCell(1);
        cell.setCellValue("주문번호");
        cell = row.createCell(2);
        cell.setCellValue("결제상태");
        cell = row.createCell(3);
        cell.setCellValue("결제금액");
        cell = row.createCell(4);
        cell.setCellValue("정산상태");
        cell = row.createCell(5);
        cell.setCellValue("정산금액");
        cell = row.createCell(6);
        cell.setCellValue("게스트이메일");
        cell = row.createCell(7);
        cell.setCellValue("호스트이메일");
        cell = row.createCell(8);
        cell.setCellValue("결제일시");
        cell = row.createCell(9);
        cell.setCellValue("정산일시");

		int cnt = 1;
		for(PayAndSetVO data : excelList) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
	        cell.setCellValue(cnt);
	        cell = row.createCell(1);
	        cell.setCellValue(data.getApply_num());
	        cell = row.createCell(2);
	        cell.setCellValue(data.getPay_status());
	        cell = row.createCell(3);
	        cell.setCellValue(data.getTotal_price());
	        cell = row.createCell(4);
	        cell.setCellValue(data.getSet_status());
	        cell = row.createCell(5);
	        cell.setCellValue(data.getSet_price());
	        cell = row.createCell(6);
	        cell.setCellValue(data.getUser_email());
	        cell = row.createCell(7);
	        cell.setCellValue(data.getHost_email());
	        cell = row.createCell(8);
	        cell.setCellValue(data.getPay_date());
	        cell = row.createCell(9);
	        cell.setCellValue(data.getPay_date());
	        cnt++;
		}

        try {
        	response.setContentType("ms-vnd/excel");
            response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(fileName,"UTF-8") +".xlsx");
			wb.write(response.getOutputStream());
			wb.close();
        } catch (Exception e) {
			e.printStackTrace();
		}
        
	}
}
