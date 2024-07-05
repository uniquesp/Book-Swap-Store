package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.model.BookDTO;
import com.model.BookSellDTO;
import com.model.DataTableDTO;
import com.model.FilterDTO;
import com.util.DbConnection;

public class BookDaoImplementation implements BookDao {

private PreparedStatement preparedStatement;

	//------------------------------------------------category Add/Update-----------------------------------------------------------------------------------------------------------------
	@Override
	public boolean addOrUpdateCategory(BookDTO bookDTO) {
		String CATEGORY_SQL = bookDTO.getCategory_id() != 0 ? "UPDATE book_category SET category_name=? WHERE id=?"
				: "INSERT INTO book_category (category_name) VALUES(?)";
		boolean category = false;
		Connection connection = DbConnection.createConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(CATEGORY_SQL);
			preparedStatement.setString(1, bookDTO.getCategory());
			if (bookDTO.getCategory_id() != 0) {
				preparedStatement.setInt(2, bookDTO.getCategory_id());
			}
			category = preparedStatement.executeUpdate() > 0;
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return category;
	}

//----------------------------------------------------Display category----------------------------------------------------------------------------------------------------------
	@Override
	public List<BookDTO> getAllCategories(BookDTO bookDTO) {
		List<BookDTO> bookList = new ArrayList<>();
		String SELECT_ALL_CATEGORY_SQL = "SELECT * FROM book_category";
		String SELECT_ONE_CATEGORY_SQL = "SELECT * FROM book_category WHERE id=?";
		Connection connection = DbConnection.createConnection();
		try {
			PreparedStatement preparedStatement = null;
			Statement statement = connection.createStatement();
			ResultSet resultSet = null;
			if (bookDTO.getCategory_id() != 0) {

				preparedStatement = connection.prepareStatement(SELECT_ONE_CATEGORY_SQL);
				preparedStatement.setInt(1, bookDTO.getCategory_id());
				resultSet = preparedStatement.executeQuery();
			} else {
				resultSet = statement.executeQuery(SELECT_ALL_CATEGORY_SQL);
			}
			while (resultSet.next()) {
				BookDTO bookDTO2 = new BookDTO();
				bookDTO2.setCategory_id(resultSet.getInt("id"));
				bookDTO2.setCategory(resultSet.getString("category_name"));
				bookList.add(bookDTO2);
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
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
		return bookList;
	}

//---------------------------------------------------SubCategory Add/Update-----------------------------------------------------------------------------------------------------------
	@Override
	public boolean addOrUpdateSubCategory(BookDTO bookDTO) {
		PreparedStatement preparedStatement = null;
		Connection connection = null; // Declare the Connection object outside the try block
		String SUBCATEGORY_SQL;

		if (bookDTO.getSubCategory_id() != 0) {
			SUBCATEGORY_SQL = "UPDATE book_subcategory SET subcategory_name=?, category_id=? WHERE id=?";
		} else {
			SUBCATEGORY_SQL = "INSERT INTO book_subcategory (subcategory_name, category_id) VALUES (?, ?)";
		}

		boolean subcategory_Change = false;
		try {
			connection = DbConnection.createConnection();
			preparedStatement = connection.prepareStatement(SUBCATEGORY_SQL);
			preparedStatement.setString(1, bookDTO.getSub_category());
			preparedStatement.setInt(2, bookDTO.getCategory_id());
			if (bookDTO.getSubCategory_id() != 0) {
				preparedStatement.setInt(3, bookDTO.getSubCategory_id());
			}
			subcategory_Change = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close(); // Close the connection in the finally block
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return subcategory_Change;
	}

//------------------------------------------------Display subcategory---------------------------------------------------------------------------------------------------------------	
	@Override
	public List<BookDTO> getAllSubCategories(BookDTO bookDTO) {
		List<BookDTO> bookList = new ArrayList<>();
		String DISPLAY_SUBCATEGORY_DETAILS_SQL = "SELECT * \n" + "FROM book_subcategory\n" + "LEFT JOIN book_category\n"
				+ "ON book_subcategory.category_id = book_category.id";
		String DISPLAY_ONE_SUBCATEGORY_DETAILS = "SELECT * FROM book_subcategory LEFT JOIN book_category ON book_subcategory.category_id = book_category.id WHERE book_subcategory.id=?";

		try {
			Connection connection = DbConnection.createConnection();
			Statement statement = connection.createStatement();
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			if (bookDTO.getSubCategory_id() != 0) {
				preparedStatement = connection.prepareStatement(DISPLAY_ONE_SUBCATEGORY_DETAILS);
				preparedStatement.setInt(1, bookDTO.getSubCategory_id());
				resultSet = preparedStatement.executeQuery();
			} else {
				resultSet = statement.executeQuery(DISPLAY_SUBCATEGORY_DETAILS_SQL);
			}
			while (resultSet.next()) {
				BookDTO bookDTO2 = new BookDTO();
				bookDTO2.setSubCategory_id(resultSet.getInt("id"));
				bookDTO2.setSub_category(resultSet.getString("subcategory_name"));
				bookDTO2.setCategory_id(resultSet.getInt("category_id"));
				bookDTO2.setCategory(resultSet.getString("category_name"));
				bookList.add(bookDTO2);
			}
			resultSet.close();
			statement.close();
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookList;
	}
//---------------------------------------- select subcategory from categoryid------------------------------------------------------------------------------------------------------------------------
	
	@Override
	public List<BookDTO> getSubcategoryFromCategoryId(int categoryId) {
	    List<BookDTO> bookList = new ArrayList<>();

	    String DISPLAY_ONE_SUBCATEGORY_DETAILS = "SELECT subcategory_name,id FROM book_subcategory WHERE category_id = ?";

	    try {
	        Connection connection = DbConnection.createConnection();
	        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAY_ONE_SUBCATEGORY_DETAILS);
	        preparedStatement.setInt(1, categoryId);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            BookDTO bookDTO = new BookDTO();
	            bookDTO.setSub_category(resultSet.getString("subcategory_name"));
	            bookDTO.setSubCategory_id(resultSet.getInt("id"));
	            bookDTO.setCategory_id(categoryId);
	            bookList.add(bookDTO);
	        }

	        resultSet.close();
	        preparedStatement.close();
	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    return bookList;
	}
	
	
//--------------------------------------Book Add/Update----------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public boolean registerOrUpdateBook(BookDTO bookDTO) {
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		String INSERT_BOOK_SQL = "INSERT INTO book(title,author,publication_year,category_id,subcategory_id,book_price,language,publisher,description,book_status,cover_pic) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		String UPDATE_BOOK_SQL = "UPDATE book SET title=?,author=?,publication_year=?,category_id=?,subcategory_id=?,book_price=?,language=?,publisher=?,description=?,book_status=?"
				+ (bookDTO.getImage() != null ? ",cover_pic=?" : "") + "WHERE id=?";
		boolean book_inserted = false;
		boolean book_updated = false;
		try {
			connection = DbConnection.createConnection();
			if (bookDTO.getId() != 0) {
				preparedStatement = connection.prepareStatement(UPDATE_BOOK_SQL);
				// preparedStatement.setInt(11, bookDTO.getId());
			} else {
				preparedStatement = connection.prepareStatement(INSERT_BOOK_SQL);
			}
			preparedStatement.setString(1, bookDTO.getTitle());
			preparedStatement.setString(2, bookDTO.getAuthor());
			preparedStatement.setInt(3, bookDTO.getPublicationYear());
			preparedStatement.setInt(4, bookDTO.getCategory_id());
			preparedStatement.setInt(5, bookDTO.getSubCategory_id());
			preparedStatement.setDouble(6, bookDTO.getPrice());
			preparedStatement.setString(7, bookDTO.getLanguage());
			preparedStatement.setString(8, bookDTO.getPublisher());
			preparedStatement.setString(9, bookDTO.getDescription());
			preparedStatement.setString(10, bookDTO.getBookStatus());
			if (bookDTO.getImage() != null) {
				preparedStatement.setString(11, bookDTO.getImage());
			}
			if (bookDTO.getId() != 0) {
				preparedStatement.setInt((bookDTO.getImage() != null ? 12 : 11), bookDTO.getId());
			}
			if (bookDTO.getId() != 0) {
				book_updated = preparedStatement.executeUpdate() > 0;
			} else {
				book_inserted = preparedStatement.executeUpdate() > 0;
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
		return book_inserted || book_updated;
	}

//-----------------------------------------Get All Books-------------------------------------------------------------------------------------------------------------------------
	@Override
	public List<BookDTO> getAllBooks(BookDTO bookDTO) {
		List<BookDTO> bookList = new ArrayList<>();

		String SELECT_ALL_BOOK_SQL = "SELECT b.*,c.category_name,s.subcategory_name FROM book b LEFT JOIN book_category c ON b.category_id = c.id LEFT JOIN book_subcategory s ON b.subcategory_id = s.id WHERE b.is_deleted = 0";
		String SELECT_ONE_BOOK_SQL = "SELECT b.*, c.category_name, s.subcategory_name FROM book b LEFT JOIN book_category c ON b.category_id = c.id LEFT JOIN book_subcategory s ON b.subcategory_id = s.id WHERE b.id = ?";

		try {
			Connection connection = DbConnection.createConnection();
			PreparedStatement preparedStatement = null;
			Statement statement = connection.createStatement();
			ResultSet resultSet = null;
			if (bookDTO.getId() != 0) {
				preparedStatement = connection.prepareStatement(SELECT_ONE_BOOK_SQL);
				preparedStatement.setInt(1, bookDTO.getId());
				resultSet = preparedStatement.executeQuery();
			} else {
				resultSet = statement.executeQuery(SELECT_ALL_BOOK_SQL);
			}
			while (resultSet.next()) {
				BookDTO bookDTO2 = new BookDTO();
				bookDTO2.setId(resultSet.getInt("id"));
				bookDTO2.setTitle(resultSet.getString("title"));
				bookDTO2.setAuthor(resultSet.getString("author"));
				bookDTO2.setCategory(resultSet.getString("category_name"));
				bookDTO2.setSub_category(resultSet.getString("subcategory_name"));
				bookDTO2.setPublicationYear(resultSet.getInt("publication_year"));
				bookDTO2.setPublisher(resultSet.getString("publisher"));
				bookDTO2.setPrice(resultSet.getDouble("book_price"));
				bookDTO2.setLanguage(resultSet.getString("language"));
				bookDTO2.setDescription(resultSet.getString("description"));
				bookDTO2.setBookStatus(resultSet.getString("book_status"));
				bookDTO2.setImage(resultSet.getString("cover_pic"));
				bookDTO2.setCategory_id(resultSet.getInt("category_id"));
				bookDTO2.setSubCategory_id(resultSet.getInt("subcategory_id"));
				bookList.add(bookDTO2);
			}
			statement.close();
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			resultSet.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookList;
	}

//-----------------------------Delete Book----------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public boolean deleteBook(int bookid) {
		boolean deletedbook = false;
		String DELETE_BOOK_SQl = "UPDATE book SET is_deleted=1 WHERE id=?";
		try {
			Connection connection = DbConnection.createConnection();
			PreparedStatement preparedStatement = null;
			preparedStatement = connection.prepareStatement(DELETE_BOOK_SQl);
			preparedStatement.setInt(1, bookid);
			deletedbook = preparedStatement.executeUpdate() > 0;
			preparedStatement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deletedbook;
	}

//----------------------------------------book sell-----------------------------------------------------------------------------------------------------------------------------------------

	@Override
	public boolean addBookSellRequest(BookSellDTO bookSellDTO) {
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		String INSERT_BOOK_SQL = "INSERT INTO book_sell (book_name,book_author,publication_year,book_language,selling_price,original_price,book_image,requestfor,user_id) VALUES(?,?,?,?,?,?,?,?,?)";
		boolean book_inserted = false;
		try {
			connection = DbConnection.createConnection();
			preparedStatement = connection.prepareStatement(INSERT_BOOK_SQL);
			preparedStatement.setString(1, bookSellDTO.getBook_name());
			preparedStatement.setString(2, bookSellDTO.getBook_author());
			preparedStatement.setString(3,bookSellDTO.getPublication_Year());
			preparedStatement.setString(4,bookSellDTO.getBook_language());
			preparedStatement.setDouble(5, bookSellDTO.getSelling_price());
			preparedStatement.setDouble(6,bookSellDTO.getOrignal_price());
			preparedStatement.setString(7,bookSellDTO.getBook_image());
			preparedStatement.setString(8,bookSellDTO.getRequest());
			preparedStatement.setInt(9, bookSellDTO.getUser_id() );
		   book_inserted = preparedStatement.executeUpdate() > 0;
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
		return book_inserted;
	}
	
	
//----------------------------------------Display book sell Request-----------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public List<BookSellDTO> getAllBookSellRequests(BookSellDTO bookSellDTO) {
		List<BookSellDTO> bookList = new ArrayList<>();

		String SELECT_ALL_REQUESTS_SQL = "SELECT user.user_name,user.user_email,book_sell.id,book_name,book_author,publication_year,book_language,selling_price,original_price,book_image,book_sell.requestfor,book_sell.user_id,book_sell.status FROM book_sell LEFT JOIN user ON book_sell.user_id = user.id";
		String SELECT_ONE_USER_REQUESTS_SQL = "SELECT * FROM book_sell WHERE user_id=?;";

		try {
			Connection connection = DbConnection.createConnection();
			PreparedStatement preparedStatement = null;
			Statement statement = connection.createStatement();
			ResultSet resultSet = null;
			if (bookSellDTO.getUser_id() != 0) {
				preparedStatement = connection.prepareStatement(SELECT_ONE_USER_REQUESTS_SQL);
				preparedStatement.setInt(1, bookSellDTO.getUser_id());
				resultSet = preparedStatement.executeQuery();
			} else {
				resultSet = statement.executeQuery(SELECT_ALL_REQUESTS_SQL);
			}
			while (resultSet.next()) {
				BookSellDTO bookSellDTO1 = new BookSellDTO();
				bookSellDTO1.setSellrequestid(resultSet.getInt("id"));
				bookSellDTO1.setBook_name(resultSet.getString("book_name"));
				bookSellDTO1.setBook_author(resultSet.getString("book_author"));
				bookSellDTO1.setBook_language(resultSet.getString("book_language"));
				bookSellDTO1.setPublication_Year(resultSet.getString("publication_year").substring(0, 4));
				bookSellDTO1.setOrignal_price(resultSet.getDouble("original_price"));
				bookSellDTO1.setSelling_price(resultSet.getDouble("selling_price"));
				bookSellDTO1.setBook_image(resultSet.getString("book_image"));
				bookSellDTO1.setRequest(resultSet.getString("requestfor"));
				bookSellDTO1.setStatus(resultSet.getString("status")); 
				if (bookSellDTO.getUser_id() == 0) {
					bookSellDTO1.setUser_name(resultSet.getString("user_name"));
					bookSellDTO1.setUser_email(resultSet.getString("user_email"));
					bookSellDTO1.setUser_id(resultSet.getInt("user_id"));
				} 
					 
				bookList.add(bookSellDTO1);
			}
			statement.close();
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			resultSet.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookList;
	}
	
	
//----------------------------------------Update book sell Request-----------------------------------------------------------------------------------------------------------------------------------------

	@Override
	public boolean processSellRequest(int requestId,boolean flag) {
		String UPDATE_SellRequest_SQL = (flag)? "UPDATE book_sell SET status=\"Accepted\" WHERE id=? AND is_deleted=0" :"UPDATE book_sell SET status=\"Rejected\" WHERE id=? AND is_deleted=0";
		boolean itemUpdated = false;
		try {
			PreparedStatement preparedStatement = null;
			Connection connection = DbConnection.createConnection();
			preparedStatement = connection.prepareStatement(UPDATE_SellRequest_SQL);
			preparedStatement.setInt(1, requestId);
			itemUpdated = preparedStatement.executeUpdate() > 0;
			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemUpdated;
	}
	
	
	
//-------------------------------------------------counts----------------------------------------------------------------------------------------------------------------------------------------

	@Override
	public JsonObject displayCounts(int adminId) {
		JsonObject jsonObject = new JsonObject();
		String BOOK_REQUEST_COUNT_SQL = "SELECT COUNT('x') FROM book_sell WHERE is_deleted=0";
		String BOOK_COUNT_SQL = "SELECT COUNT('x') FROM book WHERE is_deleted=0";
		String USER_COUNT_SQL = "SELECT COUNT('x') FROM user WHERE is_deleted=0";
		String ORDER_COUNT_SQL = "SELECT COUNT('x') AS total_orders,SUM(total_price) AS amount FROM cart WHERE is_deleted=1 AND is_ordered=1";
		String TODAY_ORDERS_COUNT_SQL = "SELECT COUNT('X') AS todays_orders,SUM(total_price) AS total_amount FROM cart WHERE is_deleted=1 AND is_ordered=1 AND DATE(created_at) = CURDATE()";

		try {
			Connection connection = DbConnection.createConnection();
			Statement statement = connection.createStatement();
			
			jsonObject.addProperty("book_request_count", 0);
			jsonObject.addProperty("book_count", 0);
			jsonObject.addProperty("user_count", 0);
			jsonObject.addProperty("total_orders", 0);
			jsonObject.addProperty("amount", 0);
			jsonObject.addProperty("todays_orders",0);
			jsonObject.addProperty("total_amount", 0);
			
			if (adminId != 0) {
				// Execute queries and store results in JsonObject
				ResultSet resultSet1 = statement.executeQuery(BOOK_REQUEST_COUNT_SQL);
				while (resultSet1.next()) {
					jsonObject.addProperty("book_request_count", resultSet1.getInt(1));
				}
				resultSet1.close();
				
				ResultSet resultSet2 = statement.executeQuery(BOOK_COUNT_SQL);
				while (resultSet2.next()) {
					jsonObject.addProperty("book_count", resultSet2.getInt(1));
				}
				resultSet2.close();

				ResultSet resultSet3 = statement.executeQuery(USER_COUNT_SQL);
				while (resultSet3.next()) {
					jsonObject.addProperty("user_count", resultSet3.getInt(1));
				}
				resultSet3.close();

				ResultSet resultSet4 = statement.executeQuery(ORDER_COUNT_SQL);
				while (resultSet4.next()) {
					jsonObject.addProperty("total_orders", resultSet4.getInt(1));
					jsonObject.addProperty("total_amount", resultSet4.getDouble(2));
				}
				resultSet4.close();

				ResultSet resultSet5 = statement.executeQuery(TODAY_ORDERS_COUNT_SQL);
				while (resultSet5.next()) {
					jsonObject.addProperty("todays_orders", resultSet5.getInt(1));
					jsonObject.addProperty("todays_amount", resultSet5.getDouble(2));
				}
				resultSet5.close();
			}

			statement.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return jsonObject;
	}

	

	/*-------------------------------------Books Filter-----------------------------------------------------------------------*/
	
	@Override
	public JsonObject getFilteredBooks(FilterDTO filterDTO, int pageNumber, int pageSize) {
		JsonObject jsonObject = new JsonObject();
		List<BookDTO> books = new ArrayList<>();
		StringBuilder queryBuilder = new StringBuilder();
		int totalCount = 0;
		jsonObject.addProperty("totaCount", 0);
		
		queryBuilder.append("SELECT * FROM book ");
		queryBuilder.append("LEFT JOIN book_subcategory ON book.subcategory_id = book_subcategory.id ");
		queryBuilder.append("LEFT JOIN book_category ON book.category_id = book_category.id ");
		queryBuilder.append("WHERE book_subcategory.subcategory_name = ? ");

		if (filterDTO.getSubCategory() != null && !filterDTO.getSubCategory().isEmpty()) {
			queryBuilder.append("AND book_subcategory.subcategory_name = ? ");
		}
		if (filterDTO.getCategory() != null && !filterDTO.getCategory().isEmpty()) {
			queryBuilder.append("AND book_category.category_name = ? ");
		}
		if (filterDTO.getMinPrice() >= 0) {
			queryBuilder.append("AND book.book_price >= ? ");
		}
		if (filterDTO.getMaxPrice() > 0) {
			queryBuilder.append("AND book.book_price <= ? ");
		}
//	        if (filterDTO.getLastDay() > 0) {
//	            queryBuilder.append("AND book.registration_date >= DATE_SUB(CURDATE(), INTERVAL ? DAY) ");
//	        }
		if (filterDTO.getAuthor() != null && !filterDTO.getAuthor().isEmpty()) {
			queryBuilder.append("AND book.author LIKE ? ");
		}
		if (filterDTO.getPublisher() != null && !filterDTO.getPublisher().isEmpty()) {
			queryBuilder.append("AND book.publisher LIKE ? ");
		}
		if (filterDTO.getDescription() != null && !filterDTO.getDescription().isEmpty()) {
			queryBuilder.append("AND book.description LIKE ? ");
		}
		if (filterDTO.getLanguage() != null && !filterDTO.getLanguage().isEmpty()) {
			queryBuilder.append("AND book.language LIKE ? ");
		}

		// Pagination
		queryBuilder.append("ORDER BY book.id ");
		queryBuilder.append("LIMIT ? OFFSET ?");

		try {
			PreparedStatement preparedStatement = null;
			Connection connection = DbConnection.createConnection();
			preparedStatement = connection.prepareStatement(queryBuilder.toString());

			int parameterIndex = 1;
			preparedStatement.setString(parameterIndex++, filterDTO.getSubCategory());
			if (filterDTO.getSubCategory() != null && !filterDTO.getSubCategory().isEmpty()) {
				preparedStatement.setString(parameterIndex++, filterDTO.getSubCategory());
			}
			if (filterDTO.getCategory() != null && !filterDTO.getCategory().isEmpty()) {
				preparedStatement.setString(parameterIndex++, filterDTO.getCategory());
			}
			if (filterDTO.getMinPrice() >= 0) {
				preparedStatement.setDouble(parameterIndex++, filterDTO.getMinPrice());
			}
			if (filterDTO.getMaxPrice() > 0) {
				preparedStatement.setDouble(parameterIndex++, filterDTO.getMaxPrice());
			}
			/*
			 * if (filterDTO.getLastDays() > 0) { preparedStatement.setInt(parameterIndex++,
			 * filterDTO.getLastDays()); }
			 */
			if (filterDTO.getAuthor() != null && !filterDTO.getAuthor().isEmpty()) {
				preparedStatement.setString(parameterIndex++, "%" + filterDTO.getAuthor() + "%");
			}
			if (filterDTO.getPublisher() != null && !filterDTO.getPublisher().isEmpty()) {
				preparedStatement.setString(parameterIndex++, "%" + filterDTO.getPublisher() + "%");
			}
			if (filterDTO.getDescription() != null && !filterDTO.getDescription().isEmpty()) {
				preparedStatement.setString(parameterIndex++, "%" + filterDTO.getDescription() + "%");
			}
			if (filterDTO.getLanguage() != null && !filterDTO.getLanguage().isEmpty()) {
				preparedStatement.setString(parameterIndex++, "%" + filterDTO.getLanguage() + "%");
			}

			// Pagination parameters
			preparedStatement.setInt(parameterIndex++, pageSize);
			preparedStatement.setInt(parameterIndex++, (pageNumber - 1) * pageSize);

			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					totalCount++;
					BookDTO bookDTO2 = new BookDTO();
					bookDTO2.setId(resultSet.getInt("id"));
					bookDTO2.setTitle(resultSet.getString("title"));
					bookDTO2.setAuthor(resultSet.getString("author"));
					bookDTO2.setCategory(resultSet.getString("category_name"));
					bookDTO2.setSub_category(resultSet.getString("subcategory_name"));
					bookDTO2.setPublicationYear(resultSet.getInt("publication_year"));
					bookDTO2.setPublisher(resultSet.getString("publisher"));
					bookDTO2.setPrice(resultSet.getDouble("book_price"));
					bookDTO2.setLanguage(resultSet.getString("language"));
					bookDTO2.setDescription(resultSet.getString("description"));
					bookDTO2.setBookStatus(resultSet.getString("book_status"));
					bookDTO2.setImage(resultSet.getString("cover_pic"));
					bookDTO2.setCategory_id(resultSet.getInt("category_id"));
					bookDTO2.setSubCategory_id(resultSet.getInt("subcategory_id"));
					bookDTO2.setRegistrationDate(resultSet.getString("ragistration_date"));
					books.add(bookDTO2);
				}
			}
			jsonObject.add("books",  new Gson().toJsonTree(books));
			jsonObject.addProperty("totalcount", totalCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
//-------------------------------------------------FiteredCount-------------------------------------------------------------	
		
	@Override
	public List<BookDTO> getAllBooksCategorywise(BookDTO bookDTO) {
		List<BookDTO> bookList = new ArrayList<>();

		String SELECT_ALL_BOOK_SQL = "SELECT b.*,c.category_name,s.subcategory_name FROM book b LEFT JOIN book_category c ON b.category_id = c.id LEFT JOIN book_subcategory s ON b.subcategory_id = s.id WHERE b.is_deleted = 0 AND b.category_id=?";
		String SELECT_ONE_BOOK_SQL = "SELECT b.*, c.category_name, s.subcategory_name FROM book b LEFT JOIN book_category c ON b.category_id = c.id LEFT JOIN book_subcategory s ON b.subcategory_id = s.id WHERE b.id = ?";

		try {
			Connection connection = DbConnection.createConnection();
			 PreparedStatement preparedStatement = null;
			Statement statement = connection.createStatement();
			ResultSet resultSet = null;
			if (bookDTO.getId() != 0) {
				preparedStatement = connection.prepareStatement(SELECT_ONE_BOOK_SQL);
				preparedStatement.setInt(1, bookDTO.getId());
				resultSet = preparedStatement.executeQuery();
			} else {
				preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK_SQL);
				preparedStatement.setInt(1, bookDTO.getCategory_id());
				resultSet = preparedStatement.executeQuery();
			}
			while (resultSet.next()) {
				BookDTO bookDTO2 = new BookDTO();
				bookDTO2.setId(resultSet.getInt("id"));
				bookDTO2.setTitle(resultSet.getString("title"));
				bookDTO2.setAuthor(resultSet.getString("author"));
				bookDTO2.setCategory(resultSet.getString("category_name"));
				bookDTO2.setSub_category(resultSet.getString("subcategory_name"));
				bookDTO2.setPublicationYear(resultSet.getInt("publication_year"));
				bookDTO2.setPublisher(resultSet.getString("publisher"));
				bookDTO2.setPrice(resultSet.getDouble("book_price"));
				bookDTO2.setLanguage(resultSet.getString("language"));
				bookDTO2.setDescription(resultSet.getString("description"));
				bookDTO2.setBookStatus(resultSet.getString("book_status"));
				bookDTO2.setImage(resultSet.getString("cover_pic"));
				bookDTO2.setCategory_id(resultSet.getInt("category_id"));
				bookDTO2.setSubCategory_id(resultSet.getInt("subcategory_id"));
				bookList.add(bookDTO2);
			}
			statement.close();
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			resultSet.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookList;
	}

	
	
}
	
	



