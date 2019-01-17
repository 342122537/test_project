package org.great.cardevent;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.smartcardio.CardException;

import org.apache.tomcat.util.descriptor.web.LoginConfig;
import org.great.autoforward.MainServlet;
import org.great.dao.Card_EventDao;
import org.great.dao.Card_msgDao;
import org.great.dao.FactoryDao;
import org.great.dao.PatientTableDao;
import org.great.dao.PresTableDao;
import org.great.entity.Card_Event;
import org.great.entity.Card_msg;
import org.great.entity.PatientTable;

import oracle.net.aso.l;
import oracle.net.aso.p;
import sun.util.logging.resources.logging;

/**
 * Servlet implementation class SellCardSerevlet
 */
@WebServlet("/SellCardSerevlet")
public class SellCardSerevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SellCardSerevlet() {
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

		Card_msgDao card_msgDao = (Card_msgDao) FactoryDao.getObject("org.great.dao.Card_msgImpl");
		PatientTableDao patientTableDao = (PatientTableDao) FactoryDao.getObject("org.great.dao.PatientImpl");
		PrintWriter printWriter = response.getWriter();
		Card_msg card_msg = new Card_msg();
		PatientTable patientTable = new PatientTable();
		String c_id = null;
		String path = null;
		String p_name = null;
		String p_age = null;
		String p_age1 = null;
		String p_sex = null;
		String p_city = null;
		String p_idcard = null;
		String c_balance = null;
		String p_phone = null;
		String p_address = null;
		// String p_idcard = null;
		switch (action) {
		case "chick_c_id":

			break;
		case "selling":
			System.out.println("进入sds");
			c_id = request.getParameter("c_id");
			path = "";
			card_msg = (Card_msg) card_msgDao.findByc_Id(c_id);
			if (card_msg == null) {
				printWriter.print("<script>alert('" + "卡号输入有误，请重新输入"
						+ " ');location.href='brower/charge_net/applycard/sell_Card.jsp';location.history.back(-1)</script>");

				System.out.println("卡号不存在，检查失败");
			} else {

				if (card_msgDao.chickstate(c_id, "")) {
					printWriter.print("<script>alert('" + "卡号输入有误，请重新输入"
							+ " ');location.href='brower/charge_net/applycard/sell_Card.jsp';location.history.back(-1)</script>");

					System.out.println("卡号不可用，检查失败");

				} else {
					System.out.println("卡号存在，检查成功");
					// c_id = request.getParameter("c_id");
					p_name = request.getParameter("p_name");
					p_age = request.getParameter("p_age");
					p_age1 = request.getParameter("p_age1");
					p_sex = request.getParameter("p_sex");
					p_city = request.getParameter("p_city");
					p_address = request.getParameter("p_address");
					c_balance = request.getParameter("c_balance");
					p_phone = request.getParameter("p_phone");
					p_idcard = request.getParameter("p_idcard");
					c_balance = "" + (Integer.parseInt(c_balance) - 5);
					p_age = p_age + "岁" + p_age1 + "周";
					patientTable = new PatientTable(c_id, p_name, p_sex, p_age, p_city, p_idcard, p_phone, p_address,
							c_balance, "5");
					boolean flag = patientTableDao.insertObject(patientTable);
					if (flag) {

						printWriter.print("<script>alert('" + "出售成功"
								+ " ');location.href='brower/charge_net/applycard/sell_Card.jsp';</script>");

						// 跟新消费记录
						insertcose(c_id, request.getParameter("c_balance"), request.getParameter("loginname"), "售卡");

						// 更改卡状态
						card_msgDao.updateState(c_id, "已售出");
						// 操作日志
						MainServlet.insertolg(request.getParameter("loginname"), "售卡");
					} else {
						printWriter.print("<script>alert('" + "出售失败，请重新输入"
								+ " ');location.href='brower/charge_net/applycard/sell_Card.jsp';location.history.back(-1);</script>");

					}
				}
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

	public static void insertcose(String c_id, String c_balace, String loginname, String event) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String dateNowStr = sdf.format(d);
		System.out.println(dateNowStr);

		Card_EventDao card_EventDao = (Card_EventDao) FactoryDao.getObject("org.great.dao.Card_EventImpl");
		Card_Event card = new Card_Event(c_id, event, dateNowStr, c_balace, loginname);
		System.out.println(card_EventDao.insertObject(card));

	}

}
