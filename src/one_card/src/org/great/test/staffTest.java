package org.great.test;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.great.dao.FactoryDao;
import org.great.dao.MemuTableDao;
import org.great.dao.RoleTableDao;
import org.great.dao.Staff_TableImpl;
import org.great.entity.ApplyTable;
import org.great.entity.Appointment_Table;
import org.great.entity.Card_Event;
import org.great.entity.Card_msg;
import org.great.entity.Card_msg1;
import org.great.entity.DeptTable;
import org.great.entity.DoctorTable;
import org.great.entity.LogTable;
import org.great.entity.MenuTable;
import org.great.entity.PatientTable;
import org.great.entity.RoleTable;
import org.great.entity.Staff_Table;
import org.great.tools.ConnectionUtil;
import org.junit.Test;
import org.junit.jupiter.api.TestTemplate;

import com.sun.org.apache.bcel.internal.generic.NEW;

import oracle.sql.DATE;

public class staffTest {

	String sql = "";
	String string = "启用";
	// String s_keshi = "";
	String r_id = "4";
	// String s_state = "";
	// int currentPage = 1;
	// int pageCount = 5;
	int num = 0;
	boolean flag = false;

	@Test
	public void getAllList() {

		List<Staff_Table> list = new ArrayList<Staff_Table>();
		sql = "select * from Staff_Table where s_state !='已删除'";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<Staff_Table>> rsh = new BeanListHandler<Staff_Table>(Staff_Table.class);
		try {
			list = (ArrayList<Staff_Table>) queryRunner.query(sql, rsh);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public String getLastTimeInterval() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		int dayOfWeek = calendar1.get(Calendar.DAY_OF_WEEK) - 1;
		int offset1 = 1 - dayOfWeek;
		int offset2 = 7 - dayOfWeek;
		calendar1.add(Calendar.DATE, offset1 - 7);
		calendar2.add(Calendar.DATE, offset2 - 7);
		// System.out.println(sdf.format(calendar1.getTime()));// last Monday
		String lastBeginDate = sdf.format(calendar1.getTime());
		// System.out.println(sdf.format(calendar2.getTime()));// last Sunday
		String lastEndDate = sdf.format(calendar2.getTime());
		return lastBeginDate + "," + lastEndDate;
	}

	public String getTimeInterval(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		// 判断要计算的日期是否是周日，如果是则减一天计算周六的，否则会出问题，计算到下一周去了
		int dayWeek = cal.get(Calendar.DAY_OF_WEEK);// 获得当前日期是一个星期的第几天
		if (1 == dayWeek) {
			cal.add(Calendar.DAY_OF_MONTH, -1);
		}
		// System.out.println("要计算日期为:" + sdf.format(cal.getTime())); // 输出要计算日期
		// 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		// 获得当前日期是一个星期的第几天
		int day = cal.get(Calendar.DAY_OF_WEEK);
		// 根据日历的规则，给当前日期减去星期几与一个星期第一天的差值
		cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - day);
		String imptimeBegin = sdf.format(cal.getTime());
		// System.out.println("所在周星期一的日期：" + imptimeBegin);
		cal.add(Calendar.DATE, 6);
		String imptimeEnd = sdf.format(cal.getTime());
		// System.out.println("所在周星期日的日期：" + imptimeEnd);
		return imptimeBegin + "," + imptimeEnd;
	}

	public static List<Date> findDates(Date dBegin, Date dEnd) {
		List lDate = new ArrayList();
		lDate.add(dBegin);
		Calendar calBegin = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calBegin.setTime(dBegin);
		Calendar calEnd = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calEnd.setTime(dEnd);
		// 测试此日期是否在指定日期之后
		while (dEnd.after(calBegin.getTime())) {
			// 根据日历的规则，为给定的日历字段添加或减去指定的时间量
			calBegin.add(Calendar.DAY_OF_MONTH, 1);
			lDate.add(calBegin.getTime());
		}
		return lDate;
	}

	private static String[] insert(String[] arr, String str) {
		int size = arr.length;
		String[] tmp = new String[size + 1];
		System.arraycopy(arr, 0, tmp, 0, size);
		tmp[size] = str;
		return tmp;
	}

	public static Date StringToDate(String dateStr, String formatStr) {
		DateFormat dd = new SimpleDateFormat(formatStr);
		Date date = null;
		try {
			date = dd.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	private static List<RoleTable> getDiffrent(List<RoleTable> list1, List<RoleTable> list2) {

		// long st = System.nanoTime();

		List<RoleTable> diff = new ArrayList<RoleTable>();
		ArrayList<String> strings = new ArrayList<String>();
		for (int i = 0; i < list2.size(); i++) {
			strings.add(list2.get(i).getR_id());

		}
		System.out.println(strings);
		for (RoleTable str : list1)

		{
			System.out.println(str.getR_id());
			;
			if (!list2.contains(str))

			{
				System.out.println(str);
				System.out.println(diff.add(str));

			} else {
				System.out.println("相同");
			}

		}

		// System.out.println("total times " + (System.nanoTime() - st));

		return diff;

	}

}
