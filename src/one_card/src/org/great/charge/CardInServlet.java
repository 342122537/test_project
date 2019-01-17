package org.great.charge;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.util.Sorting;
import org.great.autoforward.MainServlet;
import org.great.dao.ApplyTableDao;
import org.great.dao.Card_msg1Dao;
import org.great.dao.Card_msgDao;
import org.great.dao.FactoryDao;
import org.great.dao.PatientTableDao;
import org.great.dao.PresTableDao;
import org.great.dao.Staff_TableImpl;
import org.great.entity.ApplyTable;
import org.great.entity.Card_msg;
import org.great.entity.Card_msg1;
import org.great.entity.PatientTable;

import com.sun.javafx.sg.prism.web.NGWebView;

import jdk.nashorn.internal.runtime.regexp.JoniRegExp.Factory;

/**
 * Servlet implementation class CardInServlet
 */
@WebServlet("/CardInServlet")
public class CardInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CardInServlet() {
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

		System.out.println("CardInServlet中");
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");

		Card_msgDao card_msgDao = (Card_msgDao) FactoryDao.getObject("org.great.dao.Card_msgImpl");
		Card_msg1Dao card_msg1Dao = (Card_msg1Dao) FactoryDao.getObject("org.great.dao.Card_msg1Impl");

		PrintWriter printWriter = response.getWriter();
		String c_state = null;
		String time1 = null;
		String time2 = null;
		Card_msg card = null;
		String currentPage = null;
		int allpage = 0;
		String pageCount = "5";

		List<Card_msg> allList = new ArrayList<Card_msg>();
		// if (start) {

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");

		String path = null;
		switch (action) {
		case "add":
			int c_number = Integer.parseInt((request.getParameter("st_num")));
			int c_number1 = Integer.parseInt((request.getParameter("end_num")));
			String applyer = request.getParameter("applyer");
			DecimalFormat format = new DecimalFormat("0000000");
			String count = "" + (c_number1 - c_number + 1);
			System.out.println(format.format(c_number));
			if ((c_number1 - c_number) > 100) {
				printWriter.print(
						"<script>alert('卡片个数超过一百,请重新输入');location.href='brower/charge_net/manageCard/addCard.jsp';</script>");

				break;
			}

			String c_prefix = request.getParameter("perfore");

			String c_id1 = c_prefix + format.format(c_number);
			String c_id2 = c_prefix + format.format(c_number1);
			String dateNowStr = sdf.format(d);
			System.out.println(dateNowStr);
			String c_num = format.format(c_number);
			// System.out.println(dateNowStr);
			String tmp = "";

			boolean falg = card_msgDao.findByc_Ids(c_id1, c_id2);
			if (falg) {
				String c_appid = c_prefix + format.format(c_number1 - c_number);
				PatientTableDao patientTableDao = (PatientTableDao) FactoryDao.getObject("org.great.dao.PatientImpl");
				PatientTable patient = new PatientTable();
				for (int i = c_number; i <= c_number1; i++) {
					card = (Card_msg) card_msgDao.findByc_Id(c_id1);
					if (card == null) {
						c_appid = c_prefix + format.format(c_number);
						card = new Card_msg(c_id1, c_prefix, c_num, "待领用", dateNowStr, applyer, c_appid);
						tmp += ";" + card_msgDao.insertCard_msg(card);

						// 操作日志
						MainServlet.insertolg(applyer, "卡入库");

						// 添加卡查询列表
						card_msg1Dao.insertObject(new Card_msg1(c_id1, null, null, null, null));
					} else {
						tmp += ";" + c_id1 + "添加失败";

					}
					c_number += 1;
					System.out.println(c_number);
					c_num = format.format(c_number);
					c_id1 = c_prefix + format.format(c_number);
				}
				// // 入库审核列表
				// ApplyTableDao applyTableDao = (ApplyTableDao)
				// FactoryDao.getObject("org.great.dao.ApplyTableImpl");
				//
				// ApplyTable applyTable =
				// new ApplyTable("", "", applyer, dateNowStr, count, c_appid,"待审核");
				// applyTableDao.insertObject(applyTable);

			} else {
				tmp += "卡号已存在,请重新输入";
			}
			printWriter.print(
					"<script>alert('" + tmp + " ');location.href='brower/charge_net/manageCard/addCard.jsp'</script>");

			break;
		case "addCardManage":
			c_id1 = request.getParameter("c_id");
			c_id2 = request.getParameter("c_id1");
			c_state = request.getParameter("s_state");
			time1 = request.getParameter("time1");
			time2 = request.getParameter("time2");
			currentPage = request.getParameter("currentPage");
			card = new Card_msg(c_state, c_id1, c_id2, time1, time2);
			allpage = card_msgDao.getAllPage(card, currentPage, pageCount);
			allpage = (allpage % 5 == 0 ? (allpage / 5) : (allpage / 5 + 1));
			allList = card_msgDao.getAllList(card, currentPage, pageCount);
			System.out.println("当前页" + currentPage);
			System.out.println("所有页页" + allpage);
			request.getSession().setAttribute("card_messageList", allList);
			request.getSession().setAttribute("allpage", allpage);
			request.getSession().setAttribute("currentPages", currentPage);
			request.getSession().setAttribute("c_id", c_id1);
			request.getSession().setAttribute("c_id1", c_id2);
			request.getSession().setAttribute("time1", time1);
			request.getSession().setAttribute("time2", time2);
			request.getSession().setAttribute("c_state", c_state);
			path = "brower/charge_net/manageCard/quaryAddCard.jsp";
			request.getRequestDispatcher(path).forward(request, response);
			break;

		case "deleteStaff":

			// ?action=deleteStaff&s_id=${u.c_id}&s_state=${u. c_state}

			c_id1 = request.getParameter("s_id");
			c_state = "";
			System.out.println(c_id1 + "====c_id1");
			boolean flag = card_msgDao.updateState(c_id1, c_state);

			if (flag) {

				tmp = "删除成功";
				path = "<%=path%>CardInServlet?action=addCardManage&currentPage=1";
				// printWriter.print("<script>alert('" + tmp + " ');</script>");
				addCardManage(request, response, "CardInServlet");
			String  loginname= 	(String) request.getSession().getAttribute("loginname");
				MainServlet.insertolg(loginname, "退卡");
			} else {
				tmp = "删除失败";
				path = "<%=path%>CardInServlet?action=addCardManage&currentPage=1";
				// printWriter.print("<script>alert('" + tmp + " ');</script>");

			}

			break;

		default:
			System.out.println("action类型错误" + action);
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

	public static void addCardManage(HttpServletRequest request, HttpServletResponse response, String servlet) {

		try {

			Card_msgDao card_msgDao = (Card_msgDao) FactoryDao.getObject("org.great.dao.Card_msgImpl");
			PrintWriter printWriter = response.getWriter();
			String c_state = null;
			String time1 = null;
			String time2 = null;
			Card_msg card = null;
			String currentPage = null;
			int allpage = 0;
			String pageCount = "5";

			List<Card_msg> allList = new ArrayList<Card_msg>();
			// if (start) {

			String path = null;
			String c_id1 = request.getParameter("c_id");
			String c_id2 = request.getParameter("c_id1");
			c_state = request.getParameter("s_state");
			time1 = request.getParameter("time1");
			time2 = request.getParameter("time2");
			currentPage = "1";
			card = new Card_msg(c_state, c_id1, c_id2, time1, time2);
			allpage = card_msgDao.getAllPage(card, currentPage, pageCount);
			allpage = (allpage % 5 == 0 ? (allpage / 5) : (allpage / 5 + 1));
			allList = card_msgDao.getAllList(card, currentPage, pageCount);
			System.out.println("当前页" + currentPage);
			System.out.println("所有页页" + allpage);
			request.getSession().setAttribute("card_messageList", allList);
			request.getSession().setAttribute("allpage", allpage);
			request.getSession().setAttribute("currentPages", currentPage);
			request.getSession().setAttribute("c_id", c_id1);
			request.getSession().setAttribute("c_id1", c_id2);
			request.getSession().setAttribute("time1", time1);
			request.getSession().setAttribute("time2", time2);
			request.getSession().setAttribute("c_state", c_state);
			switch (servlet) {

			case "CardInServlet":
				path = "brower/charge_net/manageCard/quaryAddCard.jsp";

				break;
			case "CancleCardServlet":
				path = "brower/charge_net/manageCard/cancleCard.jsp";

				break;
			default:
				System.out.println(servlet + ">.>>>类型出错");
				break;
			}

			request.getRequestDispatcher(path).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
