package org.great.autoforward;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.el.sql.UpdateTag;
import org.great.dao.Card_EventDao;
import org.great.dao.Card_msgDao;
import org.great.dao.DoctorTableDao;
import org.great.dao.FactoryDao;
import org.great.dao.LogTableDao;
import org.great.dao.PatientTableDao;
import org.great.dao.PresTableDao;
import org.great.entity.Card_Event;
import org.great.entity.Card_msg;
import org.great.entity.LogTable;
import org.great.entity.PatientTable;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import oracle.net.aso.d;
import oracle.net.aso.l;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainServlet() {
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

		System.out.println("有进来");
		//
		Card_msgDao card_msgDao = (Card_msgDao) FactoryDao.getObject("org.great.dao.Card_msgImpl");
		PresTableDao presTableDao = (PresTableDao) FactoryDao.getObject("org.great.dao.PresTableImpl");
		PatientTableDao patientTableDao = (PatientTableDao) FactoryDao.getObject("org.great.dao.PatientImpl");
		// 病人
		PatientTable patientTable = new PatientTable();

		// 卡信息
		Card_msg card_msg = new Card_msg();

		// 输出
		PrintWriter printWriter = response.getWriter();
		List list = new ArrayList();// 传递List

		// 得到action
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");
		String c_id = request.getParameter("c_id");
		request.getSession().setAttribute("testname", "ss0000003");
		System.out.println("action=" + action);
		switch (action) {
		case "add":

			request.getRequestDispatcher("brower/forward/addmoney.jsp").forward(request, response);
			break;
		case "accounts":
			request.getRequestDispatcher("brower/forward/accounts.jsp").forward(request, response);
			break;
		case "appointment":
			request.getRequestDispatcher("brower/forward/appointment.jsp").forward(request, response);
			break;
		case "order":
			request.getRequestDispatcher("brower/forward/order.jsp").forward(request, response);
			break;
		case "quary":
			request.getRequestDispatcher("brower/forward/quary.jsp").forward(request, response);
			break;
		case "back":
			request.getRequestDispatcher("brower/forward/main.jsp").forward(request, response);
			break;
		case "readcard":
			readcard(c_id, response);
			break;
		case "card_evet":
			getCard_Event(c_id, response);
			break;
		case "risemoney":
			String newBalnce = request.getParameter("addtext");
			String c_balance = request.getParameter("c_balance");
			System.out.println(newBalnce);
			if (c_id != null && newBalnce != null && c_balance != null) {
				newBalnce = "" + (Integer.parseInt(newBalnce) + Integer.valueOf(c_balance));

				if (patientTableDao.updateBalance(c_id, newBalnce)) {
					readcard(c_id, response);
					// 新增操作日志
					insertolg(c_id, "充值");
					// 新增金额日志

					System.out.println("修改成功" + ",余额=" + newBalnce);
				} else {
					System.out.println("修改失败");
				}

			}

			// request.getRequestDispatcher("brower/forward/main.jsp").forward(request,
			// response);
			break;
		case "appoins":
			getAppoinment(c_id, response);

			break;
		case "last/nextPage":
			break;
		case "endPage":
			break;
		default:

			System.out.println("action有误=" + action);
			break;

		}

	}

	private void getAppoinment(String c_id, HttpServletResponse response) {
		PrintWriter printWriter;
		try {
			printWriter = response.getWriter();

			PatientTable patientTable = new PatientTable();
			patientTable = findPatient(c_id);

			DoctorTableDao doctorTableDao = (DoctorTableDao) FactoryDao.getObject("org.great.dao.DoctorTableImpl");
			// 查先找医生排班

			Map m = new HashMap();// 传递Map
			m.put("patientTable", patientTable);

			System.out.println("map=" + m);
			JSONObject jo = JSONObject.fromObject(m);// 转化Map对象

			printWriter.print(jo);// 返给ajax请求
			printWriter.flush();
			printWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

	public static PatientTable findPatient(String c_id) {
		PatientTable patientTable = new PatientTable();

		PatientTableDao patientTableDao = (PatientTableDao) FactoryDao.getObject("org.great.dao.PatientImpl");
		patientTable = (PatientTable) patientTableDao.findByc_Id(c_id);

		return patientTable;

	}

	public static Card_msg findCardMsg(String c_id) {

		Card_msg card_msg = new Card_msg();

		Card_msgDao card_msgDao = (Card_msgDao) FactoryDao.getObject("org.great.dao.Card_msgImpl");
		card_msg = (Card_msg) card_msgDao.findByc_Id(c_id);

		System.out.println("card_msg=" + card_msg);
		return card_msg;

	}

	public static void readcard(String c_id, HttpServletResponse response) {
		// 输出
		PrintWriter printWriter;
		try {
			printWriter = response.getWriter();
			Card_msg card_msg = new Card_msg();
			PatientTable patientTable = new PatientTable();
			List list = new ArrayList();// 传递List

			if (c_id != null) {
				patientTable = findPatient(c_id);

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

	public static void getCard_Event(String c_id, HttpServletResponse response) {
		PrintWriter printWriter;
		try {
			printWriter = response.getWriter();
			List<Card_Event> cardList = new ArrayList<Card_Event>();
			Card_msg card_msg = new Card_msg();
			PatientTable patientTable = new PatientTable();
			Card_EventDao card_EventDao = (Card_EventDao) FactoryDao.getObject("org.great.dao.Card_EventImpl");
			cardList = (List<Card_Event>) card_EventDao.findByc_Id(c_id);
			patientTable = findPatient(c_id);
			Map m = new HashMap();// 传递Map
			m.put("patientTable", patientTable);
			m.put("cardList", cardList);
			System.out.println("map=" + m);
			JSONObject jo = JSONObject.fromObject(m);// 转化Map对象

			printWriter.print(jo);// 返给ajax请求
			printWriter.flush();
			printWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void insertolg(String id, String event) {

		LogTableDao logTableDao = (LogTableDao) FactoryDao.getObject("org.great.dao.LogTableImpl");

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String time = sdf.format(d);

		LogTable logTable = new LogTable(id, time, event);

		logTableDao.insertObject(logTable);

	}
}
