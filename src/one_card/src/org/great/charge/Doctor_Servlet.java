package org.great.charge;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.great.autoforward.MainServlet;
import org.great.dao.ApplyTableDao;
import org.great.dao.AppointmentTableDao;
import org.great.dao.Card_msgDao;
import org.great.dao.DoctorTableDao;
import org.great.dao.FactoryDao;
import org.great.dao.Staff_TableDao;
import org.great.entity.ApplyTable;
import org.great.entity.Appointment_Table;
import org.great.entity.Card_msg;
import org.great.entity.DoctorTable;
import org.great.entity.Staff_Table;
import org.great.test.staffTest;

import oracle.net.aso.b;

/**
 * Servlet implementation class Doctor_Servlet
 */
@WebServlet("/Doctor_Servlet")
public class Doctor_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Doctor_Servlet() {
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

		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");

		System.out.println("进来ExamineApplyServlet");
		Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");
		DoctorTableDao doctorTableDao = (DoctorTableDao) FactoryDao.getObject("org.great.dao.DoctorTableImpl");
		AppointmentTableDao appointmentTableDao = (AppointmentTableDao) FactoryDao
				.getObject("org.great.dao.AppointmentTabeImpl");
		String path = null;
		List<Staff_Table> nei_list = new ArrayList<Staff_Table>();
		List<Staff_Table> wai_list = new ArrayList<Staff_Table>();
		List<DoctorTable> doctor_list = new ArrayList<DoctorTable>();
		switch (action) {

		case "enter_doct":
			// 找出内外科所有医生
			nei_list = staff_TableDao.getDeptList("内科");
			wai_list = staff_TableDao.getDeptList("外科");

			// 找出医生排班数据
			doctor_list = doctorTableDao.findAlls();

			request.getSession().setAttribute("nei_list", nei_list);
			request.getSession().setAttribute("wai_list", wai_list);
			request.getSession().setAttribute("doctor_list", doctor_list);

			path = "brower/charge_net/M_Schedule.jsp";

			request.getRequestDispatcher(path).forward(request, response);
			break;
		case "update":
			String title = request.getParameter("title");
			String loginname = request.getParameter("loginname");
			String dept = title.split(":")[0];
			String s_id = title.split(":")[1];
			String s_name = title.split(":")[2];

			String ssString = (String) request.getSession().getAttribute("loginname");
			String time = request.getParameter("time");
			time = time.split(":")[0] + ":00";
			System.out.println(request.getParameter("date") + request.getParameter("xingqi"));
			// 生成数据库
			DoctorTable doctorTable = new DoctorTable(request.getParameter("date"), s_name, dept,
					request.getParameter("xingqi"), s_id, time);
			doctorTableDao.insertObject(doctorTable);
			MainServlet.insertolg(loginname, "医生排班");
			// 生成病人预约表

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.set(Calendar.HOUR, calendar.get(Calendar.HOUR) - 1);// 让日期加1
			System.out.println(calendar.get(Calendar.DATE));// 加1之后的日期Top
			System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SS").format(calendar.getTime()));
			time = time + "--" + (Integer.valueOf(time.split(":")[0]) + 1) + ":00";
			System.out.println(time);
			Appointment_Table appointment_Table = new Appointment_Table(null, null, null, null,
					request.getParameter("date"), time, s_name, null, dept);
			appointmentTableDao.insertObject(appointment_Table);

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

}
