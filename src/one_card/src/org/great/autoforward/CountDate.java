package org.great.autoforward;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class CountDate {

	public String getDateAfterNDays(String dateTime, int days) {

		Calendar calendar = Calendar.getInstance();
		String[] dateTimeArray = dateTime.split("-");
		int year = Integer.parseInt(dateTimeArray[0]);
		int month = Integer.parseInt(dateTimeArray[1]);
		int day = Integer.parseInt(dateTimeArray[2]);
		calendar.set(year, month - 1, day);
		long time = calendar.getTimeInMillis();// 给定时间与1970 年 1 月 1
												// 日的00:00:00.000的差，以毫秒显示
		calendar.setTimeInMillis(time + days * 1000 * 60 * 60 * 24);// 用给定的
																	// long值设置此Calendar的当前时间值
		return calendar.get(Calendar.YEAR)// 应还书籍时间——年
				+ "-" + (calendar.get(Calendar.MONTH) + 1)// 应还书籍时间——月
				+ "-" + calendar.get(Calendar.DAY_OF_MONTH)// 应还书籍时间——日
		;
	}

	public String getWeekDate() {
		Map<String, String> map = new HashMap();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);// 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一
		int dayWeek = cal.get(Calendar.DAY_OF_WEEK);// 获得当前日期是一个星期的第几天
		if (dayWeek == 1) {
			dayWeek = 8;
		}
		System.out.println("要计算日期为:" + sdf.format(cal.getTime())); // 输出要计算日期

		cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - dayWeek);// 根据日历的规则，给当前日期减去星期几与一个星期第一天的差值
		Date mondayDate = cal.getTime();
		String weekBegin = sdf.format(mondayDate);
		System.out.println("所在周星期一的日期：" + weekBegin);

		cal.add(Calendar.DATE, 4 + cal.getFirstDayOfWeek());
		Date sundayDate = cal.getTime();
		String weekEnd = sdf.format(sundayDate);
		System.out.println("所在周星期日的日期：" + weekEnd);

		map.put("mondayDate", weekBegin);
		map.put("sundayDate", weekEnd);
		return weekBegin;
	}

	public String getDate(String currDate, int day) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 将字符串的日期转为Date类型，ParsePosition(0)表示从第一个字符开始解析
		Date date = sdf.parse(currDate, new ParsePosition(0));
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		// add方法中的第二个参数n中，正数表示该日期后n天，负数表示该日期的前n天
		calendar.add(Calendar.DATE, day);
		Date date1 = calendar.getTime();
		String out = sdf.format(date1);
		System.out.println(out);
		return out;
	}

}
