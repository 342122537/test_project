package org.great.charge;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.great.autoforward.MainServlet;
import org.great.dao.FactoryDao;
import org.great.dao.Staff_TableDao;
import org.great.entity.Staff_Table;

/**
 * Servlet implementation class Update
 */
@WebServlet("/UpdateServlet")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePwdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "";
		System.out.println("又进来");
		String uname = req.getParameter("uname");
		String u_pwd = req.getParameter("upwd");
		String s_number = req.getParameter("s_number");
		HttpSession session = req.getSession();
		// 链接数据库
		Staff_TableDao staff_TableDao = (Staff_TableDao) FactoryDao.getObject("org.great.dao.Staff_TableImpl");

		String s_pwd = staff_TableDao.getpwd(s_number);
		PrintWriter out = resp.getWriter();
		System.out.println("原密码" + s_pwd);
		System.out.println("新密码" + u_pwd);
		if (s_pwd.equalsIgnoreCase(u_pwd)) {

			System.out.println(u_pwd + "与原密码一致" + u_pwd);
			out.print("<script>alert('与原密码一致');location.href='brower/charge_net/updatePwd.jsp';</script>");
		} else {
			boolean staff_Table = staff_TableDao.updatepwd(s_number, u_pwd);
			if (staff_Table == false) {

				out.print("<script>alert('修改密码失败');location.href='brower/charge_net/updatePwd.jsp';</script>");

			} else {

				out.print("<script>alert('修改密码成功');location.href='brower/charge_net/updatePwd.jsp';</script>");

				MainServlet.insertolg(uname, "修改密码");
				// path = "brower/charge_net/charge_main.jsp";
				//
				// session.setAttribute("username", staff_Table.getS_name());
				//
				// session.setAttribute("staff_Table", staff_Table);
				// req.getRequestDispatcher(path).forward(req, resp);
				//
				// System.out.println("成功");
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

}
