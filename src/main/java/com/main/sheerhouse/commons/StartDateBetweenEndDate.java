package com.main.sheerhouse.commons;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class StartDateBetweenEndDate {

	//start, end값의 포멧은 String, 2020-10-09 와 같아야 합니다.
	public static List<String> getStartAndEnd(String start, String end){
		if(start.equals("") || end.equals("")) {
			System.out.println("입력된 값 없음");
			return null;
		}
		
		List<String> dates = new ArrayList<String>();
		
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		
		try {
			Date startDate = dateForm.parse(start);
			Date endDate = dateForm.parse(end);
			Date currentDate = startDate;
			while (currentDate.compareTo(endDate) <= 0) {
				dates.add(dateForm.format(currentDate));
				Calendar c = Calendar.getInstance();
				c.setTime(currentDate);
				c.add(Calendar.DAY_OF_MONTH, 1);
				currentDate = c.getTime();
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return dates;
	}
}
