package logic;

import java.util.Calendar;

public class SystemDateAndTime {
	private static String calDate;
	private static String calMonth;
	private static String calYear;
	private static String sysDate;
	private static Calendar calendar;
	private static String calHour;
	private static String calMin;
	private static String calSec;
	private static String sysTime;
	private static String sysDay;
	private static String calAmPm;
	
	public static String getDate() {
		calendar = Calendar.getInstance();
		calDate = "" + calendar.get(Calendar.DATE);
		calMonth = "" + (calendar.get(Calendar.MONTH)+1);
		calYear = "" + calendar.get(Calendar.YEAR);
		sysDate = calDate + "/" + calMonth + "/" + calYear;
		return sysDate;
	}
	
	public static String getTimeIn24HrsFormat() {
		calendar = Calendar.getInstance();
		int calHr = calendar.get(Calendar.HOUR_OF_DAY);
		if (calHr < 10) {
			calHour = "0" + calHr;
		} else {
			calHour = "" + calendar.get(Calendar.HOUR_OF_DAY);
		}
		calMin = "" + calendar.get(Calendar.MINUTE);
		calSec = "" + calendar.get(Calendar.SECOND);
		sysTime = calHour + ":" + calMin + ":" + calSec;
		return sysTime;
	}
	
	public static String getTimeIn12HrsFormat() {
		calendar = Calendar.getInstance();
		calHour = "" + calendar.get(Calendar.HOUR);
		calMin = "" + calendar.get(Calendar.MINUTE);
		calSec = "" + calendar.get(Calendar.SECOND);
		if (calendar.get(Calendar.AM_PM) != 1) {
			calAmPm = "AM";
		} else {
			calAmPm = "PM";
		}
		
		sysTime = calHour + ":" + calMin + ":" + calSec + " " + calAmPm;
		return sysTime;
		
	}
	
	public static String getDay() {
		calendar = Calendar.getInstance();
		switch (calendar.get(Calendar.DAY_OF_WEEK)) {
		case 1:
			sysDay = "Sunday";
			break;
		case 2:
			sysDay = "Monday";
			break;
		case 3:
			sysDay = "Tuesday";
			break;
		case 4:
			sysDay = "Wednesday";
			break;
		case 5:
			sysDay = "Thursday";
			break;
		case 6:
			sysDay = "Friday";
			break;
		case 7:
			sysDay = "Satuarday";
			break;
		default:
			break;
		}
		return sysDay;
	}
}
