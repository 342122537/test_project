package org.great.cardevent;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.great.autoforward.MainServlet;
import org.great.dao.ApplyTableDao;
import org.great.dao.FactoryDao;
import org.great.entity.ApplyTable;

import oracle.net.aso.p;
import oracle.net.aso.r;

/**
 * Servlet implementation class Collar_CardServlet
 */
@WebServlet("/Collar_CardServlet")
public class Collar_CardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Collar_CardServlet() {
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
		String s_state = null;
		String id = null;
		String applyNumber = null;
		PrintWriter printWriter = response.getWriter();
		List<ApplyTable> apply_list = new ArrayList<ApplyTable>();
		ApplyTableDao applyTableDao = (ApplyTableDao) FactoryDao.getObject("org.great.dao.ApplyTableImpl");
		System.out.println("action=" + action);
		switch (action) {
		case "enter_apply":

			// &applytime1="+time1+"&pplytime2="+time2+"&pplys_state="+s_state+"&currentPage=${currentPages-1
			// }";

			pplys_state = request.getParameter("pplys_state");
			applyTime1 = request.getParameter("applytime1");
			applyTime2 = request.getParameter("pplytime2");
			currentPage = request.getParameter("currentPage");

			ApplyTable applyTable = new ApplyTable(pplys_state, applyTime1, applyTime2, null);

			// 列表总行数
			allpage = applyTableDao.getcount(applyTable);
			allpage = (allpage % 5 == 0 ? (allpage / 5) : (allpage / 5 + 1));

			// 入库审核列表
			apply_list = applyTableDao.getAll(applyTable, currentPage, "" + 5);
			request.setAttribute("currentPages", currentPage);
			request.setAttribute("allpage", allpage);
			request.setAttribute("pplyTime2", applyTime2);
			request.setAttribute("pplyTime1", applyTime1);
			request.setAttribute("pplys_state", pplys_state);

			request.setAttribute("apply_list", apply_list);
			path = "brower/charge_net/applycard/Collar_card.jsp";
			request.getRequestDispatcher(path).forward(request, response);

			break;
		case "addApplyer":

			newtime = request.getParameter("newtime");
			applyNumber = request.getParameter("applyNumber");
			applyer = request.getParameter("applyer");
			applyTable = new ApplyTable(null, null, applyer, newtime, applyNumber, "待审核");
			boolean flag = applyTableDao.insertObject(applyTable);
			if (flag) {
				tmp = "您提交的" + applyNumber + "张申请单提交成功";
				// 操作日志
				MainServlet.insertolg(applyer, "领卡申请单");

			} else {

				tmp = "您提交的" + applyNumber + "张申请单提交失败";
			}
			printWriter.print(
					"<script>alert('" + tmp + " ');location.href='brower/charge_net/applycard/newapply.jsp'</script>");

			break;
		case "apply_msg":
			newtime = request.getParameter("applyTime");
			applyNumber = request.getParameter("applyNumer");
			applyer = request.getParameter("applyer");
			id = request.getParameter("a_id");
			System.out.println("pplys_state=" + newtime);
			System.out.println("applyTime1=" + applyNumber);
			System.out.println("applyTime2=" + applyer);
			System.out.println("id=" + id);
			request.setAttribute("applyer", applyer);
			request.setAttribute("applyNumber", applyNumber);
			request.setAttribute("newtime", newtime);
			request.setAttribute("a_id", id);

			path = "brower/charge_net/applycard/updateapply.jsp";
			request.getRequestDispatcher(path).forward(request, response);

			break;
		case "updateNumber":

			applyNumber = request.getParameter("applyNumber");
			System.out.println("applyTime1=" + applyNumber);
			id = request.getParameter("a_id");
			System.out.println("id=" + id);
			boolean flag1 = applyTableDao.updateNumber(id, applyNumber);
			if (flag1) {
				tmp = "您提交的" + applyNumber + "张修改申请单提交成功";
				MainServlet.insertolg(request.getParameter("loginname"), "修改申请单");
			} else {

				tmp = "您提交的" + applyNumber + "张修改申请单提交失败";
			}
			printWriter.print(
					"<script>alert('" + tmp + " ');location.href='brower/charge_net/applycard/newapply.jsp'</script>");

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
