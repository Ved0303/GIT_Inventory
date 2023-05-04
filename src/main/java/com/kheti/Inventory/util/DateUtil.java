package com.kheti.Inventory.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String getString(Date date) {  
		if(date==null)
			return "";
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		String strDate = dateFormat.format(date);
		return strDate;
	}
	
	public static Date getDate(String strDate) {  
		
		if(null==strDate || strDate.isBlank())
			return null;
		
		try {			
			return new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

}
