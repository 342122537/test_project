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
import org.great.dao.ApplyTableDao;
import org.great.dao.Card_msgDao;
import org.great.dao.FactoryDao;
import org.great.dao.Staff_TableDao;
import org.great.entity.ApplyTable;
import org.great.entity.Card_msg;
import org.great.entity.Staff_Table;
import org.great.test.staffTest;

/**
 * Servlet implementation class ExamineApplyServlet
 */
@WebServlet("/ExamineApplyServlet")
public class ExamineApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamineApplyServlet() {
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
		System.out.println("进来ExamineApplyServlet");
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
		String begin_c_id = null;
		String a_auditor = null;
		PrintWriter printWriter = response.getWriter();
		List<ApplyTable> apply_list = new ArrayList<ApplyTable>();
		List<Card_msg> card_list = new ArrayList<Card_msg>();
		Card_msg card = new Card_msg();
		ApplyTableDao applyTableDao = (ApplyTableDao) FactoryDao.getObject("org.great.dao.ApplyTableImpl");
		Card_msgDao card_msgDao = (Card_msgDao) FactoryDao.getObject("org.great.dao.Card_msgImpl");
		System.out.println("action=" + action);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");

		// 获取员工列表
		Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");
		List<Staff_Table> allstaff_list =new ArrayList<Staff_Table>() ;
		allstaff_list=staff_TableDao.findAlls();
		System.out.println("allstaff_list"+allstaff_list);
		request.getSession().setAttribute("allstaff_list", allstaff_list);

		switch (action) {

		case "enter_exam":
			System.out.println("12sd3");
			pplys_state = request.getParameter("pplys_state");
			applyTime1 = request.getParameter("applytime1");
			applyTime2 = request.getParameter("pplytime2");
			currentPage = request.getParameter("currentPage");
			applyer = request.getParameter("applyer");

			ApplyTable applyTable = new ApplyTable(pplys_state, applyTime1, applyTime2, applyer);
			System.out.println("applyTable" + applyTable);
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
			request.setAttribute("applyer", applyer);

			request.setAttribute("apply_list", apply_list);
			path = "brower/charge_net/manageCard/examine_Collar_card.jsp";
			request.getRequestDispatcher(path).forward(request, response);
			System.out.println("123");
			break;
		case "examine":

			newtime = request.getParameter("applyTime");
			applyNumber = request.getParameter("applyNumer");
			applyer = request.getParameter("applyer");
			id = request.getParameter("a_id");
			System.out.println(applyNumber + "sdsadsadsadas");
			request.setAttribute("newtime", newtime);
			request.setAttribute("applyer", applyer);
			request.setAttribute("a_id", id);
			request.setAttribute("applyNumber", applyNumber);

			path = "brower/charge_net/manageCard/examine_apply.jsp";
			request.getRequestDispatcher(path).forward(request, response);

			break;
		case "handup_examine":
			id = request.getParameter("a_id");
			newtime = request.getParameter("newtime");
			applyNumber = request.getParameter("applyNumber");
			applyer = request.getParameter("applyer");
			a_auditor = request.getParameter("auditor");
			begin_c_id = request.getParameter("begin_c_id");
			String dateNowStr = sdf.format(d);
			String c_prefix = getChar(begin_c_id).replaceAll(" ", "");
			System.out.println(c_prefix + "=c_prefix");
			String c_numbers = getNumber(begin_c_id).replaceAll(" ", "");
			// System.out.println(c_prefix + "=c_prefix");
			System.out.println("c_numbers++++++=" + c_numbers);
			int c_number = Integer.valueOf(c_numbers);
			// 查找卡是否连续和卡是否已被使用
			boolean flag = true;
			for (int i = 0; i < Integer.parseInt(applyNumber); i++) {

				begin_c_id = c_prefix + new DecimalFormat("0000000").format((c_number + i));
				flag = card_msgDao.chickid(begin_c_id, id);
				if (flag == false) {
					System.out.println("查找卡是否连续和卡已被使用,跳出本循环");
					break;
				}
			}
			// 以上条件成立,开是改变状态
			if (flag == true) {
				System.out.println("flag == true,进入循环");
				boolean f = false;
				boolean f1 = false;
				for (int i = 0; i < Integer.parseInt(applyNumber); i++) {

					begin_c_id = c_prefix + new DecimalFormat("0000000").format((c_number + i));
					// 更新卡状态,建立两表联系c_appid
					f = card_msgDao.rs_examine(begin_c_id, "已领用", id);
					if (f) {
						System.out.println("进入更新申请表更改状态为审核成功");
						// 更新申请表更改状态为审核成功
						applyTable = new ApplyTable(id, a_auditor, dateNowStr, null, null, null, "已审核");
						f1 = applyTableDao.updateObject(applyTable);
						if (f1) {
							String loginname = (String) request.getSession().getAttribute("loginname");
							MainServlet.insertolg(loginname, "领卡审核");
							tmp = "审核成功";
						} else {
							System.out.println("审核失败");
						}
					} else {
						System.out.println("更新卡状态失败");
					}
				}
			} else {

				tmp = "审核失败!!!您提交的" + applyNumber + "张,开始卡号为" + request.getParameter("begin_c_id") + "无法生存连续的卡号";
			}
			// System.out.println("直接break到这边吗");
			printWriter.print("<script>alert('" + tmp
					+ "');location.href='brower/charge_net/manageCard/examine_apply.jsp';window.history.go(-1)</script>");
			break;
		case "apply_msg":
			newtime = request.getParameter("applyTime");
			applyNumber = request.getParameter("applyNumer");
			applyer = request.getParameter("applyer");
			id = request.getParameter("a_id");
			String c_auditor = request.getParameter("c_auditor");
			String c_autime = request.getParameter("c_autime");

			card_list = card_msgDao.getC_id(id);

			System.out.println("pplys_state=" + newtime);
			System.out.println("applyTime1=" + applyNumber);
			System.out.println("applyTime2=" + applyer);
			System.out.println("id=" + id);

			request.setAttribute("applyer", applyer);
			request.setAttribute("applyNumber", applyNumber);
			request.setAttribute("c_auditor", c_auditor);
			request.setAttribute("newtime", newtime);
			request.setAttribute("c_autime", c_autime);
			request.setAttribute("card_list", card_list);
			// request.setAttribute("a_id", id);

			path = "brower/charge_net/manageCard/examine_msg.jsp";
			request.getRequestDispatcher(path).forward(request, response);

			break;
		default:
			System.out.println("cation类型有误");
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

	public String getNumber(String c_id) {

		StringBuffer number = new StringBuffer();
		char[] strArr = c_id.toCharArray();
		for (char string : strArr) {

			// 判断是否为数字
			if ((string + "").matches("[0-9]")) {
				number.append(string);
			}

		}
		return number.toString();
	}

	public String getChar(String c_id) {

		StringBuffer letter = new StringBuffer();
		char[] strArr = c_id.toCharArray();
		for (char string : strArr) {

			if ((string + "").matches("[a-z]") || (string + "").matches("[A-Z]")) {
				letter.append(string + "  ");
			}

		}
		return letter.toString();
	}
}
