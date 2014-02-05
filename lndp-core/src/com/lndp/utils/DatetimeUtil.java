package com.lndp.utils;

import java.util.Calendar;
import java.util.Date;

public class DatetimeUtil {

	/**
	 * Check to see if the datetime is the latest one
	 * @param d1: Date The datetime that we need to check
	 * @param dateGap int The date range between today and the old days
	 * @return: boolean
	 */
	public static boolean isLatest(Date d1, int dateGap){
		
		Calendar calendar = Calendar.getInstance(); 
		calendar.add(Calendar.DATE, - dateGap);
		Date pastdate = calendar.getTime();
		
		if(d1.after(pastdate)){
			return true;
		}
		
		return false;
	}
}
