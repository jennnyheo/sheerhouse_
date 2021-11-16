package com.main.sheerhouse.commons;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UnixTimeToString {
	
	public static String getTimestampToDate(String unixTime){
	    long timestamp = Long.parseLong(unixTime);
	    Date date = new Date(timestamp*1000L); 
	    SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    sdf.setTimeZone(java.util.TimeZone.getTimeZone("GMT+9")); 
	    String formattedDate = sdf.format(date);
	    return formattedDate;
	}
}
