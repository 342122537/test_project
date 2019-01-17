package org.great.charge;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.great.dao.Card_msg1Dao;
import org.great.dao.Card_msgDao;
import org.great.dao.FactoryDao;
import org.great.dao.Staff_TableDao;
import org.great.entity.Card_msg;
import org.great.entity.Card_msg1;
import org.great.entity.Staff_Table;

/**
 * Servlet implementation class CancleCardServlet
 */
@WebServlet("/ModifyCardServlet")
public class ModifyCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyCardServlet() {
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

		System.out.println("ModifyCardServlet中");
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");

		Card_msg1Dao card_msg1Dao = (Card_msg1Dao) FactoryDao.getObject("org.great.dao.Card_msg1Impl");

		PrintWriter printWriter = response.getWriter();
		String c_state = null;
		Card_msg1 card = null;
		String c_id1 = null;
		String currentPage = null;
		int allpage = 0;
		String pageCount = "5";
		String get_man = null;
		List<Map<String, Object>> allList = new ArrayList<Map<String, Object>>();

		//
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		// 获取员工列表
		Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");
		List<Staff_Table> allstaff_list = new ArrayList<Staff_Table>();
		allstaff_list = staff_TableDao.findAlls();
		System.out.println("allstaff_list" + allstaff_list);
		request.getSession().setAttribute("allstaff_list", allstaff_list);

		String path = null;
		switch (action) {

		case "modify":
			c_id1 = request.getParameter("c_id");
			c_state = request.getParameter("s_state");
			get_man = request.getParameter("get_man");
			currentPage = request.getParameter("currentPage");
			System.out.println("当前页" + currentPage);

			card = new Card_msg1(c_id1, get_man, c_state);
			allpage = card_msg1Dao.getAllPage(card, currentPage, pageCount);
			System.out.println("所有页页" + allpage);
			allpage = (allpage % 5 == 0 ? (allpage / 5) : (allpage / 5 + 1));
			allList = card_msg1Dao.getAllList(card, currentPage, pageCount);
			request.getSession().setAttribute("modifyList", allList);
			request.getSession().setAttribute("allpage", allpage);
			request.getSession().setAttribute("currentPages", currentPage);
			request.getSession().setAttribute("c_id", c_id1);
			request.getSession().setAttribute("get_man", get_man);
			request.getSession().setAttribute("c_state", c_state);
			path = "brower/charge_net/manageCard/modifyCard.jsp";
			request.getRequestDispatcher(path).forward(request, response);
			break;

		case "link_card":

			// ?action=deleteStaff&s_id=${u.c_id}&s_state=${u. c_state}
			System.out.println("进来了");
			String c_id = request.getParameter("c_id");
			System.out.println("c_id了" + c_id);
			c_state = request.getParameter("c_state");
			String c_leader = request.getParameter("c_leader");
			String p_name = request.getParameter("p_name");
			String c_leaadTime = request.getParameter("c_leaadTime");
			String c_seller = request.getParameter("c_seller");
			String c_sellTime = request.getParameter("c_sellTime");
			String c_balance = request.getParameter("c_balance");

			request.getSession().setAttribute("cid", c_id);
			request.getSession().setAttribute("state", c_state);
			request.getSession().setAttribute("leader", c_leader);
			request.getSession().setAttribute("seller", c_seller);
			request.getSession().setAttribute("eaadTime", c_leaadTime);
			request.getSession().setAttribute("balance", c_balance);
			request.getSession().setAttribute("sellTime", c_sellTime);
			request.getSession().setAttribute("name", p_name);

			path = "brower/charge_net/manageCard/card_msg.jsp";
			request.getRequestDispatcher(path).forward(request, response);
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
