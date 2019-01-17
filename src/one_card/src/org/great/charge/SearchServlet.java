package org.great.charge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.great.dao.ApplyTableDao;
import org.great.dao.FactoryDao;
import org.great.dao.LogTableDao;
import org.great.dao.Staff_TableDao;
import org.great.entity.ApplyTable;
import org.great.entity.Staff_Table;
import org.great.entity.WorksTable;

import oracle.net.aso.l;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
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
		System.out.println("jilai SearchServlet");
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");
		// String action
		// =request.getParameter("action")==null?"action":request.getParameter("action");

		String applyTime1 = null;
		String applyTime2 = null;
		String pplys_state = null;
		String currentPage = null;
		int pageCount = 0;
		int allpage = 0;
		String path = null;
		String tmp = "";
		String newtime = null;
		String applyer = null;
		String c_id1 = null;
		String c_id2 = null;
		String id = null;
		String applyNumber = null;
		PrintWriter printWriter = response.getWriter();
		List<ApplyTable> apply_list = new ArrayList<ApplyTable>();
		ApplyTableDao applyTableDao = (ApplyTableDao) FactoryDao.getObject("org.great.dao.ApplyTableImpl");
		System.out.println("action=" + action);
		switch (action) {
		case "card_search":

			c_id1 = request.getParameter("c_id1");
			c_id2 = request.getParameter("c_id2");
			applyTime1 = request.getParameter("applytime1");
			applyTime2 = request.getParameter("pplytime2");
			currentPage = request.getParameter("currentPage");
			String s_number = (String) request.getSession().getAttribute("loginname");

			System.out.println("登陆者的number====" + s_number);
			ApplyTable applyTable = new ApplyTable(applyTime1, applyTime2, c_id1, c_id2, null);

			// 列表总行数
			allpage = applyTableDao.allTogetherListcount(applyTable, s_number);
			// allpage = applyTableDao.getcount(applyTable);
			allpage = (allpage % 5 == 0 ? (allpage / 5) : (allpage / 5 + 1));

			// 入库审核列表
			apply_list = applyTableDao.allTogetherList(applyTable, currentPage, "" + 5, s_number);
			// apply_list = applyTableDao.getAll(applyTable, currentPage, "" + 5);
			request.setAttribute("currentPages", currentPage);
			request.setAttribute("allpage", allpage);
			request.setAttribute("pplyTime2", applyTime2);
			request.setAttribute("pplyTime1", applyTime1);
			request.setAttribute("c_id1", c_id1);
			request.setAttribute("c_id2", c_id2);

			request.setAttribute("applylist", apply_list);
			path = "brower/charge_net/search/card_search.jsp";
			request.getRequestDispatcher(path).forward(request, response);

			break;
		case "works":

			applyTime1 = request.getParameter("time1");
			applyTime2 = request.getParameter("time2");
			currentPage = request.getParameter("currentPage");
			String s_name = request.getParameter("s_name");
			System.out.println("currentPages	" + currentPage);
			// 找出所有工作人员姓名
			List<Staff_Table> allstaff = new ArrayList<Staff_Table>();

			Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");
			allstaff = staff_TableDao.finByName(s_name, currentPage, "5");

			List<WorksTable> works_staff = new ArrayList<WorksTable>();
			LogTableDao logTableDao = (LogTableDao) FactoryDao.getObject("org.great.dao.LogTableImpl");

			for (int i = 0; i < allstaff.size(); i++) {
				// 售卡数
				String sale_number = ""
						+ logTableDao.getCount(allstaff.get(i).getS_name(), "售卡", applyTime1, applyTime2);
				String change_number = ""
						+ logTableDao.getCount(allstaff.get(i).getS_name(), "换卡", applyTime1, applyTime2);
				String exit_number = ""
						+ logTableDao.getCount(allstaff.get(i).getS_name(), "退卡", applyTime1, applyTime2);
				String add_number = ""
						+ logTableDao.getCount(allstaff.get(i).getS_name(), "充值", applyTime1, applyTime2);
				String per_number = ""
						+ logTableDao.getCount(allstaff.get(i).getS_name(), "预约挂号", applyTime1, applyTime2);
				String dengji_number = ""
						+ logTableDao.getCount(allstaff.get(i).getS_name(), "登记处方", applyTime1, applyTime2);
				String ctuifei_number = ""
						+ logTableDao.getCount(allstaff.get(i).getS_name(), "处方退费", applyTime1, applyTime2);

				WorksTable worksTable = new WorksTable(allstaff.get(i).getS_name(), sale_number, change_number,
						exit_number, add_number, per_number, dengji_number, ctuifei_number);
				works_staff.add(worksTable);

			}

			request.setAttribute("s_name", s_name);
			request.setAttribute("time1", applyTime1);
			request.setAttribute("time2", applyTime2);
			request.setAttribute("currentPages", currentPage);
			request.setAttribute("allpage", allstaff.size());
			request.setAttribute("works_staff", works_staff);
			path = "brower/charge_net/search/modifyworks.jsp";
			request.getRequestDispatcher(path).forward(request, response);
			break;
		case "updateNumber":

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
