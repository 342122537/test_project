package org.great.autoforward;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.rmi.CORBA.Tie;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.great.dao.AppointmentTableDao;
import org.great.dao.DoctorTableDao;
import org.great.dao.FactoryDao;
import org.great.dao.PatientTableDao;
import org.great.entity.Appointment_Table;
import org.great.entity.Card_msg;
import org.great.entity.DoctorTable;
import org.great.entity.PatientTable;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class Appoint
 */
@WebServlet("/AppointServlet")
public class AppointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AppointServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		PrintWriter printWriter = response.getWriter();
		DoctorTableDao doctorTableDao = (DoctorTableDao) FactoryDao.getObject("org.great.dao.DoctorTableImpl");
		AppointmentTableDao appointmentTableDao = (AppointmentTableDao) FactoryDao
				.getObject("org.great.dao.AppointmentTabeImpl");
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");

		System.out.println("action" + action);
		switch (action) {
		case "enter_appoin":
			getdatelist(new Date(), request, response, null);
			break;
		case "last":
			PatientTable patientTable = new PatientTable();
			String c_id = request.getParameter("c_id");
			if (c_id != null) {
				patientTable = MainServlet.findPatient(c_id);

			}
			// 获取本周一时间
			String lastdate = request.getParameter("lastweek");
			System.out.println("nextweek]]]]" + lastdate);
			// 转字符串
			Date lastweek = getdate(lastdate);
			Calendar calendar = new GregorianCalendar();
			calendar.setTime(lastweek);
			calendar.add(calendar.DATE, -1);
			String date2 = sdf.format(calendar.getTime());
			getdatelist(calendar.getTime(), request, response, patientTable);

			System.out.println(date2);
			break;
		case "next":
			patientTable = new PatientTable();
			c_id = request.getParameter("c_id");

			if (c_id != null) {
				patientTable = MainServlet.findPatient(c_id);

			}
			// 获取本周末时间
			String nextdate = request.getParameter("nextweek");
			System.out.println("nextweek]]]]" + nextdate);
			// 转字符串
			Date nextweek = getdate(nextdate);
			calendar = new GregorianCalendar();
			calendar.setTime(nextweek);
			calendar.add(calendar.DATE, +1);
			String date3 = sdf.format(calendar.getTime());
			getdatelist(calendar.getTime(), request, response, patientTable);

			System.out.println(date3);

			break;
		case "readcard":
			patientTable = new PatientTable();
			c_id = request.getParameter("c_id");
			if (c_id != null) {
				patientTable = MainServlet.findPatient(c_id);

			}
			getdatelist(new Date(), request, response, patientTable);
			break;
		case "thisweek":
			patientTable = new PatientTable();
			c_id = request.getParameter("c_id");
			if (c_id != null) {
				patientTable = MainServlet.findPatient(c_id);

			}
			getdatelist(new Date(), request, response, patientTable);
			break;
		case "doctor":
			patientTable = new PatientTable();
			c_id = request.getParameter("c_id");
//			System.out.println("cid==========" + c_id + c_id);
			String name = request.getParameter("name");
			String date = request.getParameter("date");
			String dept = request.getParameter("dept");
			request.getSession().setAttribute("ssss", date);
			request.getSession().setAttribute("sssss", dept);
			// 获取预约列表

			List<Appointment_Table> list = new ArrayList<Appointment_Table>();
			list = appointmentTableDao.findBydate_name(name, date, dept);
			String path = "brower/forward/doctordeal.jsp";
			request.setAttribute("list", list);
			request.setAttribute("testname", c_id);

			request.getRequestDispatcher(path).forward(request, response);
			break;
		case "yuyue":
			patientTable = new PatientTable();
			c_id = request.getParameter("c_id");
			String p_id = request.getParameter("p_id");
			String app_id = request.getParameter("app_id");
			name = request.getParameter("name");
			date = (String) request.getSession().getAttribute("ssss");
			dept = (String) request.getSession().getAttribute("sssss");

			// 判断预约者是不是同一个人
//			System.out.println("p_id=1" + p_id + "1");
//			System.out.println("app_id1111=" + app_id);
//			System.out.println("c_id=" + c_id);
			if (c_id != null && (c_id.equals(""))) {
				// printWriter.print("<script>alert('请先读卡');location.href='brower/forward/appointment.jsp';</script>");

			} else {

				if (p_id != null && (!p_id.equals("")) && !p_id.equals(c_id)) {
					// 预约者不一样,无法操作]

					// printWriter.print(
					// "<script>alert('已被预约,请选择其他时间');location.href='brower/forward/appointment.jsp';</script>");

				} else {

					if (p_id != null && p_id.equals(c_id)) {
						// 撤销预约
						Appointment_Table appoin = new Appointment_Table(app_id, null, null, null, null);
						appointmentTableDao.updateyuyue(appoin);

					} else {
						Date d = new Date();
						sdf = new SimpleDateFormat("yyyy-MM-dd");
						String time = sdf.format(d);
						PatientTableDao patientTableDao = (PatientTableDao) FactoryDao
								.getObject("org.great.dao.PatientImpl");
						patientTable = (PatientTable) patientTableDao.findByc_Id(c_id);
						System.out.println("patientTable+++++++" + patientTable);
						if (patientTable != null) {
							Appointment_Table appoin = new Appointment_Table(app_id, "预约", c_id, time,
									patientTable.getP_name());
							appointmentTableDao.updateyuyue(appoin);

						}
					}
				}
				// 获取预约列表
				date = request.getParameter("date");
				dept = request.getParameter("dept");
				System.err.println("sdsadsada" + name + date + dept);
				list = appointmentTableDao.findBydate_name(name, date, dept);
				path = "brower/forward/doctordeal.jsp";
				request.setAttribute("list", list);
				request.setAttribute("testname", c_id);

				request.getRequestDispatcher(path).forward(request, response);
			}
			break;
		default:
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public Date getdate(String time) {
		Date date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = sdf.parse(time);
			System.out.println(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public void getdatelist(Date time, HttpServletRequest request, HttpServletResponse response,
			PatientTable patientTable) {
		if (time == null) {
			time = new Date();
		}
		DoctorTableDao doctorTableDao = (DoctorTableDao) FactoryDao.getObject("org.great.dao.DoctorTableImpl");
		List<DoctorTable> neike_list = new ArrayList<DoctorTable>();
		List<DoctorTable> neike_list1 = new ArrayList<DoctorTable>();
		List<DoctorTable> waike_list = new ArrayList<DoctorTable>();
		List<DoctorTable> waike_list1 = new ArrayList<DoctorTable>();
		String yz_time = getTimeInterval(time);// 获取本周时间
		String array[] = yz_time.split(",");
		String start_time = array[0];// 本周第一天
		String end_time = array[1]; // 本周最后一天
		// 格式化日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dBegin;
		Map<String, String> lDate = new LinkedHashMap<String, String>();
		try {
			dBegin = sdf.parse(start_time);
			Date dEnd = sdf.parse(end_time);
			//
			// neike_list = doctorTableDao.findbydept("内科", start_time, end_time);
			// waike_list = doctorTableDao.findbydept("外科", start_time, end_time);
			lDate = findDates(dBegin, dEnd);// 获取这周所有date
			for (String date : lDate.values()) {
				// 一个个查
				DoctorTable doctorTable = doctorTableDao.findbydae("内科", date);
				DoctorTable doctorTable1 = doctorTableDao.findbydae("外科", date);
				neike_list1.add(doctorTable);
				waike_list1.add(doctorTable1);

			}

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("neike_list1" + neike_list1);
		System.out.println("waike_list1" + waike_list1);
		request.setAttribute("week", lDate);
		request.setAttribute("neike_list", neike_list1);
		request.setAttribute("waike_list", waike_list1);
		List<PatientTable> list = new ArrayList<PatientTable>();// 传递List
		list.add(patientTable);
		request.setAttribute("patientTable", list);
		request.setAttribute("lastweek", start_time);
		request.setAttribute("nextweek", end_time);
		if (patientTable != null) {
			request.setAttribute("testname", patientTable.getC_id());

		}
		String path = "brower/forward/appointment.jsp";
		try {
			request.getRequestDispatcher(path).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 根据当前日期获得上周的日期区间（上周周一和周日日期）
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

	// 根据当前日期获得所在周的日期区间（周一和周日日期）
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

	// 获取一周开始到结束的list集合
	public static Map<String, String> findDates(Date dBegin, Date dEnd) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Map<String, String> lDate = new LinkedHashMap<String, String>();
		lDate.put("星期一", sdf.format(dBegin));
		Calendar calBegin = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calBegin.setTime(dBegin);
		Calendar calEnd = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calEnd.setTime(dEnd);
		// 测试此日期是否在指定日期之后
		int da = 0;
		String[] week = { "一", "二", "三", "四", "五", "六", "日" };
		while (dEnd.after(calBegin.getTime())) {
			// 根据日历的规则，为给定的日历字段添加或减去指定的时间量
			calBegin.add(Calendar.DAY_OF_MONTH, 1);
			da += 1;

			lDate.put("星期" + week[da], sdf.format(calBegin.getTime()));
			System.out.println(sdf.format(calBegin.getTime()));
		}
		System.out.println("dddddddd" + lDate);
		return lDate;
	}

	public static void readcard(String c_id, HttpServletResponse response) {
		// 输出
		PrintWriter printWriter;
		try {
			printWriter = response.getWriter();
			Card_msg card_msg = new Card_msg();
			PatientTable patientTable = new PatientTable();
			List list = new ArrayList();// 传递List
			list.add(patientTable);
			if (c_id != null) {
				patientTable = MainServlet.findPatient(c_id);

				list.add(patientTable); // 添加patientTable对象

				System.out.println("list=" + list);

				JSONArray jsonArray = JSONArray.fromObject(list);
				printWriter.print(jsonArray);// 返给ajax请求
				printWriter.flush();
				printWriter.close();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
