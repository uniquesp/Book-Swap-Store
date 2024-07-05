package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.JsonObject;
import com.model.AdminDTO;
import com.model.DataTableDTO;
import com.service.AdminService;
import com.service.AdminServiceInterface;

@MultipartConfig
@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession httpSession = request.getSession();
		if (httpSession == null) {
			response.sendRedirect(request.getContextPath() + "/Admin-Login.jsp");
		}

		String operation = request.getParameter("method");
		switch (operation) {
		case "admin_registration":
			addorUpdateAdmin(request, response);
			break;
		case "admin_login":
			adminLogin(request, response);
			break;
		case "admin_update":
			addorUpdateAdmin(request, response);
			break;
		case "admin_delete":

			break;
		case "get_admin":
			getAdmin(request, response);
			break;
		case "admin_logout":
			adminLogout(request, response);
			break;
		case "admin_orderdetails":
			displayOrderItemsAdmin(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + operation);
		}
	}

	public void addorUpdateAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		AdminDTO adminDTO = new AdminDTO();
		AdminServiceInterface adminServiceInterface = new AdminService();
		try (PrintWriter writer = response.getWriter()) {
			try {

				adminDTO.setFirst_name(StringUtils.trimToEmpty(request.getParameter("first_name")));
				adminDTO.setLast_name(StringUtils.trimToEmpty(request.getParameter("last_name")));
				adminDTO.setEmail(StringUtils.trimToEmpty(request.getParameter("admin_email")));
				adminDTO.setContactNo(StringUtils.trimToEmpty(request.getParameter("admin_mobileno")));
				adminDTO.setAddress(StringUtils.trimToEmpty(request.getParameter("admin_address")));
				adminDTO.setPassword(StringUtils.trimToEmpty(request.getParameter("password")));
				String action = request.getParameter("action");
				if (action.equalsIgnoreCase("register_admin")) {
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					writer.write(adminServiceInterface.addAdmin(adminDTO).toString());
				} else if (action.equalsIgnoreCase("update_admin")) {
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					int id = Integer.parseInt(request.getParameter("adminId"));
					adminDTO.setId(id);
					writer.write(adminServiceInterface.updateAdmin(adminDTO).toString());
				} else {
					writer.write("<script>Something went wrong</script>");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void adminLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try (PrintWriter writer = response.getWriter()) {
			AdminDTO adminDTO = new AdminDTO();
			AdminServiceInterface adminServiceInterface = new AdminService();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			adminDTO.setEmail(email);
			adminDTO.setPassword(password);
			HttpSession session = request.getSession();
			if (email != null && password != null) {
				try {
					response.setContentType("application/json");
					JsonObject jsonObject = adminServiceInterface.loginAdmin(adminDTO);
					int id = jsonObject.get("id").getAsInt();
					writer.write(jsonObject.toString());
					writer.close();
					session.setAttribute("admin_email", adminDTO.getEmail());
					session.setAttribute("admin_id", id);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void adminLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try (PrintWriter writer = response.getWriter()) {
			JsonObject jsonObject = new JsonObject();
			try {
				HttpSession session = request.getSession(false);
				if (session != null) {
					session.invalidate();
					jsonObject.addProperty("success", true);
				} else {
					jsonObject.addProperty("success", false);
					jsonObject.addProperty("message", "No active session found");
				}
			} catch (Exception e) {
				jsonObject.addProperty("success", false);
				jsonObject.addProperty("message", "Error during logout");
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.write(jsonObject.toString());
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void getAdmin(HttpServletRequest request, HttpServletResponse response) {
		try (PrintWriter writer = response.getWriter()) {
			AdminDTO adminDTO = new AdminDTO();
			try {
				HttpSession session = request.getSession();
				if (session != null) {
					String adminEmail = session.getAttribute("admin_email") != null
							? (String) session.getAttribute("admin_email")
							: null;
					int adminId = (int) session.getAttribute("admin_id");
					adminDTO.setId(adminId);
					if (adminEmail != null && !adminEmail.isEmpty()) {
						AdminServiceInterface adminService = new AdminService();
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						writer.write(adminService.getAdminDetails(adminDTO).toString());
						writer.close();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public void displayOrderItemsAdmin(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		DataTableDTO dataTableDTO = new DataTableDTO();
		AdminServiceInterface adminServiceInterface = new AdminService();
		try {
			PrintWriter writer = response.getWriter();
			String orderByColumnIndex = request.getParameter("order[0][column]");
			String orderByColumn = request.getParameter("columns[" + orderByColumnIndex + "][data]");
			String orderByDirection = request.getParameter("order[0][dir]");
			dataTableDTO.setStart(Integer.parseInt(request.getParameter("start")));
			dataTableDTO.setLength(Integer.parseInt(request.getParameter("length")));
			dataTableDTO.setOrderByColumn(orderByColumn);
			dataTableDTO.setOrderByDirection(orderByDirection);
			dataTableDTO.setSearchValue(request.getParameter("search[value]"));
			writer.write(adminServiceInterface.getAllOrderedItemsAdmin(dataTableDTO).toString());
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
