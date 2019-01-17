package org.great.charge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.great.dao.DeptTableDao;
import org.great.dao.FactoryDao;
import org.great.dao.MemuTableDao;
import org.great.dao.RoleTableDao;
import org.great.dao.Staff_TableDao;
import org.great.entity.DeptTable;
import org.great.entity.MenuTable;
import org.great.entity.RoleTable;
import org.great.entity.Staff_Table;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("又进来");
		session_Start(req);
		String uname = req.getParameter("uname");
		String u_pwd = req.getParameter("upwd");
		String chickChar = req.getParameter("chickChar");
		System.out.println(uname + u_pwd + "验证吗" + chickChar);
		HttpSession session = req.getSession();

		String chickCode = (String) session.getAttribute("chickChar");

		PrintWriter out = resp.getWriter();

		if (!chickChar.equalsIgnoreCase(chickCode)) {

			System.out.println(chickChar + "验证吗有误" + chickCode);
			out.print("<script>alert('验证吗有误');location.href='brower/charge_net/login.jsp';</script>");

		} else {

			// 链接数据库
			Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");
			RoleTableDao roleTableDao = (RoleTableDao) FactoryDao.getObject("org.great.dao.RoleTableImpl");

			// ArrayList<UserTable> userList = userdao.loginUser(uname, u_pwd);
			Staff_Table staff_Table = (Staff_Table) staff_TableDao.findById(uname);
			
			String path = "";
			if (staff_Table == null) {
				out.print("<script>alert('账号有误');location.href='brower/charge_net/login.jsp';</script>");
			} else if (!staff_Table.getS_pwd().equals(u_pwd)) {

				out.print("<script>alert('密码有误 ');location.href='brower/charge_net/login.jsp';</script>");
			} else if ("已删除".equals(staff_Table.getS_state())) {

				out.print("<script>alert('用户已被禁用 ');location.href='brower/charge_net/login.jsp';</script>");
			} else {
				path = "brower/charge_net/charge_main.jsp";

				session.setAttribute("loginname", staff_Table.getS_name());

				session.setAttribute("loginnumber", uname);
				session.setAttribute("loginpwd", uname);
				System.out.println("登录账号" + uname);
				session.setAttribute("loginstaff", staff_Table);
				RoleTable role = roleTableDao.getr_name(staff_Table.getR_id());
				if (role != null) {
					session.setAttribute("loginRole", role.getR_name());

				}

				MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");

				// 通过角色id查找角色 赋予权限

				MenuTable card_menu = new MenuTable();
				MenuTable sys_menu = new MenuTable();
				MenuTable card_opra = new MenuTable();
				MenuTable count_quary = new MenuTable();
				MenuTable dayly = new MenuTable();
				// 获取父级id
				System.out.println("ddsas dasd 的撒"+staff_Table);
				card_menu = memuTableDao.findByIdAndName(staff_Table.getR_id(), "卡片管理", null);
				sys_menu = memuTableDao.findByIdAndName(staff_Table.getR_id(), "系统管理", null);
				card_opra = memuTableDao.findByIdAndName(staff_Table.getR_id(), "卡片业务", null);
				count_quary = memuTableDao.findByIdAndName(staff_Table.getR_id(), "统计查询", null);
				dayly = memuTableDao.findByIdAndName(staff_Table.getR_id(), "日常事务", null);
				System.out.println("card_menu" + card_menu);

				// 通过id获取列表
				// 获取已有列表
				System.out.println("开始打印");
				List<MenuTable> card_menu_list = new ArrayList<MenuTable>();
				List<MenuTable> sys_menu_list = new ArrayList<MenuTable>();
				List<MenuTable> card_opra_list = new ArrayList<MenuTable>();
				List<MenuTable> count_quary_list = new ArrayList<MenuTable>();
				List<MenuTable> dayly_list = new ArrayList<MenuTable>();

				card_menu_list = memuTableDao.getOperation(card_menu.getM_id(), 1, "卡片管理");// 卡片管理
				sys_menu_list = memuTableDao.getOperation(sys_menu.getM_id(), 1, "系统管理");// 系统管里
				card_opra_list = memuTableDao.getOperation(card_opra.getM_id(), 1, "系统管理");// 系统管里
				count_quary_list = memuTableDao.getOperation(count_quary.getM_id(), 1, "系统管理");// 系统管里
				dayly_list = memuTableDao.getOperation(dayly.getM_id(), 1, "系统管理");// 系统管里
				System.out.println(card_menu_list);
				System.out.println(sys_menu_list);
				System.out.println(card_opra_list);
				System.out.println(count_quary_list);
				System.out.println(dayly_list);
				// 发送到主页面
				session.setAttribute("card_menu_list", card_menu_list);
				session.setAttribute("sys_menu_list", sys_menu_list);
				session.setAttribute("card_opra_list", card_opra_list);
				session.setAttribute("count_quary_list", count_quary_list);
				session.setAttribute("dayly_list", dayly_list);
				req.getRequestDispatcher(path).forward(req, resp);

				System.out.println("1111111111登录成功");
			}

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

	private static void session_Start(HttpServletRequest request) {
		// 在应用程序启动时运行的代码

		RoleTableDao roleTableDao = (RoleTableDao) FactoryDao.getObject("org.great.dao.RoleTableImpl");
		DeptTableDao deptTableDao = (DeptTableDao) FactoryDao.getObject("org.great.dao.DeptTableImpl");
		Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");

		List<RoleTable> rloe_list = roleTableDao.getAll();
		List<DeptTable> ke_list = deptTableDao.getAll();
		List<Staff_Table> applyer_list = staff_TableDao.getApplyer();

		// System.out.println("进来了rloe_list" + rloe_list);
		// System.out.println("进来了ke_list" + ke_list);
		// System.out.println("进来了applyer_list" + applyer_list);
		request.getSession().setAttribute("keshi_prama", ke_list);
		request.getSession().setAttribute("role_prama", rloe_list);
		request.getSession().setAttribute("applyer_list", applyer_list);
	}

}
