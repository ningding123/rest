package com.ocpap.rest.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

	/**
	 * 获取当前时间 格式为"yyyy-MM-dd HH:mm:ss"
	 */
	public static String getCurrentTime(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentdate=sdf.format(new Date());
        return currentdate;
	}
}
