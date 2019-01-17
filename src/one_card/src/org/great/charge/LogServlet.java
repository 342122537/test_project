package org.great.charge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.great.dao.Card_msgDao;
import org.great.dao.FactoryDao;
import org.great.dao.LogTableDao;
import org.great.dao.PresTableDao;
import org.great.entity.Card_Event;
import org.great.entity.Card_msg;
import org.great.entity.Card_msg1;
import org.great.entity.LogTable;
import org.great.entity.PatientTable;
import org.great.entity.PresTable;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class QuaryServlet
 */
@WebServlet("/LogServlet")
public class LogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogServlet() {
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

		LogTableDao logTableDao = (LogTableDao) FactoryDao.getObject("org.great.dao.LogTableImpl");

		// 输出
		PrintWriter printWriter = response.getWriter();

		String time1 = request.getParameter("time1");
		String time2 = request.getParameter("time2");
		String currentPage = request.getParameter("currentPage");
		System.out.println("当前页" + currentPage);

		// 药方总数
		int count = logTableDao.getTotalCount(time1, time2);

		// 每页值
		int pageCount = 5;

		// 总页数
		int toalePage = count % pageCount == 0 ? (count / pageCount) : (count / pageCount + 1);
		System.out.println("所有页页" + toalePage);

		System.out.println("总条数+" + count + "总页数:" + toalePage);
		List<LogTable> allList = new ArrayList<LogTable>();
		allList = logTableDao.getAllList(currentPage, pageCount, time1, time2);
		String current = request.getParameter("currentPage");

		request.getSession().setAttribute("logList", allList);
		request.getSession().setAttribute("allpage", toalePage);
		request.getSession().setAttribute("currentPages", currentPage);
		request.getSession().setAttribute("time2", time2);
		request.getSession().setAttribute("time1", time1);
		String path = "brower/charge_net/manageCard/log_quary.jsp";
		request.getRequestDispatcher(path).forward(request, response);

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
