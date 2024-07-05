package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.JsonObject;
import com.model.AdminDTO;
import com.model.DataTableDTO;
import com.util.DbConnection;

public class AdminDaoImplementation implements AdminDao {

	@Override
	public boolean registerOrUpdateAdmin(AdminDTO adminDTO) {
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		String INSERT_ADMIN_SQL = "INSERT INTO team(first_name,last_name,admin_mobileno,admin_address,admin_password,admin_email) VALUES(?,?,?,?,?,?)";
		String UPDATE_ADMIN_SQL = "UPDATE team SET first_name=?,last_name=?,admin_mobileno=?,admin_address=?,admin_password=? WHERE id=?";
		boolean admin_inserted = false;
		boolean admin_updated = false;
		try {
			connection = DbConnection.createConnection();
			if (adminDTO.getId() != 0) {
				preparedStatement = connection.prepareStatement(UPDATE_ADMIN_SQL);
			} else {
				preparedStatement = connection.prepareStatement(INSERT_ADMIN_SQL);
			}
			preparedStatement.setString(1, adminDTO.getFirst_name());
			preparedStatement.setString(2, adminDTO.getLast_name());
			preparedStatement.setString(3, adminDTO.getContactNo());
			preparedStatement.setString(4, adminDTO.getAddress());
			preparedStatement.setString(5, adminDTO.getPassword());
			if (adminDTO.getId() != 0) {
				preparedStatement.setInt(6, adminDTO.getId());
				admin_updated = preparedStatement.executeUpdate() > 0;

			} else {
				preparedStatement.setString(6, adminDTO.getEmail());
				admin_inserted = preparedStatement.executeUpdate() > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return admin_inserted || admin_updated;
	}

	@Override
	public JsonObject loginAdmin(AdminDTO adminDTO) {
		JsonObject jsonObject = new JsonObject();
		String ADMIN_LOGIN_SQL = "SELECT id FROM team WHERE is_deleted=0 AND admin_email=? AND admin_password=?";
		try {
			Connection connection = DbConnection.createConnection();
			jsonObject.addProperty("id", 0);
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to Login!!!");
			PreparedStatement preparedStatement = connection.prepareStatement(ADMIN_LOGIN_SQL);
			preparedStatement.setString(1, adminDTO.getEmail());
			preparedStatement.setString(2, adminDTO.getPassword());
			ResultSet result = preparedStatement.executeQuery();
			if (result.next()) {
				jsonObject.addProperty("success", true);
				jsonObject.addProperty("id", result.getInt("id"));
			}
			result.close();
			preparedStatement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	@Override
	public List<AdminDTO> getAllAdmins(AdminDTO adminDTO) {
		List<AdminDTO> adminList = new ArrayList<>();
		ResultSet resultSet = null;
		String SELECT_ALL_ADMINS_SQL = "SELECT * FROM team WHERE is_deleted=0";
		String SELECT_ONE_ADMIN_SQL = "SELECT * FROM team WHERE  is_deleted=0 AND id=?";
		try {
			Connection connection = DbConnection.createConnection();
			Statement statement = connection.createStatement();
			PreparedStatement preparedStatement = null;
			if (adminDTO.getId() != 0) {
				preparedStatement = connection.prepareStatement(SELECT_ONE_ADMIN_SQL);
				preparedStatement.setInt(1, adminDTO.getId());
				resultSet = preparedStatement.executeQuery();
			} else {
				resultSet = statement.executeQuery(SELECT_ALL_ADMINS_SQL);
			}
			while (resultSet.next()) {
				AdminDTO adminDTO2 = new AdminDTO();
				adminDTO2.setId(resultSet.getInt("id"));
				adminDTO2.setFirst_name(resultSet.getString("first_name"));
				adminDTO2.setLast_name(resultSet.getString("last_name"));
				adminDTO2.setEmail(resultSet.getString("admin_email"));
				adminDTO2.setContactNo(resultSet.getString("admin_mobileno"));
				adminDTO2.setAddress(resultSet.getString("admin_address"));
				adminDTO2.setPassword(resultSet.getString("admin_password"));
				adminList.add(adminDTO2);
			}
			statement.close();
			connection.close();
			preparedStatement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return adminList;
	}

	@Override
	public List<JSONObject> getAllOrderedItemsAdmin(DataTableDTO dataTableDTO) {
		List<JSONObject> cartitems = new ArrayList<>();
		String SELECT_ORDERITEMS_SQL = "SELECT cart.id AS orderid, user.user_name, user.user_mobileno, book.title, "
				+ "book.book_price, book.cover_pic, cart.book_id, cart.quantity, "
				+ "cart.total_price, cart.is_tokenused, user.token_amount " + "FROM cart "
				+ "LEFT JOIN book ON cart.book_id = book.id " + "LEFT JOIN user ON cart.user_id = user.id "
				+ "WHERE cart.is_deleted = 1 AND cart.is_ordered = 1 ";

		if (dataTableDTO.getSearchValue() != null && !dataTableDTO.getSearchValue().isEmpty()) {
			SELECT_ORDERITEMS_SQL += "AND (title LIKE ? OR user_name LIKE ? OR user_mobileno LIKE ? OR cart.book_id LIKE ?) ";
		}

		String orderByColumn = dataTableDTO.getOrderByColumn();
		String orderByDirection = dataTableDTO.getOrderByDirection();

		if (orderByColumn != null && !orderByColumn.isEmpty() && orderByDirection != null
				&& !orderByDirection.isEmpty()) {
			SELECT_ORDERITEMS_SQL += "ORDER BY " + orderByColumn + " " + orderByDirection + " ";
		}

		SELECT_ORDERITEMS_SQL += "LIMIT ?, ?";

		try {
			Connection connection = DbConnection.createConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDERITEMS_SQL);

			// Set search value parameters
			if (dataTableDTO.getSearchValue() != null && !dataTableDTO.getSearchValue().isEmpty()) {
				String searchValue = "%" + dataTableDTO.getSearchValue() + "%";
				preparedStatement.setString(1, searchValue);
				preparedStatement.setString(2, searchValue);
				preparedStatement.setString(3, searchValue);
				preparedStatement.setString(4, searchValue);
				// Start index for limit
				preparedStatement.setInt(5, dataTableDTO.getStart());
				// Length for limit
				preparedStatement.setInt(6, dataTableDTO.getLength());
			} else {
				// Start index for limit
				preparedStatement.setInt(1, dataTableDTO.getStart());
				// Length for limit
				preparedStatement.setInt(2, dataTableDTO.getLength());
			}

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				JSONObject ListObject = new JSONObject();
				try {
					ListObject.put("orderid", resultSet.getInt("orderid"));
					ListObject.put("user_name", resultSet.getString("user_name"));
					ListObject.put("usercontact", resultSet.getString("user_mobileno"));
					ListObject.put("title", resultSet.getString("title"));
					ListObject.put("bookprice", resultSet.getDouble("book_price"));
					ListObject.put("bookimage", resultSet.getString("cover_pic"));
					ListObject.put("book_id", resultSet.getInt("book_id"));
					ListObject.put("quantity", resultSet.getInt("quantity"));
					ListObject.put("total_price", resultSet.getDouble("total_price"));
					ListObject.put("is_tokenused", resultSet.getInt("is_tokenused"));
					ListObject.put("token_amount", resultSet.getDouble("token_amount"));
					cartitems.add(ListObject);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			resultSet.close();
			preparedStatement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartitems;
	}

	@Override
	public int getCountOrderTable() {
		int count = 0;
		String COUNT_ORDERS_SQL = "SELECT COUNT('X') FROM cart WHERE is_ordered=1 AND is_deleted=1";
		try {
			Connection connection = DbConnection.createConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(COUNT_ORDERS_SQL);
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
			resultSet.close();
			statement.close();
			connection.close();

		} catch (

		SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

}
