package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import org.json.JSONObject;

import com.google.gson.JsonObject;
import com.model.CartDTO;
import com.model.UserDTO;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.service.UserServiceInterface;
import com.service.UserService;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String operation = request.getParameter("method");
		switch (operation) {
		case "register_user":
			insertOrUpdateUser(request, response);
			break;
		case "login_user":
			loginUser(request, response);
			break;
		case "update_user":
			insertOrUpdateUser(request, response);
			break;
		case "delete_user":
			deleteUser(request, response);
			break;
		case "display_user":
			displayUser(request, response);
			break;
		case "getone_user":
			getUser(request, response);
			break;
		case "get_user_update":
			getUserForUpdate(request, response);
			break;
		case "check_userlogin":
			checkUserLogin(request, response);
			break;
		case "add_to_cart":
			addToCart(request, response);
			break;
		case "display_cart":
			displayCartItems(request, response);
			break;
		case "delete_cartitems":
			deleteFromCart(request, response);
			break;
		case "update_cart":
			updateCartQuantity(request, response);
			break;
		case "cart_count":
			CalculateCartCount(request, response);
			break;
		case "after_checkout":
			afterCheckoutOperations(request, response);
			break;
		case "add_to_wishlist":
			addToWishlist(request, response);
			break;
		case "display_wishlist":
			displayWishlistItems(request, response);
			break;
		case "fetch_amount":
			AmountCalculation(request, response);
			break;
		case "create_order":
			try {
				createOrder(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "display_orders":
			displayOrderItems(request, response);
			break;
		case "display_orders_pagignation":
			displayOrderItemsWithPagination(request, response);
			break;
		case "logout_user":
			userLogout(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + operation);
		}
	}

	public void insertOrUpdateUser(HttpServletRequest request, HttpServletResponse response) {
		UserDTO userDto = new UserDTO();
		try {
			PrintWriter writer = response.getWriter();
			userDto.setUsername(StringUtils.trimToEmpty(request.getParameter("user_name")));
			userDto.setUseremail(StringUtils.trimToEmpty(request.getParameter("user_email")));
			userDto.setUsermobileno(StringUtils.trimToEmpty(request.getParameter("user_mobile")));
			userDto.setGender(StringUtils.trimToEmpty(request.getParameter("user_gender")));
			userDto.setAddress(StringUtils.trimToEmpty(request.getParameter("user_address")));
			userDto.setUserpassword(StringUtils.trimToEmpty(request.getParameter("password")));
			String action = request.getParameter("action");
			UserServiceInterface userServiceInterface = new UserService();
			if (action != null) {
				if (action.equalsIgnoreCase("register")) {
					String startDate = StringUtils.trimToEmpty(request.getParameter("Birth_Date"));
					if (StringUtils.isNotEmpty(startDate)) {
						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
						java.util.Date date = sdf1.parse(startDate);
						java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
						userDto.setDob(sqlStartDate);
					}
					writer.write(userServiceInterface.userRegister(userDto).toString());
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
				} else if (action.equalsIgnoreCase("update")) {
					userDto.setUserid(Integer.parseInt(request.getParameter("userid")));
					writer.write(userServiceInterface.userProfileUpdate(userDto).toString());
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
				} else {
					writer.write("<script>Something went wrong</script>");
				}
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void loginUser(HttpServletRequest request, HttpServletResponse response) {
		UserDTO userDto = new UserDTO();
		JsonObject jsonObject = new JsonObject();
		String email = request.getParameter("user_email");
		String password = request.getParameter("password");
		userDto.setUseremail(email);
		userDto.setUserpassword(password);
		if (email != null && password != null) {
			try {
				PrintWriter writer = response.getWriter();
				HttpSession session = request.getSession();
				UserServiceInterface userServiceInterface = new UserService();
				jsonObject = userServiceInterface.userLogin(userDto);
				if (jsonObject.get("userId").getAsInt() != 0) {
					session.setAttribute("userId", jsonObject.get("userId").getAsString());
					session.setAttribute("userName", jsonObject.get("userName").getAsString());
				}
				session.setAttribute("user_mail", userDto.getUseremail());
				writer.write(jsonObject.toString());
				writer.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void checkUserLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		JsonObject jsonObject = new JsonObject();
		try {
			PrintWriter writer = response.getWriter();
			if (session.getAttribute("userId") != null) {
				int userId = Integer.parseInt(session.getAttribute("userId").toString());
				jsonObject.addProperty("userId", userId);
				jsonObject.addProperty("status", true); // status true = user login
			} else {
				jsonObject.addProperty("status", false);
				jsonObject.addProperty("message", "Please login first before adding to cart");
			}
			writer.write(jsonObject.toString());
			writer.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void displayUser(HttpServletRequest request, HttpServletResponse response) {
		UserDTO userDto = new UserDTO();
		UserServiceInterface userServiceInterface = new UserService();
		try {
			PrintWriter writer = response.getWriter();
			writer.write(userServiceInterface.getAllUser(userDto).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getUser(HttpServletRequest request, HttpServletResponse response) {
		UserDTO userDto = new UserDTO();
		int id = Integer.parseInt(request.getParameter("id"));
		userDto.setUserid(id);
		try {
			PrintWriter writer = response.getWriter();
			UserServiceInterface userServiceInterface = new UserService();
			writer.write(userServiceInterface.getAllUser(userDto).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			PrintWriter writer = response.getWriter();
			UserServiceInterface userServiceInterface = new UserService();
			writer.write(userServiceInterface.userProfileDelete(id).toString());
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	}

	public void userLogout(HttpServletRequest request, HttpServletResponse response) {
		try {
			JsonObject jsonObject = new JsonObject();
			PrintWriter writer = response.getWriter();
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
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			writer.write(jsonObject.toString());
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getUserForUpdate(HttpServletRequest request, HttpServletResponse response) {
		UserDTO userDTO = new UserDTO();
		try {
			PrintWriter writer = response.getWriter();
			userDTO.setUserid(Integer.parseInt(request.getParameter("id")));
			UserServiceInterface userServiceInterface = new UserService();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.write(userServiceInterface.getAllUser(userDTO).toString());
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addToCart(HttpServletRequest request, HttpServletResponse response) {
		CartDTO cartDTO = new CartDTO();
		try {
			PrintWriter writer = response.getWriter();
			cartDTO.setBookId(Integer.parseInt(request.getParameter("bookId")));
			cartDTO.setUserId(Integer.parseInt(request.getParameter("userId")));
			cartDTO.setCartItemQuantity(Integer.parseInt(request.getParameter("quantity")));
			cartDTO.setTotalPrice(Double.parseDouble(request.getParameter("price")));
			UserServiceInterface userServiceInterface = new UserService();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.write(userServiceInterface.AddToCart(cartDTO).toString());
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void displayCartItems(HttpServletRequest request, HttpServletResponse response) {
		CartDTO cartDTO = new CartDTO();
		UserServiceInterface userServiceInterface = new UserService();
		try {
			PrintWriter writer = response.getWriter();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = Integer.parseInt((String) session.getAttribute("userId"));
				cartDTO.setUserId(userId);
				writer.write(userServiceInterface.getAllCartItems(cartDTO).toString());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteFromCart(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		CartDTO cartDTO = new CartDTO();
		try {
			PrintWriter writer = response.getWriter();
			UserServiceInterface userServiceInterface = new UserService();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = Integer.parseInt((String) session.getAttribute("userId"));
				cartDTO.setUserId(userId);
				writer.write(userServiceInterface.cartItemDelete(id, userId).toString());
			}
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	}

	public void CalculateCartCount(HttpServletRequest request, HttpServletResponse response) {
		CartDTO cartDTO = new CartDTO();
		try {
			PrintWriter writer = response.getWriter();
			HttpSession session = request.getSession();
			if (session.getAttribute("userId") != null) {
				cartDTO.setUserId(Integer.parseInt((String) session.getAttribute("userId")));
			}
			UserServiceInterface userServiceInterface = new UserService();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.write(userServiceInterface.CalculateCartCount(cartDTO).toString());
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addToWishlist(HttpServletRequest request, HttpServletResponse response) {
		CartDTO cartDTO = new CartDTO();
		try {
			PrintWriter writer = response.getWriter();
			cartDTO.setBookId(Integer.parseInt(request.getParameter("bookId")));
			cartDTO.setUserId(Integer.parseInt(request.getParameter("userId")));
			UserServiceInterface userServiceInterface = new UserService();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.write(userServiceInterface.AddToWishlist(cartDTO).toString());
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void displayWishlistItems(HttpServletRequest request, HttpServletResponse response) {
		UserServiceInterface userServiceInterface = new UserService();
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = session.getAttribute("userId") != null
						? NumberUtils.toInt(Objects.toString(session.getAttribute("userId")))
						: 0;
				if (userId > 0) {
					writer.write(userServiceInterface.getAllwishistItems(userId).toString());
				} else {
					writer.write(new JsonObject().toString());
				}
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateCartQuantity(HttpServletRequest request, HttpServletResponse response) {
		UserServiceInterface userServiceInterface = new UserService();
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = session.getAttribute("userId") != null
						? NumberUtils.toInt(Objects.toString(session.getAttribute("userId")))
						: 0;
				if (userId > 0) {
					int cartId = Integer.parseInt(request.getParameter("cartId"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					writer.write(userServiceInterface.UpdateCartQuantity(userId, cartId, quantity).toString());
				} else {
					writer.write(new JsonObject().toString());
				}
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void AmountCalculation(HttpServletRequest request, HttpServletResponse response) {
		UserServiceInterface userServiceInterface = new UserService();
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = session.getAttribute("userId") != null
						? NumberUtils.toInt(Objects.toString(session.getAttribute("userId")))
						: 0;
				if (userId > 0) {
					boolean istokenused = Boolean.parseBoolean(request.getParameter("token"));
					writer.write(userServiceInterface.AmountCalculation(userId, istokenused).toString());
				} else {
					writer.write(new JsonObject().toString());
				}
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// create order
	public void createOrder(HttpServletRequest request, HttpServletResponse response) {
		String amountParam = request.getParameter("amount");
		if (amountParam == null || amountParam.trim().isEmpty()) {
			System.out.println("Amount parameter is null or empty.");
		}
		try (PrintWriter writer = response.getWriter()) {
			Double totalAmount = Double.parseDouble(amountParam);
			System.out.println("Total amount: " + totalAmount);
//			RazorpayClient client = new RazorpayClient("rzp_test_XEbtsJYNBs2fwY", "6kzOC0RIvhEXcIiZJIrj2JTJ");
			RazorpayClient razorpayClient = new RazorpayClient("rzp_test_XEbtsJYNBs2fwY", "6kzOC0RIvhEXcIiZJIrj2JTJ");
			JSONObject options = new JSONObject();
			options.put("amount", totalAmount * 100);
			options.put("currency", "INR");
			options.put("receipt", "txn_123456");
			Order order = razorpayClient.Orders.create(options);
			System.out.println(order);
			// return order.toString();
			writer.write(order.toString());
			writer.close();
		} catch (Exception e) {
			System.out.println("Invalid amount format: " + amountParam);
		}
	}

	public void afterCheckoutOperations(HttpServletRequest request, HttpServletResponse response) {
		UserServiceInterface userServiceInterface = new UserService();
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = session.getAttribute("userId") != null
						? NumberUtils.toInt(Objects.toString(session.getAttribute("userId")))
						: 0;
				if (userId > 0) {
					boolean tokenflag = Boolean.parseBoolean(request.getParameter("istokenused"));
					writer.write(userServiceInterface.AfterCheckoutOprations(userId, tokenflag).toString());
				} else {
					writer.write(new JsonObject().toString());
				}
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void displayOrderItems(HttpServletRequest request, HttpServletResponse response) {
		CartDTO cartDTO = new CartDTO();
		UserServiceInterface userServiceInterface = new UserService();
		try {
			PrintWriter writer = response.getWriter();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = Integer.parseInt((String) session.getAttribute("userId"));
				cartDTO.setUserId(userId);
				writer.write(userServiceInterface.getAllOrderedItems(cartDTO).toString());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void displayOrderItemsWithPagination(HttpServletRequest request, HttpServletResponse response) {
	    CartDTO cartDTO = new CartDTO();
	    UserServiceInterface userServiceInterface = new UserService();
	    int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	    int pageSize = Integer.parseInt(request.getParameter("pageSize"));
	    try {
	        PrintWriter writer = response.getWriter();
	        HttpSession session = request.getSession();
	        if (session != null) {
	            int userId = Integer.parseInt((String) session.getAttribute("userId"));
	            cartDTO.setUserId(userId);
	            writer.write(userServiceInterface.getOrderedItemsWithPagination(cartDTO, pageNumber, pageSize).toString());
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	        }
	        writer.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	


}
