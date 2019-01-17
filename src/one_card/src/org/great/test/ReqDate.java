package org.great.test;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class ReqDate {
	/**
	 * ��ȡ��������N��������
	 * 
	 * @author GaoHuanjie
	 */
	public String getDateAfterNDays(String dateTime, int days) {
		Calendar calendar = Calendar.getInstance();
		String[] dateTimeArray = dateTime.split("-");
		int year = Integer.parseInt(dateTimeArray[0]);
		int month = Integer.parseInt(dateTimeArray[1]);
		int day = Integer.parseInt(dateTimeArray[2]);
		calendar.set(year, month - 1, day);
		long time = calendar.getTimeInMillis();// ����ʱ����1970 �� 1 �� 1
												// �յ�00:00:00.000�Ĳ�Ժ�����ʾ
		calendar.setTimeInMillis(time + days * 1000 * 60 * 60 * 24);// �ø�����
																	// longֵ���ô�Calendar�ĵ�ǰʱ��ֵ
		return calendar.get(Calendar.YEAR)// Ӧ���鼮ʱ�䡪����
				+ "-" + (calendar.get(Calendar.MONTH) + 1)// Ӧ���鼮ʱ�䡪����
				+ "-" + calendar.get(Calendar.DAY_OF_MONTH)// Ӧ���鼮ʱ�䡪����
		;
	}

	public String getWeekDate() {
		Map<String, String> map = new HashMap();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);// ����һ�����ڵĵ�һ�죬���й���ϰ��һ�����ڵĵ�һ��������һ
		int dayWeek = cal.get(Calendar.DAY_OF_WEEK);// ��õ�ǰ������һ�����ڵĵڼ���
		if (dayWeek == 1) {
			dayWeek = 8;
		}
		System.out.println("Ҫ��������Ϊ:" + sdf.format(cal.getTime())); // ���Ҫ��������

		cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - dayWeek);// ���������Ĺ��򣬸���ǰ���ڼ�ȥ���ڼ���һ�����ڵ�һ��Ĳ�ֵ
		Date mondayDate = cal.getTime();
		String weekBegin = sdf.format(mondayDate);
		System.out.println("����������һ�����ڣ�" + weekBegin);

		cal.add(Calendar.DATE, 4 + cal.getFirstDayOfWeek());
		Date sundayDate = cal.getTime();
		String weekEnd = sdf.format(sundayDate);
		System.out.println("�����������յ����ڣ�" + weekEnd);

		map.put("mondayDate", weekBegin);
		map.put("sundayDate", weekEnd);
		return weekBegin;
	}

	public String getDate(String currDate, int day) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// ���ַ���������תΪDate���ͣ�ParsePosition(0)��ʾ�ӵ�һ���ַ���ʼ����
		Date date = sdf.parse(currDate, new ParsePosition(0));
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		// add�����еĵڶ�������n�У�������ʾ�����ں�n�죬������ʾ�����ڵ�ǰn��
		calendar.add(Calendar.DATE, day);
		Date date1 = calendar.getTime();
		String out = sdf.format(date1);
		System.out.println(out);
		return out;
	}

}
