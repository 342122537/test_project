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

import org.great.autoforward.MainServlet;
import org.great.dao.Card_msgDao;
import org.great.dao.FactoryDao;
import org.great.entity.Card_msg;

/**
 * Servlet implementation class CancleCardServlet
 */
@WebServlet("/CancleCardServlet")
public class CancleCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CancleCardServlet() {
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

		System.out.println("CancleCardServlet中");
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");

		Card_msgDao card_msgDao = (Card_msgDao) FactoryDao.getObject("org.great.dao.Card_msgImpl");
		PrintWriter printWriter = response.getWriter();
		String c_state = null;
		Card_msg card = null;
		String c_id1 = null;
		String c_id2 = null;
		String currentPage = null;
		int allpage = 0;
		String pageCount = "5";
		List<Card_msg> allList = new ArrayList<Card_msg>();

		//
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");

		String path = null;
		switch (action) {

		case "cancle_Main":
			c_id1 = request.getParameter("c_id");
			c_id2 = request.getParameter("c_id1");
			c_state = request.getParameter("s_state");
			if (c_state == null || c_state.equals("")) {
				c_state = "待销售";
			}
			currentPage = request.getParameter("currentPage");
			card = new Card_msg(c_state, c_id1, c_id2, null, null);
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
			request.getSession().setAttribute("c_state", c_state);
			path = "brower/charge_net/manageCard/cancleCard.jsp";
			request.getRequestDispatcher(path).forward(request, response);
			break;

		case "cancle":

			// ?action=deleteStaff&s_id=${u.c_id}&s_state=${u. c_state}

			c_id1 = request.getParameter("s_id");
			c_state = "已注销";
			System.out.println(c_id1 + "====c_id1");
			boolean flag = card_msgDao.updateState(c_id1, c_state);

			if (flag) {
				path = "<%=path%>CancleCardServlet?action=cancle_Main&currentPage=1";
				// printWriter.print("<script>alert('" + tmp + " ');</script>");
				CardInServlet.addCardManage(request, response, "CancleCardServlet");
				
				MainServlet.insertolg(request.getParameter("loginname"), "卡注销");
			} else {

				path = "<%=path%>CancleCardServlet?action=cancle_Main&currentPage=1";

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

}
