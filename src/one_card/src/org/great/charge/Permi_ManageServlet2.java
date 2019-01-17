package org.great.charge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.great.autoforward.MainServlet;
import org.great.dao.FactoryDao;
import org.great.dao.MemuTableDao;
import org.great.dao.RoleTableDao;
import org.great.entity.MenuTable;
import org.great.entity.RoleTable;

import oracle.sql.ARRAY;

/**
 * Servlet implementation class Permi_ManageServlet
 */
@WebServlet("/Permi_ManageServlet")
public class Permi_ManageServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Permi_ManageServlet2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet( request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("jilai Permi_ManageServlet");
		HttpSession session = request.getSession();
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");
		System.out.println("action====" + action);

		RoleTableDao roleTableDao = (RoleTableDao) FactoryDao.getObject("org.great.dao.RoleTableImpl");
		MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");

		List<RoleTable> role_list = null;
		role_list = roleTableDao.getAll();// 获取角色列表
		String current_id = null;
		current_id = request.getParameter("current_id");// 获取角色id

		String path = null;
		RoleTable roleTable = roleTableDao.getr_name(current_id);// 通过获取角色表

		List<MenuTable> father_card = new ArrayList<MenuTable>();
		List<MenuTable> father_sys = new ArrayList<MenuTable>();
		father_card = memuTableDao.getOperation("2", 0, "卡片管理");// 卡片管理
		father_card = memuTableDao.getOperation("4", 0, "系统管理");// 系统管里

		MenuTable card_menu = new MenuTable();
		MenuTable sys_menu = new MenuTable();

		// 获取父级id
		card_menu = memuTableDao.findByIdAndName(current_id, "卡片管理", null);
		sys_menu = memuTableDao.findByIdAndName(current_id, "系统管理", null);
		System.out.println("card_menu" + card_menu);
		System.out.println("sys_menu" + sys_menu);
		String selectedcard[] = null;
		String selectedsys[] = null;
		switch (action) {
		case "enter_permi":

			show(request, response, current_id, roleTable, role_list);

			break;

		case "addAll":
			System.out.println("进来ALL");
			// 获取 默认角色数据---管理员权限>>>>业务端""

			// 查找所有禁用选项 改为 启用
			memuTableDao.changestate(card_menu.getM_id(), "启用", "禁用", null);
			memuTableDao.changestate(sys_menu.getM_id(), "启用", "禁用", null);

			show(request, response, current_id, roleTable, role_list);
			String loginname = (String) request.getSession().getAttribute("loginname");
			MainServlet.insertolg(loginname, "修改权限");
			break;
		case "removeAll":
			memuTableDao.changestate(card_menu.getM_id(), "禁用", "启用", null);
			memuTableDao.changestate(sys_menu.getM_id(), "禁用", "启用", null);

			show(request, response, current_id, roleTable, role_list);
			loginname = (String) request.getSession().getAttribute("loginname");
			MainServlet.insertolg(loginname, "修改权限");
			break;
		case "addSelected":

			selectedcard = request.getParameterValues("selected_oprat");

			selectedsys = request.getParameterValues("selectedsys");

			// 新增
			if (selectedcard != null && (!selectedcard.equals(""))) {
				addMenu1by1(selectedcard, card_menu.getM_id());
			} else {

				System.err.println("selectedcard空");
			}
			if (selectedcard != null && (!selectedsys.equals(""))) {

				addMenu1by1(selectedsys, sys_menu.getM_id());
			} else {
				System.err.println("selectedsys空");

			}
			loginname = (String) request.getSession().getAttribute("loginname");
			MainServlet.insertolg(loginname, "修改权限");
			show(request, response, current_id, roleTable, role_list);
			break;
		case "removeSelected":
			selectedcard = request.getParameterValues("selected_oprat");

			selectedsys = request.getParameterValues("selectedsys");

			// 移除
			if (selectedcard != null && (!selectedcard.equals(""))) {
				System.err.println("selectedcard空ssds	");
				removeMenu1by1(selectedcard, card_menu.getM_id());
			} else {

				System.err.println("selectedcard空");
			}
			if (selectedcard != null && (!selectedsys.equals(""))) {

				removeMenu1by1(selectedsys, sys_menu.getM_id());

			} else {
				System.err.println("selectedsys空");

			}
			loginname = (String) request.getSession().getAttribute("loginname");
			MainServlet.insertolg(loginname, "修改权限");
			show(request, response, current_id, roleTable, role_list);
			break;

		default:

			show(request, response, current_id, roleTable, role_list);
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

	private List<MenuTable> getNotOprate(List<MenuTable> alllist, List<MenuTable> havelist) {

		List<MenuTable> diff = new ArrayList<MenuTable>();
		ArrayList<String> strings = new ArrayList<String>();
		for (int i = 0; i < havelist.size(); i++) {
			strings.add(havelist.get(i).getM_id());

		}
		// System.out.println(strings);
		for (MenuTable str : alllist)

		{
			// System.out.println(str.getL_mid());
			if (!strings.contains(str.getM_id()))

			{
				diff.add(str);

			} else {
				// System.out.println("相同");
			}

		}
		// System.out.println("未分配列表" + alllist);
		return diff;

	}

	private static List<String> getdifferentList(List<String> list1, List<String> list2) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<String> longList = list1;
		List<String> shortList = list2;
		if (list2.size() > list1.size()) {
			longList = list2;
			shortList = list1;
		}
		for (String string : shortList) {// 将shortList放到map中，map的value任意数字即可
			map.put(string, 0);
		}
		shortList.clear();// 清空shortList，用于存放longList中有map中没有的数据
		Integer in;
		for (String string : longList) {
			in = map.get(string);
			if (null == in) {
				shortList.add(string);// longList中有map中没有的数据
			}
		}
		return shortList;
	}

	public List<MenuTable> addAllMenu(List<MenuTable> have_n_list, String l_mid) {
		MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");

		for (int i = 0; i < have_n_list.size(); i++) {
			if (memuTableDao.insetMenutree(l_mid, have_n_list.get(i).getM_id(), null)) {

			}

		}

		return have_n_list;
	}

	public void addMenu1by1(String[] arr, String l_mid) {
		MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");
		String m_id = null;
		String[] temp;
		String delimeter = ","; // 指定分割字符
		// 分割字符串
		for (int i = 0; i < arr.length; i++) {
			m_id = arr[i];
			temp = m_id.split(delimeter);
			// 普通 for 循环
			for (String x : temp) {
				System.out.println("sdsadsadas+++" + x);
				if (x != null && (!x.equals(""))) {
					memuTableDao.changestate(l_mid, "启用", "禁用", x);

				}
			}

		}

	}

	public List<MenuTable> removeAllMenu(List<MenuTable> have_n_list, String l_mid) {
		MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");
		for (int i = 0; i < have_n_list.size(); i++) {
			memuTableDao.removeMenutree(have_n_list.get(i).getM_id());

		}

		return have_n_list;

	}

	public void removeMenu1by1(String[] arr, String l_mid) {
		List<MenuTable> o_list1 = new ArrayList<MenuTable>();
		String m_id = null;
		String[] temp;
		String delimeter = ","; // 指定分割字符
		MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");
		for (int i = 0; i < arr.length; i++) {
			m_id = arr[i];
			temp = m_id.split(delimeter);
			// 普通 for 循环
			for (String x : temp) {
				System.out.println("似的洒家大厦" + x);
				if (x != null && (!x.equals(""))) {

					memuTableDao.changestate(l_mid, "禁用", "启用", x);
				}
			}
		}

	}

	public void show(HttpServletRequest request, HttpServletResponse response, String current_id, RoleTable roleTable,
			List<RoleTable> role_list) {
		MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");
		List<MenuTable> father_card = new ArrayList<MenuTable>();
		List<MenuTable> father_sys = new ArrayList<MenuTable>();
		List<MenuTable> card1 = new ArrayList<MenuTable>();
		List<MenuTable> sys1 = new ArrayList<MenuTable>();
		List<MenuTable> o_list = new ArrayList<MenuTable>();
		MenuTable card_menu = new MenuTable();
		MenuTable sys_menu = new MenuTable();
		String path = null;
		HttpSession session = request.getSession();

		// 获取父级id
		card_menu = memuTableDao.findByIdAndName(current_id, "卡片管理", null);
		sys_menu = memuTableDao.findByIdAndName(current_id, "系统管理", null);

		// 获取已有列表
		father_card = memuTableDao.getOperation(card_menu.getM_id(), 1, "卡片管理");// 卡片管理
		father_sys = memuTableDao.getOperation(sys_menu.getM_id(), 1, "系统管理");// 系统管里

		// 获取未分配列表
		card1 = memuTableDao.getOperation(card_menu.getM_id(), 2, "卡片管理");// 卡片管理
		sys1 = memuTableDao.getOperation(sys_menu.getM_id(), 2, "系统管理");// 系统管里

		session.setAttribute("father_card", father_card);
		session.setAttribute("father_sys", father_sys);
		session.setAttribute("card1", card1);
		session.setAttribute("sys1", sys1);
		session.setAttribute("current_id", current_id);
		session.setAttribute("o_list", o_list);
		// session.setAttribute("maplll", map);
		session.setAttribute("role_name", roleTable.getR_name());
		session.setAttribute("role_list", role_list);
		path = "brower/charge_net/permi_manage.jsp";
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

}
