package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import java.sql.Statement;
import com.google.gson.JsonObject;
import com.model.CartDTO;
import com.model.UserDTO;
import com.util.DbConnection;

public class UserDaoImplementation implements UserDao {

	@Override
	public boolean registerUser(UserDTO userDto) {
		PreparedStatement preparedStatement = null;
		String INSERT_USER_SQL = "INSERT INTO user (user_name,user_email,user_password,user_mobileno,user_birthdate,user_gender,user_address) VALUES(?,?,?,?,?,?,?)";
		boolean user_inserted = false;
		try (Connection connection = DbConnection.createConnection();) {
			preparedStatement = connection.prepareStatement(INSERT_USER_SQL);
			preparedStatement.setString(1, userDto.getUsername());
			preparedStatement.setString(2, userDto.getUseremail());
			preparedStatement.setString(3, userDto.getUserpassword());
			preparedStatement.setString(4, userDto.getUsermobileno());
			preparedStatement.setDate(5, userDto.getDob());
			preparedStatement.setString(6, userDto.getGender());
			preparedStatement.setString(7, userDto.getAddress());
			user_inserted = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user_inserted;
	}

	@Override
	public JsonObject loginUser(UserDTO userDto) {
		JsonObject jsonObject = new JsonObject();
		String FIND_USER = "SELECT id,user_name FROM user WHERE is_deleted=0 AND user_email=? AND user_password=?";
		try {
			Connection connection = DbConnection.createConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(FIND_USER);
			jsonObject.addProperty("userId", 0);
			preparedStatement.setString(1, userDto.getUseremail());
			preparedStatement.setString(2, userDto.getUserpassword());
			ResultSet result = preparedStatement.executeQuery();
			if (result.next()) {
				jsonObject.addProperty("userId", result.getInt("id"));
				jsonObject.addProperty("userName", result.getString("user_name"));
			}
			result.close();
			preparedStatement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	@Override
	public List<UserDTO> getAllUsers(UserDTO userDto) {
		List<UserDTO> userList = new ArrayList<>();
		ResultSet resultSet = null;
		String SELECT_ALL_USERS_SQL = "SELECT * FROM user WHERE is_deleted=0";
		String SELECT_ONE_USER_SQL = "SELECT * FROM user WHERE is_deleted=0 AND id=?";
		try {
			Connection connection = DbConnection.createConnection();
			Statement statement = connection.createStatement();
			PreparedStatement preparedStatement = null;
			if (userDto.getUserid() != 0) {
				preparedStatement = connection.prepareStatement(SELECT_ONE_USER_SQL);
				preparedStatement.setInt(1, userDto.getUserid());
				resultSet = preparedStatement.executeQuery();
			} else {
				resultSet = statement.executeQuery(SELECT_ALL_USERS_SQL);
			}
			while (resultSet.next()) {
				UserDTO userDto2 = new UserDTO();
				userDto2.setUserid(resultSet.getInt("id"));
				userDto2.setUsername(resultSet.getString("user_name"));
				userDto2.setUseremail(resultSet.getString("user_email"));
				userDto2.setUserpassword(resultSet.getString("user_password"));
				userDto2.setUsermobileno(resultSet.getString("user_mobileno"));
				userDto2.setGender(resultSet.getString("user_gender"));
				userDto2.setAddress(resultSet.getString("user_address"));
				userDto2.setDob(resultSet.getDate("user_birthdate"));
				userDto2.setTokenAmount(resultSet.getDouble("token_amount"));
				userList.add(userDto2);
			}
			statement.close();
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			connection.close();
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
		return userList;
	}

	@Override
	public boolean updateUser(UserDTO userDto) {
		PreparedStatement preparedStatement = null;
		String UPDATE_USER_SQL = "UPDATE user SET user_name=?, user_email=?, user_password=?, user_mobileno=?, user_gender=?, user_address=? WHERE id=?";
		boolean user_updated = false;
		try (Connection connection = DbConnection.createConnection();) {
			preparedStatement = connection.prepareStatement(UPDATE_USER_SQL);
			preparedStatement.setString(1, userDto.getUsername());
			preparedStatement.setString(2, userDto.getUseremail());
			preparedStatement.setString(3, userDto.getUserpassword());
			preparedStatement.setString(4, userDto.getUsermobileno());
			preparedStatement.setString(5, userDto.getGender());
			preparedStatement.setString(6, userDto.getAddress());
			preparedStatement.setInt(7, userDto.getUserid()); // Assuming id is available in UserDTO
			user_updated = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user_updated;
	}

	@Override
	public boolean deleteUser(int userId) {
		boolean deleteUser = false;
		Connection connection = DbConnection.createConnection();
		String DELETE_USER_SQl = "UPDATE user SET is_deleted=1 WHERE id=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SQl);
			preparedStatement.setInt(1, userId);
			deleteUser = preparedStatement.executeUpdate() > 0;
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return deleteUser;
	}

	@Override
	public JsonObject addToCart(CartDTO cartDTO) {
		JsonObject object = new JsonObject();
		String INSERT_USER_CART_SQL = "INSERT INTO cart (quantity,total_price,user_id,book_id) VALUES(?,?,?,?)";
		try (Connection connection = DbConnection.createConnection();) {
			object.addProperty("flag", false);
			Statement statement = connection.createStatement();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_CART_SQL);
			preparedStatement.setInt(1, cartDTO.getCartItemQuantity());
			preparedStatement.setDouble(2, cartDTO.getTotalPrice());
			preparedStatement.setInt(3, cartDTO.getUserId());
			preparedStatement.setInt(4, cartDTO.getBookId());
			object.addProperty("flag", preparedStatement.executeUpdate() > 0);
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			statement.close();
			if (preparedStatement != null) {
				preparedStatement.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

	@Override
	public JsonObject CalculateCartCount(CartDTO cartDTO) {
		JsonObject object = new JsonObject();
		String COUNT_CART_SQL = "SELECT cart.quantity AS count FROM cart WHERE is_deleted=0 AND is_ordered=0 AND user_id=?";
		try (Connection connection = DbConnection.createConnection();) {
			object.addProperty("count", 0);
			PreparedStatement preparedStatement = connection.prepareStatement(COUNT_CART_SQL);
			preparedStatement.setInt(1, cartDTO.getUserId());
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				object.addProperty("count", resultSet.getInt("count"));
			}
			resultSet.close();
			if (preparedStatement != null) {
				preparedStatement.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return object;
	}

	@Override
	public List<CartDTO> getAllCartItems(CartDTO cartDTO) {
		List<CartDTO> cartitems = new ArrayList<>();
		// String SELECT_CARTITEMS_SQL = "SELECT book.title,book.book_price,
		// book.cover_pic,cart.id,cart.book_id,cart.quantity,cart.total_price,cart.user_id
		// FROM cart JOIN book ON cart.book_id = book.id WHERE cart.is_deleted=0 AND
		// cart.user_id=?";
		String SELECT_CARTITEMS_SQL = "SELECT book.title, book.book_price, book.cover_pic, cart.id, cart.book_id, cart.quantity, cart.total_price, cart.user_id, user.token_amount FROM cart LEFT JOIN book ON cart.book_id = book.id LEFT JOIN user ON cart.user_id = user.id WHERE cart.is_deleted = 0 AND cart.is_ordered = 0 AND cart.user_id = ?";
		try {
			Connection connection = DbConnection.createConnection();
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			// Create a PreparedStatement and set the parameter
			preparedStatement = connection.prepareStatement(SELECT_CARTITEMS_SQL);
			preparedStatement.setInt(1, cartDTO.getUserId());
			// Execute the query
			resultSet = preparedStatement.executeQuery();
			// Process the result set
			while (resultSet.next()) {
				CartDTO cartDTO1 = new CartDTO();
				cartDTO1.setCartId(resultSet.getInt("id"));
				cartDTO1.setBookId(resultSet.getInt("book_id"));
				cartDTO1.setBookname(resultSet.getString("title"));
				cartDTO1.setBookprice(resultSet.getDouble("book_price"));
				cartDTO1.setBookimage(resultSet.getString("cover_pic"));
				cartDTO1.setCartItemQuantity(resultSet.getInt("quantity"));
				cartDTO1.setTotalPrice(resultSet.getDouble("total_price"));
				cartDTO1.setTokenAmount(resultSet.getDouble("token_amount"));
				cartDTO1.setUserId(resultSet.getInt("user_id"));
				cartitems.add(cartDTO1);
			}
			resultSet.close();
			connection.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartitems;
	}

	@Override
	public boolean deletecartItems(int cartId, int userId) {
		boolean deleteItem = false;
		String DELETE_CARTITEM_SQl = "UPDATE cart SET is_deleted=1 WHERE id=? AND user_id=?";
		try {
			PreparedStatement preparedStatement = null;
			Connection connection = DbConnection.createConnection();
			preparedStatement = connection.prepareStatement(DELETE_CARTITEM_SQl);
			preparedStatement.setInt(1, cartId);
			preparedStatement.setInt(2, userId);
			deleteItem = preparedStatement.executeUpdate() > 0;
			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deleteItem;
	}

	@Override
	public boolean updateCartItems(int cartId, int userId, int newquantity) {
		boolean itemUpdated = false;
		String UPDATE_CARTITEM_SQl = "UPDATE cart c LEFT JOIN book b ON c.book_id = b.id SET c.quantity = ?,c.total_price = ? * b.book_price WHERE c.user_id = ? AND c.id = ? AND C.is_deleted=0";
		try {
			PreparedStatement preparedStatement = null;
			Connection connection = DbConnection.createConnection();
			preparedStatement = connection.prepareStatement(UPDATE_CARTITEM_SQl);
			preparedStatement.setInt(1, newquantity);
			preparedStatement.setInt(2, newquantity);
			preparedStatement.setInt(3, userId);
			preparedStatement.setInt(4, cartId);
			itemUpdated = preparedStatement.executeUpdate() > 0;
			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemUpdated;
	}

	@Override
	public JsonObject addToWishlist(CartDTO cartDTO) {
		JsonObject jsonObject = new JsonObject();
		String CHECK_WISHLIST_SQL = "SELECT COUNT('X') AS count_of_books FROM wishlist WHERE user_id = ? AND book_id = ?";
		String INSERT_WISHLIST_SQL = "INSERT INTO wishlist (user_id, book_id) VALUES (?, ?)";
		String DELETE_WISHLIST_SQL = "DELETE FROM wishlist WHERE user_id = ? AND book_id = ?";

		jsonObject.addProperty("itemDeleted", false);
		jsonObject.addProperty("itemInserted", false);

		try (Connection connection = DbConnection.createConnection();
				PreparedStatement checkStatement = connection.prepareStatement(CHECK_WISHLIST_SQL);
				PreparedStatement insertStatement = connection.prepareStatement(INSERT_WISHLIST_SQL);
				PreparedStatement deleteStatement = connection.prepareStatement(DELETE_WISHLIST_SQL)) {

			// Set parameters for checking if the book is already in the wishlist
			checkStatement.setInt(1, cartDTO.getUserId());
			checkStatement.setInt(2, cartDTO.getBookId());

			// Execute the query to check if the book is in the wishlist
			ResultSet resultSet = checkStatement.executeQuery();
			resultSet.next();
			int countOfBooks = resultSet.getInt("count_of_books");

			if (countOfBooks > 0) {
				// Book is already in the wishlist, so delete it
				deleteStatement.setInt(1, cartDTO.getUserId());
				deleteStatement.setInt(2, cartDTO.getBookId());
				jsonObject.addProperty("itemDeleted", deleteStatement.executeUpdate() > 0);
			} else {
				// Book is not in the wishlist, so insert it
				insertStatement.setInt(1, cartDTO.getUserId());
				insertStatement.setInt(2, cartDTO.getBookId());
				jsonObject.addProperty("itemInserted", insertStatement.executeUpdate() > 0);
			}

			resultSet.close();
			checkStatement.close();
			insertStatement.close();
			deleteStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonObject;
	}

	@Override
	public List<CartDTO> getAllWishlistItems(int userId) {
		List<CartDTO> wishistitems = new ArrayList<>();
		String WISHLIST_QUERY = "SELECT book.title, book.book_price, book.cover_pic,book.id FROM book LEFT JOIN wishlist ON book.id = wishlist.book_id WHERE wishlist.user_id = ?";
		try {
			Connection connection = DbConnection.createConnection();
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			// Create a PreparedStatement and set the parameter
			preparedStatement = connection.prepareStatement(WISHLIST_QUERY);
			preparedStatement.setInt(1, userId);
			// Execute the query
			resultSet = preparedStatement.executeQuery();
			// Process the result set
			while (resultSet.next()) {
				CartDTO cartDTO1 = new CartDTO();
				cartDTO1.setBookname(resultSet.getString("title"));
				cartDTO1.setBookprice(resultSet.getDouble("book_price"));
				cartDTO1.setBookimage(resultSet.getString("cover_pic"));
				cartDTO1.setBookId(resultSet.getInt("id"));
				cartDTO1.setUserId(userId);
				wishistitems.add(cartDTO1);
			}
			resultSet.close();
			connection.close();
			preparedStatement.close();
		} catch (SQLException e) {
			System.out.println("User ID for Exception caught at 368 >>"+userId);
			e.printStackTrace();
		}
		return wishistitems;
	}

	@Override
	public JsonObject AmountCalculation(int userId, boolean istokenused) {
		JsonObject jsonObject = new JsonObject();
		String AMOUNT_CALCULATION_SQL = "SELECT SUM(total_price) FROM cart WHERE user_id=? AND is_deleted = 0";
		String TOKEN_CALCULATION_SQL = "SELECT token_amount from user where id = ? AND is_deleted = 0";
		double totalAmount = 0;
		double tokenAmount = 0;
		double finalAmount = 0;

		try (Connection connection = DbConnection.createConnection();
				PreparedStatement amountStatement = connection.prepareStatement(AMOUNT_CALCULATION_SQL);
				PreparedStatement tokenStatement = connection.prepareStatement(TOKEN_CALCULATION_SQL)) {

			amountStatement.setInt(1, userId);
			try (ResultSet amountResult = amountStatement.executeQuery()) {
				if (amountResult.next()) {
					totalAmount = amountResult.getDouble(1);
				}
			}

			tokenStatement.setInt(1, userId);
			try (ResultSet tokenResult = tokenStatement.executeQuery()) {
				if (tokenResult.next()) {
					tokenAmount = tokenResult.getDouble(1);
				}
			}

			if (istokenused) {
				finalAmount = (totalAmount>=tokenAmount) ? totalAmount - tokenAmount : 1;
				jsonObject.addProperty("userId", userId);
				jsonObject.addProperty("isTokenUsed", true);
				jsonObject.addProperty("totalAmount", finalAmount);
			} else {
				jsonObject.addProperty("userId", userId);
				jsonObject.addProperty("isTokenUsed", false);
				jsonObject.addProperty("totalAmount", totalAmount);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonObject;
	}

	@Override
	public boolean AfterCheckoutOperations(int userId,boolean tokenflag) {
		String UPDATE_CART_SQL = (tokenflag)? "UPDATE cart SET is_ordered = 1, is_deleted = 1, is_tokenused = 1 WHERE user_id = ? AND is_deleted = 0 AND is_ordered = 0" :"UPDATE cart SET is_ordered = 1, is_deleted = 1 WHERE user_id = ? AND is_deleted = 0 AND is_ordered = 0";
	//	String INSERT_ORDER_SQL = "INSERT INTO orders (user_id, book_id, amount) SELECT user_id, book_id, (SELECT SUM(total_price) FROM cart WHERE user_id = ? AND is_deleted = 0) AS total_amount FROM cart WHERE is_ordered = 1 AND user_id = ?";
		boolean itemUpdated = false;
		try {
			PreparedStatement preparedStatement = null;
			Connection connection = DbConnection.createConnection();
			preparedStatement = connection.prepareStatement(UPDATE_CART_SQL);
			preparedStatement.setInt(1, userId);
			itemUpdated = preparedStatement.executeUpdate() > 0;
			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemUpdated;
	}

	@Override
	public List<CartDTO> getAllOrderedItems(CartDTO cartDTO) {
		List<CartDTO> cartitems = new ArrayList<>();
		String SELECT_ORDERITEMS_SQL = "SELECT book.title, book.book_price, book.cover_pic, cart.id, cart.book_id, cart.quantity, cart.total_price, cart.user_id, user.token_amount FROM cart LEFT JOIN book ON cart.book_id = book.id LEFT JOIN user ON cart.user_id = user.id WHERE cart.is_deleted = 1 AND cart.is_ordered = 1 AND cart.user_id = ? ORDER BY cart.created_at DESC";
		try {
			Connection connection = DbConnection.createConnection();
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			// Create a PreparedStatement and set the parameter
			preparedStatement = connection.prepareStatement(SELECT_ORDERITEMS_SQL);
			preparedStatement.setInt(1, cartDTO.getUserId());
			// Execute the query
			resultSet = preparedStatement.executeQuery();
			// Process the result set
			while (resultSet.next()) {
				CartDTO cartDTO1 = new CartDTO();
				cartDTO1.setCartId(resultSet.getInt("id"));
				cartDTO1.setBookId(resultSet.getInt("book_id"));
				cartDTO1.setBookname(resultSet.getString("title"));
				cartDTO1.setBookprice(resultSet.getDouble("book_price"));
				cartDTO1.setBookimage(resultSet.getString("cover_pic"));
				cartDTO1.setCartItemQuantity(resultSet.getInt("quantity"));
				cartDTO1.setTotalPrice(resultSet.getDouble("total_price"));
				cartDTO1.setTokenAmount(resultSet.getDouble("token_amount"));
				cartDTO1.setUserId(resultSet.getInt("user_id"));
				cartitems.add(cartDTO1);
			}
			resultSet.close();
			connection.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartitems;
	}
	
	@Override
	public Map<String, Object> getOrderedItemsWithPagination(CartDTO cartDTO, int pageNumber, int pageSize) {
	    Map<String, Object> result = new HashMap<>();
	    List<CartDTO> cartItems = new ArrayList<>();
	    int totalCount = 0;
	    String SELECT_ORDERITEMS_SQL = "SELECT COUNT(*) AS total_count FROM cart WHERE is_deleted = 1 AND is_ordered = 1 AND user_id = ?;";

	    try (Connection connection = DbConnection.createConnection();
	         PreparedStatement countStatement = connection.prepareStatement(SELECT_ORDERITEMS_SQL)) {
	        countStatement.setInt(1, cartDTO.getUserId());
	        try (ResultSet countResultSet = countStatement.executeQuery()) {
	            if (countResultSet.next()) {
	                totalCount = countResultSet.getInt("total_count");
	            }
	        }

	        String SELECT_PAGED_ORDERITEMS_SQL = "SELECT book.title, book.book_price, book.cover_pic, cart.id, cart.book_id, cart.quantity, cart.total_price, cart.user_id, user.token_amount " +
	                "FROM cart " +
	                "LEFT JOIN book ON cart.book_id = book.id " +
	                "LEFT JOIN user ON cart.user_id = user.id " +
	                "WHERE cart.is_deleted = 1 AND cart.is_ordered = 1 AND cart.user_id = ? " +
	                "ORDER BY cart.created_at DESC " +
	                "LIMIT ? OFFSET ?;";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PAGED_ORDERITEMS_SQL)) {
	            preparedStatement.setInt(1, cartDTO.getUserId());
	            preparedStatement.setInt(2, pageSize);
	            preparedStatement.setInt(3, (pageNumber - 1) * pageSize);

	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    CartDTO cartDTO1 = new CartDTO();
	                    cartDTO1.setCartId(resultSet.getInt("id"));
	                    cartDTO1.setBookId(resultSet.getInt("book_id"));
	                    cartDTO1.setBookname(resultSet.getString("title"));
	                    cartDTO1.setBookprice(resultSet.getDouble("book_price"));
	                    cartDTO1.setBookimage(resultSet.getString("cover_pic"));
	                    cartDTO1.setCartItemQuantity(resultSet.getInt("quantity"));
	                    cartDTO1.setTotalPrice(resultSet.getDouble("total_price"));
	                    cartDTO1.setTokenAmount(resultSet.getDouble("token_amount"));
	                    cartDTO1.setUserId(resultSet.getInt("user_id"));
	                    cartItems.add(cartDTO1);
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    result.put("cartitems", cartItems);
	    result.put("total_count", totalCount);
	    return result;
	}


	
}
