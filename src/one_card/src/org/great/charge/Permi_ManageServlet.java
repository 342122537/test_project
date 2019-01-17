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

import org.great.dao.FactoryDao;
import org.great.dao.MemuTableDao;
import org.great.dao.RoleTableDao;
import org.great.entity.MenuTable;
import org.great.entity.RoleTable;

import oracle.sql.ARRAY;

/**
 * Servlet implementation class Permi_ManageServlet
 */
@WebServlet("/Permi_ManageServlet1")
public class Permi_ManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Permi_ManageServlet() {
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

		switch (action) {
		case "enter_permi":

			show(request, response, current_id, roleTable, role_list);

			break;

		// case "addAll":
		// System.out.println("进来ALL");
		// // 获取 默认角色数据---管理员权限>>>>业务端""
		//
		// o_list1 = memuTableDao.getOperation(cardmenu.getM_id(), 2,
		// cardmenu.getM_name());
		// // 管理端信息.get
		// m_list1 = memuTableDao.getOperation(systemmenu.getM_id(), 2,
		// systemmenu.getM_name());
		// // System.err.println("出来");
		//
		// // 未分配列表
		// if (m_list1 == null) {
		// m_n_list = m_list;
		// } else {
		// m_n_list = getNotOprate(m_list, m_list1);
		//
		// }
		// // System.err.println("m_n_list++++=" + m_n_list);
		// if (o_list1 == null) {
		// o_n_list = o_list;
		// } else {
		// o_n_list = getNotOprate(o_list, o_list1);
		//
		// }
		// // System.err.println("o_n_list++++=" + o_n_list);
		// // 新增
		// addAllMenu(o_n_list, cardmenu.getM_id());
		// addAllMenu(m_n_list, systemmenu.getM_id());
		//
		// show(request, response, current_id, roleTable, cardmenu, systemmenu,
		// role_list);
		// break;
		// case "removeAll":
		// // 获取 默认角色数据---管理员权限>>>>业务端""
		// o_list1 = memuTableDao.getOperation(cardmenu.getM_id(), 2,
		// cardmenu.getM_name());
		// // 管理端信息.get
		// m_list1 = memuTableDao.getOperation(systemmenu.getM_id(), 2,
		// systemmenu.getM_name());
		//
		// // 移除
		// o_list1 = removeAllMenu(o_list1, cardmenu.getM_id());
		// m_list1 = removeAllMenu(m_list1, systemmenu.getM_id());
		//
		// // 获取未分配列表
		//
		// m_n_list = getNotOprate(m_list, m_list1);
		// o_n_list = getNotOprate(o_list, o_list1);
		//
		// show(request, response, current_id, roleTable, cardmenu, systemmenu,
		// role_list);
		//
		// break;
		// case "addSelected":
		//
		// selectedcard = request.getParameterValues("selected_oprat");
		//
		// // System.err.println("selectedcard" + selectedcard.length + "__________" +
		// // Arrays.toString(selectedcard));
		// selectedsys = request.getParameterValues("selectedsys");
		//
		// // 新增
		// if (selectedcard != null && selectedcard.length > 0) {
		// addMenu1by1(selectedcard, cardmenu.getM_id());
		// } else {
		//
		// System.err.println("selectedcard空");
		// }
		// if (selectedcard != null && selectedsys.length > 0) {
		//
		// addMenu1by1(selectedsys, systemmenu.getM_id());
		// } else {
		// System.err.println("selectedsys空");
		//
		// }
		//
		// // 获取 默认角色数据---管理员权限>>>>业务端""
		// o_list1 = memuTableDao.getOperation(cardmenu.getM_id(), 2,
		// cardmenu.getM_name());
		// // 管理端信息.get
		// m_list1 = memuTableDao.getOperation(systemmenu.getM_id(), 2,
		// systemmenu.getM_name());
		//
		// // 未分配
		// m_n_list = getNotOprate(m_list, m_list1);
		// o_n_list = getNotOprate(o_list, o_list1);
		//
		// show(request, response, current_id, roleTable, cardmenu, systemmenu,
		// role_list);
		// break;
		// case "removeSelected":
		// selectedcard = request.getParameterValues("selected_oprat");
		//
		// // System.err.println("selectedcard" + selectedcard.length + "__________" +
		// // Arrays.toString(selectedcard));
		// selectedsys = request.getParameterValues("selectedsys");
		//
		// // 移除
		// if (selectedcard != null && selectedcard.length > 0) {
		//
		// removeMenu1by1(selectedcard, cardmenu.getL_mid());
		// } else {
		//
		// System.err.println("selectedcard空");
		// }
		// if (selectedcard != null && selectedsys.length > 0) {
		//
		// removeMenu1by1(selectedsys, systemmenu.getL_mid());
		//
		// } else {
		// System.err.println("selectedsys空");
		//
		// }
		//
		// // 获取 默认角色数据---管理员权限>>>>业务端""
		// o_list1 = memuTableDao.getOperation(cardmenu.getM_id(), 2,
		// cardmenu.getM_name());
		// // 管理端信息.get
		// m_list1 = memuTableDao.getOperation(systemmenu.getM_id(), 2,
		// systemmenu.getM_name());
		// // 未分配
		// m_n_list = getNotOprate(m_list, m_list1);
		//
		// o_n_list = getNotOprate(o_list, o_list1);
		//
		// show(request, response, current_id, roleTable, cardmenu, systemmenu,
		// role_list);
		// break;

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
				memuTableDao.insetMenutree(l_mid, x, null);
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
				System.out.println("sdsadsadas+++" + x);

				memuTableDao.removeMenutree(x);
			}
		}

	}

	public void show(HttpServletRequest request, HttpServletResponse response, String current_id, RoleTable roleTable,
			List<RoleTable> role_list) {
		MemuTableDao memuTableDao = (MemuTableDao) FactoryDao.getObject("org.great.dao.MenuTaleImpl");
		List<MenuTable> father_list = new ArrayList<MenuTable>();
		List<MenuTable> o_list = new ArrayList<MenuTable>();
		String path = null;
		HttpSession session = request.getSession();

		// 获取父级列表 传递到前台
		father_list = memuTableDao.findByIdAndState(current_id, "启用");
		System.err.println("father_list============" + father_list);
		session.setAttribute("father_list", father_list);
		Map<String, List<MenuTable>> map = new HashMap();
		for (int i = 0; i < father_list.size(); i++) {

			// 获取子级所有列表 传递到前端 前端同过判断状态显示列表
			List<MenuTable> list1 = memuTableDao.getOperation(father_list.get(i).getM_id(), 0,
					father_list.get(i).getM_name());
			memuTableDao.getOperation(father_list.get(i).getM_id(), 0, father_list.get(i).getM_name());
			map.put(father_list.get(i).getM_name(), list1);

			System.err.println(father_list.get(i).getM_name() + "sdadasdasdsad" + list1);
			o_list = memuTableDao.getOperation(father_list.get(i).getM_id(), 0, father_list.get(i).getM_name());
		}
		session.setAttribute("current_id", current_id);
		session.setAttribute("o_list", o_list);
		session.setAttribute("maplll", map);
		session.setAttribute("role_name", roleTable.getR_name());
		session.setAttribute("role_list", role_list);
		path = "brower/charge_net//NewFile.jsp";
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
