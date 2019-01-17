package org.great.autoforward;

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
import org.great.dao.PresTableDao;
import org.great.entity.Card_Event;
import org.great.entity.Card_msg;
import org.great.entity.PatientTable;
import org.great.entity.PresTable;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class QuaryServlet
 */
@WebServlet("/QuaryServlet")
public class QuaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuaryServlet() {
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

		PresTableDao presTableDao = (PresTableDao) FactoryDao.getObject("org.great.dao.PresTableImpl");
		// 病人
		PatientTable patientTable = new PatientTable();

		// 输出
		PrintWriter printWriter = response.getWriter();
		List list = new ArrayList();// 传递List
		// 得到action
		String action = request.getParameter("action") == null ? "action" : request.getParameter("action");
		String c_id = request.getParameter("c_id");

		System.out.println("action=" + action);
		// 药方总数
		int count = presTableDao.getTotalCount(c_id);

		// 每页值
		int pageCount = 5;

		// 总页数
		int toalePage = count % pageCount == 0 ? (count / pageCount) : (count / pageCount + 1);

		System.out.println("总条数+" + count + "总页数:" + toalePage);

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

		switch (action) {
		case "show":
			writePresAndPatent(c_id, currentPage, pageCount, response, toalePage);
			break;
		case "firstPage":
			System.out.println("进入firstPage");
			currentPage = 1;

			writePres(c_id, currentPage, pageCount, response);
			break;
		case "last/nextPage":
			System.out.println("进入last/nextPage");
			writePres(c_id, currentPage, pageCount, response);
			break;
		case "endPage":
			System.out.println("进入endPage");
			currentPage = toalePage;
			writePres(c_id, currentPage, pageCount, response);
			break;
		default:

			System.out.println("action有误=" + action);
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

	public static List<PresTable> getPres(String c_id, int currentPage, int pageCount) {
		PresTableDao presTableDao = (PresTableDao) FactoryDao.getObject("org.great.dao.PresTableImpl");
		List<PresTable> presTables = new ArrayList<PresTable>();
		System.out.println("jinlaisdsa");

		presTables = presTableDao.findByc_Id(c_id, currentPage, pageCount);
		return presTables;
	}

	public void writePres(String c_id, int currentPage, int pageCount, HttpServletResponse response) {

		// 输出
		PrintWriter printWriter;
		try {
			printWriter = response.getWriter();

			List<PresTable> presTable = new ArrayList<PresTable>();

			presTable = getPres(c_id, currentPage, pageCount);
			Map m1 = new HashMap();// 传递Map
			m1.put("currentPage", currentPage);
			m1.put("presTables", presTable);
			JSONObject json = JSONObject.fromObject(m1);
			printWriter.print(json);// 返给ajax请求
			printWriter.flush();
			printWriter.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void writePresAndPatent(String c_id, int currentPage, int pageCount, HttpServletResponse response,
			int totalPage) {

		// 输出
		PrintWriter printWriter;
		try {
			printWriter = response.getWriter();

			List<PresTable> presTables = new ArrayList<PresTable>();
			presTables = getPres(c_id, currentPage, pageCount);
			
			PatientTable patientTable = new PatientTable();
			patientTable = MainServlet.findPatient(c_id);

			Card_msg card_msg = new Card_msg();
			card_msg = MainServlet.findCardMsg(c_id);
			if (patientTable == null) {
				presTables = null;
				currentPage = 1;
				totalPage = 1;
			}
			Map m = new HashMap();// 传递Map
			m.put("presTables", presTables);

			m.put("patientTable", patientTable);
			m.put("currentPage", currentPage);
			m.put("toalePage", totalPage);

			System.out.println("map=" + m);
			JSONObject jo = JSONObject.fromObject(m);// 转化Map对象

			printWriter.print(jo);// 返给ajax请求
			printWriter.flush();
			printWriter.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
