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
import javax.websocket.Session;

import org.great.autoforward.MainServlet;
import org.great.dao.DeptTableDao;
import org.great.dao.FactoryDao;
import org.great.dao.MemuTableDao;
import org.great.dao.RoleTableDao;
import org.great.dao.Staff_TableDao;
import org.great.entity.DeptTable;
import org.great.entity.MenuTable;
import org.great.entity.RoleTable;
import org.great.entity.Staff_Table;

import com.sun.corba.se.spi.orbutil.fsm.State;
import com.sun.java_cup.internal.runtime.virtual_parse_stack;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ManageServlet
 */
@WebServlet("/ManageServlet")
public class ManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageServlet() {
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
		System.out.println("ManageServlet	");
		Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");
		PrintWriter out = response.getWriter();
		Staff_Table staff_Table = new Staff_Table();

		// 查询内容
		String s_name = request.getParameter("s_name");
		String s_keshi = request.getParameter("s_keshi");
		String r_id = request.getParameter("r_id");
		String s_state = request.getParameter("s_state");

		System.out.println("=====s_name=" + s_name + "====s_keshi=" + s_keshi);
		System.out.println("=====r_id=" + r_id + "====s_state=" + s_state);
		// 列表长度和分页长度
		int toale = staff_TableDao.getTotalCount(s_name, s_keshi, r_id, s_state);
		int toalePage = (toale % 5 == 0 ? (toale / 5) : (toale / 5 + 1));
		int pageCount = 5;
		System.out.println("总条数+" + toale + "总页数:" + toalePage);

		// 得到action
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");

		// String uid = request.getParameter("uid");
		String current = request.getParameter("currentPage");
		int currentPage = 1;
		if (current != null) {
			currentPage = Integer.parseInt(current);
			if (currentPage < 1) {
				currentPage = 1;
			}
			if (currentPage > toalePage) {
				currentPage = toalePage;
			}
			System.out.println("currentpage=" + currentPage);
		}
		// 获取列表
		List<Map<String, Object>> all_List = new ArrayList<Map<String, Object>>();
		all_List = staff_TableDao.findAAL(s_name, s_keshi, r_id, s_state, currentPage, pageCount);
		System.out.println("action=" + action);

		String path;
		switch (action) {
		case "CHICKNAME":
			String uname = request.getParameter("name");
			System.out.println("uname" + uname);
			staff_Table = (Staff_Table) staff_TableDao.findById(uname);
			if (staff_Table == null) {
				out.print("1");
			} else {
				out.print("2");
			}

			break;
		case "add":
			String s_number = request.getParameter("uname");
			String s_pwd = request.getParameter("upwd");
			s_name = request.getParameter("sexname");
			r_id = request.getParameter("JORE");
			s_keshi = request.getParameter("DEPT");

			staff_Table = new Staff_Table(s_number, s_pwd, s_name, s_keshi, "启用", r_id);
			System.out.println(staff_Table);
			boolean flag = staff_TableDao.insertObject(staff_Table);
			if (flag) {

				out.print("<script>if(confirm('新增成功'));location.href='<%=path%>history.go(-1)';</script>");
				String  loginname= 	(String) request.getSession().getAttribute("loginname");
				MainServlet.insertolg(loginname, "新增人员");
			} else {
				out.print("<script>alert('新增失败,请重新输入 ');location.href='brower/charge_net/addStaff.jsp';</script>");
			}
			break;
		case "update":
			s_number = request.getParameter("s_number");
			s_keshi = request.getParameter("s_keshi");
			r_id = request.getParameter("r_id");
			s_name = request.getParameter("s_name");
			System.out.println("s_name=" + s_name);
			System.out.println("s_number=" + s_number);
			System.out.println("r_name=" + r_id);
			System.out.println("d_name=" + s_keshi);
			staff_Table = new Staff_Table(s_number, s_keshi, r_id);
			flag = staff_TableDao.updateObject(staff_Table);

			if (flag) {
				String  loginname= 	(String) request.getSession().getAttribute("loginname");
				MainServlet.insertolg(loginname, "修改人员信息");
				out.print("<script>alert('修改成功 ');location.href='brower/charge_net/updateStaff.jsp';</script>");
			} else {
				out.print("<script>alert('修改失败 ');location.href='brower/charge_net/updateStaff.jsp';</script>");
			}
			break;
		case "staffManage":

			all_List = staff_TableDao.findAAL("", "", "", "", 1, 5);
			setPages(currentPage, toalePage, all_List, request, response, s_name, s_keshi, s_state, r_id);

			break;
		case "first":
			currentPage = 1;
			setPages(currentPage, toalePage, all_List, request, response, s_name, s_keshi, s_state, r_id);
			break;
		case "last/nextPage":
			setPages(currentPage, toalePage, all_List, request, response, s_name, s_keshi, s_state, r_id);
			break;

		case "endPage":
			all_List = staff_TableDao.findAAL(s_name, s_keshi, r_id, s_state, toalePage, pageCount);
			setPages(currentPage, toalePage, all_List, request, response, s_name, s_keshi, s_state, r_id);
			break;
		case "deleteStaff":
			s_name = request.getParameter("s_name");
			s_state = request.getParameter("s_state");
			s_number = request.getParameter("s_id");
			s_state = "已删除";
			boolean state = staff_TableDao.updateState(s_number, s_state);
			if (state == false) {

				out.print("<script>alert('删除失败');location.href='brower/charge_net/quaryStaff.jsp';</script>");
				String  loginname= 	(String) request.getSession().getAttribute("loginname");
				MainServlet.insertolg(loginname, "删除人员");
			} else {

				out.print("<script>alert('删除成功');location.href='brower/charge_net/quaryStaff.jsp';</script>");

			}

			break;
		case "updateStaff":
			s_name = request.getParameter("s_name");
			s_number = request.getParameter("s_number");
			String r_name = request.getParameter("r_name");
			String d_name = request.getParameter("d_name");
			path = "brower/charge_net/updateStaff.jsp";

			System.out.println("s_name=" + s_name);
			System.out.println("s_number=" + s_number);
			System.out.println("r_name=" + r_name);
			System.out.println("d_name=" + d_name);
			request.getSession().setAttribute("d_name", d_name);
			request.getSession().setAttribute("r_name", r_name);
			request.getSession().setAttribute("s_number", s_number);
			request.getSession().setAttribute("s_name", s_name);

			request.getRequestDispatcher(path).forward(request, response);
			// locationPath(s_name, path, request, response);
			break;
		case "banStaff":
			s_name = request.getParameter("s_name");
			s_state = request.getParameter("s_state");
			s_number = request.getParameter("s_id");

			if (s_state.equals("启用")) {
				s_state = "禁用";
			} else {
				s_state = "启用";
			}
			boolean state1 = staff_TableDao.updateState(s_number, s_state);
			if (state1 == false) {
				String  loginname= 	(String) request.getSession().getAttribute("loginname");
				MainServlet.insertolg(loginname, "修改人员状态");
				out.print("<script>alert('修改状态失败');location.href='brower/charge_net/quaryStaff.jsp';</script>");

			} else {

				out.print("<script>alert('修改状态成功');location.href='brower/charge_net/quaryStaff.jsp';</script>");

			}
			break;
		case "updatePwd":
			s_number = request.getParameter("s_id");
			s_name = request.getParameter("s_name");
			System.out.println("s_name=" + s_name);
			System.out.println("s_number=" + s_number);
			path = "brower/charge_net/updatePwd.jsp";
			request.getSession().setAttribute("s_number", s_number);
			request.getSession().setAttribute("s_name", s_name);

			request.getRequestDispatcher(path).forward(request, response);
			// locationPath(s_name, path, request, response);
			break;
		case "quary_req":
			currentPage = 1;
			setPages(currentPage, toalePage, all_List, request, response, s_name, s_keshi, s_state, r_id);

			break;
		case "RoleTable":
			RoleTableDao roleTableDao = (RoleTableDao) FactoryDao.getObject("org.great.dao.RoleTableImpl");
			List<RoleTable> rloe_list = roleTableDao.getAll();
			Map m = new HashMap();// 传递Map
			m.put("list", rloe_list);
			JSONObject jo = JSONObject.fromObject(m);// 转化Map对象
			System.out.println("map=" + m);
			out.print(jo);// 返给ajax请求
			out.flush();
			out.close();
			break;
		case "DeptTable":

			DeptTableDao deptTableDao = (DeptTableDao) FactoryDao.getObject("org.great.dao.DeptTableImpl");
			List<DeptTable> ke_list = deptTableDao.getAll();
			m = new HashMap();// 传递Map
			m.put("ke_list", ke_list);
			jo = JSONObject.fromObject(m);// 转化Map对象
			System.out.println("map=" + m);
			out.print(jo);// 返给ajax请求
			out.flush();
			out.close();
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

	private void setPages(int currentPage, int toalePage, List<Map<String, Object>> all_List,
			HttpServletRequest request, HttpServletResponse response, String s_name, String keshi, String s_state,
			String r_id) {

		RoleTableDao roleTableDao = (RoleTableDao) FactoryDao.getObject("org.great.dao.RoleTableImpl");
		DeptTableDao deptTableDao = (DeptTableDao) FactoryDao.getObject("org.great.dao.DeptTableImpl");

		RoleTable rloe = roleTableDao.getr_name(r_id);
		DeptTable deptTable = deptTableDao.getr_name(keshi);

		request.getSession().setAttribute("currentPage", currentPage);
		request.getSession().setAttribute("toalePage", toalePage);
		request.getSession().setAttribute("quaryname", s_name);
		request.getSession().setAttribute("quarykeshi", deptTable);
		request.getSession().setAttribute("quarys_state", s_state);
		request.getSession().setAttribute("quaryr_id", rloe);

		request.setAttribute("map", all_List);
		try {
			request.getRequestDispatcher("brower/charge_net/quaryStaff.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void locationPath(String s_name, String path, HttpServletRequest request, HttpServletResponse response) {
		Staff_Table staff_Table = new Staff_Table();
		Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");

		staff_Table = (Staff_Table) staff_TableDao.findById(s_name);
		try {
			request.getRequestDispatcher(path).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updatePermission(String r_id) {
		RoleTableDao roleTableDao = (RoleTableDao) FactoryDao.getObject("org.great.dao.RoleTableImpl");
		MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");

		List<MenuTable> menu_list = new ArrayList<MenuTable>();
		// 找出菜单名和菜单id
		List<MenuTable> list = new ArrayList<MenuTable>();
		list = memuTableDao.findByIdAndState(r_id, "启用");
		for (int i = 0; i < list.size(); i++) {
			// 通过菜单名找到子级id,
			menu_list = memuTableDao.findByName(list.get(i).getM_name());
			// 添加到菜单树中
			for (int k = 0; k < menu_list.size(); k++) {

				memuTableDao.insetMenutree(list.get(i).getM_id(), menu_list.get(k).getM_id(), "启用");
			}
		}
	}
}
