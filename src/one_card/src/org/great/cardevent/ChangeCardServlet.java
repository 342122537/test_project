package org.great.cardevent;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.great.autoforward.MainServlet;
import org.great.dao.Card_msgDao;
import org.great.dao.FactoryDao;
import org.great.dao.PatientTableDao;
import org.great.entity.PatientTable;

import com.sun.javafx.sg.prism.web.NGWebView;

import net.sf.json.JSONObject;
import oracle.net.aso.p;

/**
 * Servlet implementation class ChangeCardServlet
 */
@WebServlet("/ChangeCardServlet")
public class ChangeCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeCardServlet() {
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
		PatientTableDao patientTableDao = (PatientTableDao) FactoryDao.getObject("org.great.dao.PatientImpl");
		Card_msgDao card_msgDao = (Card_msgDao) FactoryDao.getObject("org.great.dao.Card_msgImpl");
		PatientTable patientTable = new PatientTable();
		PatientTable patientTable1 = new PatientTable();
		PrintWriter printWriter = response.getWriter();
		String old_id = null;
		String id_sex = null;
		String p_name = null;
		String p_sex = null;
		String p_age = null;
		String p_city = null;
		String p_idcard = null;
		String p_phone = null;
		String p_address = null;
		String c_balance = null;
		String c_deposit = null;
		String newc_id = null;
		String tmp = null;
		switch (action) {
		case "read_card":
			old_id = request.getParameter("c_id");
			id_sex = request.getParameter("selects");
			patientTable = patientTableDao.getPatinetOldid(id_sex, old_id);
			/*
			 * if (patientTable != null) { System.out.println("patientTable=" +
			 * patientTable);
			 * 
			 * } else {
			 * 
			 * 
			 * }
			 */
			JSONObject jo = JSONObject.fromObject(patientTable);// 转化Map对象

			printWriter.print(jo);// 返给ajax请求
			printWriter.flush();
			printWriter.close();

			break;

		case "change_card":
			System.out.println("sdsda");
			newc_id = request.getParameter("newc_id");
			old_id = request.getParameter("c_id");
			System.out.println("newc_id=" + newc_id);
			System.out.println("old_id=" + old_id);
			id_sex = request.getParameter("selects");
			System.out.println("selects=" + id_sex);
			// 新的卡号判断是否已被注销
			boolean bool = card_msgDao.chickstate(newc_id, "已注销");
			// 查找id是否已经存在
			patientTable = (PatientTable) patientTableDao.findByc_Id(newc_id);
			// 获取旧卡信息
			if (newc_id.equals(old_id)) {
				tmp = "新卡不能与旧卡号相同";
			} else {

				if (bool) {
					tmp = "卡已被注销";
				} else {

					if (patientTable == null) {
						patientTable = patientTableDao.getPatinetOldid(id_sex, old_id);
						patientTable1 = new PatientTable(newc_id, patientTable.getP_name(), patientTable.getP_sex(),
								patientTable.getP_age(), patientTable.getP_city(), patientTable.getP_idcard(),
								patientTable.getP_phone(), patientTable.getP_address(), patientTable.getC_balance(),
								patientTable.getC_deposit());
						System.out.println("patientTable" + patientTable);

						boolean flag = patientTableDao.insertObject(patientTable1);
						if (flag && patientTableDao.deleteid(old_id)) {
							if (card_msgDao.updateState(old_id, "已注销")) {

								tmp = "换卡成功";
								MainServlet.insertolg(request.getParameter("loginname"), "换卡");
							} else {
								tmp = "更新卡状态失败";
							}
						} else {

							tmp = "换卡失败";
						}

					} else {
						tmp = "卡已存在";
					}
				}
			}
			printWriter.print("<script>alert('" + tmp
					+ " ');location.href='brower/charge_net/applycard/changeCard.jsp';</script>");

			break;
		case "retreatCard":
			System.out.println("计入retreatCard");
			old_id = request.getParameter("c_id");
			// 删除病人列表
			if (patientTableDao.deleteid(old_id)) {
				// 改变卡状态
				if (card_msgDao.updateState(old_id, "待销售")) {

					tmp = "退卡成功";
				} else {
					tmp = "退卡失败";
				}

			}
			printWriter.print("<script>alert('" + tmp
					+ " ');location.href='brower/charge_net/applycard/retreatCard.jsp';</script>");

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
