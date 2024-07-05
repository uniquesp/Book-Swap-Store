package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import com.service.BookService;
import com.service.BookServiceInterface;
import com.model.BookDTO;
import com.model.BookSellDTO;
import com.model.FilterDTO;
import com.util.ImageConversion;
import com.util.OtherCheckboxInput;

@MultipartConfig
@WebServlet("/book")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String operation = request.getParameter("method");
		switch (operation) {
		case "add_book":
			AddOrUpdateBook(request, response);
			break;
		case "display_book":
			DisplayBookList(request, response);
			break;
		case "update_book":
			AddOrUpdateBook(request, response);
			break;
		case "delete_book":
			DeleteBook(request, response);
			break;
		case "get_book":
			GetBook(request, response);
			break;
		case "add_category":
			addOrUpdateCategory(request, response);
			break;
		case "get_category":
			GetCategory(request, response);
			break;
		case "update_category":
			addOrUpdateCategory(request, response);
			break;
		case "display_category":
			DisplayCategoryList(request, response);
			break;
		case "add_subcategory":
			addOrUpdateSubCategory(request, response);
			break;
		case "update_subcategory":
			addOrUpdateSubCategory(request, response);
			break;
		case "display_subcategory":
			DisplaySubCategoryList(request, response);
			break;
		case "get_subcategory":
			GetSubCategory(request, response);
			break;
		case "get_subcategory_fromcategory":
			GetSubCategoryFromCategoryId(request, response);
			break;
		case "sell_book":
			AddBookforSell(request, response);
			break;
		case "sell_request":
			DisplaySellRequest(request, response);
			break;
		case "sell_request_admin":
			DisplaySellRequestAdminside(request, response);
			break;
		case "update_sellrequest":
			ProcessRequest(request, response);
			break;
		case "display_counts":
			DisplayAllCounts(request, response);
			break;
		case "display_filtered_books":
			getFilteredBooks(request, response);
			break;
		case "display_books_categorywise":
			DisplayBookListCategoryWise(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + operation);
		}
	}

//------------------------------------------------------category-----------------------------------------------------------------------------------------------------------------------

	public void addOrUpdateCategory(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		try {
			PrintWriter writer = response.getWriter();
			bookDTO.setCategory(StringUtils.trimToEmpty(request.getParameter("category_name")));
			String action = request.getParameter("action");
			// inserting book
			if (action.equalsIgnoreCase("category_register")) {
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				BookServiceInterface bookServiceInterface = new BookService();
				writer.write(bookServiceInterface.AddCategory(bookDTO).toString());
				// updating book
			} else if (action.equalsIgnoreCase("category_update")) {
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				bookDTO.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
				bookDTO.setCategory(StringUtils.trimToEmpty(request.getParameter("category")));
				BookServiceInterface bookServiceInterface = new BookService();
				writer.write(bookServiceInterface.UpdateCategory(bookDTO).toString());
			} else {
				writer.write("<script>Something went wrong</script>");
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DisplayCategoryList(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			writer.write(bookServiceInterface.DisplayCategory(bookDTO).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void GetCategory(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		int id = Integer.parseInt(request.getParameter("id"));
		bookDTO.setCategory_id(id);
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			writer.write(bookServiceInterface.GetOneCategory(bookDTO).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//-----------------------------------------------subcategory--------------------------------------------------------------------------------------------------------------------------

	public void addOrUpdateSubCategory(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		try {
			PrintWriter writer = response.getWriter();
			String action = request.getParameter("action");
			// inserting book
			if (action.equalsIgnoreCase("subcategory_register")) {
				bookDTO.setSub_category(StringUtils.trimToEmpty(request.getParameter("subcategory_name")));
				bookDTO.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				BookServiceInterface bookServiceInterface = new BookService();
				writer.write(bookServiceInterface.AddSubCategory(bookDTO).toString());
				// updating book
			} else if (action.equalsIgnoreCase("subcategory_update")) {
				bookDTO.setSubCategory_id((Integer.parseInt(request.getParameter("subCategory_id"))));
				bookDTO.setSub_category(request.getParameter("sub_category"));
				bookDTO.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
				BookServiceInterface bookServiceInterface = new BookService();
				writer.write(bookServiceInterface.UpdatesubCategory(bookDTO).toString());
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
			} else {
				writer.write("<script>Something went wrong</script>");
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DisplaySubCategoryList(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			writer.write(bookServiceInterface.DisplaySubCategory(bookDTO).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void GetSubCategory(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		bookDTO.setSubCategory_id(Integer.parseInt(request.getParameter("id")));
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			writer.write(bookServiceInterface.GetOnesubCategory(bookDTO).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void GetSubCategoryFromCategoryId(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String categoryIdStr = request.getParameter("category_id");
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
				int CategoryId = Integer.parseInt(categoryIdStr);
				writer.write(bookServiceInterface.GetsubCategoryFromcategoryid(CategoryId).toString());
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//---------------------------------------------------------------------books---------------------------------------------------------------------------------------------------------

	public void AddOrUpdateBook(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		try {
			PrintWriter writer = response.getWriter();
			bookDTO.setTitle(StringUtils.trimToEmpty(request.getParameter("title")));
			bookDTO.setAuthor(StringUtils.trimToEmpty(request.getParameter("author")));
			bookDTO.setPublicationYear(Integer.parseInt(request.getParameter("publication_year")));
			bookDTO.setCategory_id(Integer.parseInt(request.getParameter("category")));
			bookDTO.setSubCategory_id(Integer.parseInt(request.getParameter("subcategory")));
			bookDTO.setPrice(Double.parseDouble(request.getParameter("price")));
			bookDTO.setPublisher(StringUtils.trimToEmpty(request.getParameter("publisher")));
			bookDTO.setDescription(StringUtils.trimToEmpty(request.getParameter("description")));
			bookDTO.setBookStatus(StringUtils.trimToEmpty(request.getParameter("status")));
			String language = new OtherCheckboxInput().processLanguages(request);
			bookDTO.setLanguage(language);
			ImageConversion conversion = new ImageConversion();
			String action = request.getParameter("action");
			// inserting book
			if (action.equalsIgnoreCase("book_register")) {

				String newImageName = conversion.generateAndStoreImage(request.getPart("coverpic"));
				bookDTO.setImage(newImageName);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				BookServiceInterface bookServiceInterface = new BookService();
				writer.write(bookServiceInterface.AddBook(bookDTO).toString());
				// updating book
			} else if (action.equalsIgnoreCase("book_update")) {
				if (request.getPart("profile_pic") != null) {
					String newImageName = conversion.generateAndStoreImage(request.getPart("profile_pic"));
					bookDTO.setImage(newImageName);}
			/*
			 * if(request.getParameter("profile_pic")!=null) {
			 * bookDTO.setImage(StringUtils.trimToEmpty(request.getParameter("profile_pic"))
			 * ); }
			 */
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				int id = Integer.parseInt(request.getParameter("id"));
				bookDTO.setId(id);
				BookServiceInterface bookServiceInterface = new BookService();
				writer.write(bookServiceInterface.UpdateBook(bookDTO).toString());
			} else {
				writer.write("<script>Something went wrong</script>");
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DisplayBookList(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			writer.write(bookServiceInterface.DisplayBook(bookDTO).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void GetBook(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		int id = Integer.parseInt(request.getParameter("id"));
		bookDTO.setId(id);
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			writer.write(bookServiceInterface.GetOneBook(bookDTO).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DeleteBook(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id")); // from ajax request
		BookServiceInterface bookServiceInterface = new BookService();
		try {
			PrintWriter writer = response.getWriter();
			writer.write(bookServiceInterface.DeleteBook(id).toString());
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	}
//------------------------------------------------------------------sell Request--------------------------------------------------------------------------------------------------------------------------

	public void AddBookforSell(HttpServletRequest request, HttpServletResponse response) {
		BookSellDTO bookSellDTO = new BookSellDTO();
		try {
			PrintWriter writer = response.getWriter();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = session.getAttribute("userId") != null
						? NumberUtils.toInt(Objects.toString(session.getAttribute("userId")))
						: 0;
				if (userId > 0) {
					bookSellDTO.setUser_id(userId);
					bookSellDTO.setBook_name(StringUtils.trimToEmpty(request.getParameter("book_title")));
					bookSellDTO.setBook_author(StringUtils.trimToEmpty(request.getParameter("book_author")));
					bookSellDTO.setBook_language(StringUtils.trimToEmpty(request.getParameter("language")));
					bookSellDTO.setPublication_Year(StringUtils.trimToEmpty(request.getParameter("publication_year")));
					bookSellDTO.setOrignal_price(Double.parseDouble(request.getParameter("original_price")));
					bookSellDTO.setSelling_price(Double.parseDouble(request.getParameter("money_amount")));
					bookSellDTO.setRequest(StringUtils.trimToEmpty(request.getParameter("return_type")));
					ImageConversion conversion = new ImageConversion();
					String newImageName = conversion.generateAndStoreImage(request.getPart("book_image"));
					bookSellDTO.setBook_image(newImageName);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					BookServiceInterface bookServiceInterface = new BookService();
					writer.write(bookServiceInterface.AddBookforSell(bookSellDTO).toString());
				}
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DisplaySellRequest(HttpServletRequest request, HttpServletResponse response) {
		BookSellDTO bookSellDTO = new BookSellDTO();
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			HttpSession session = request.getSession();
			if (session != null) {
				int userId = session.getAttribute("userId") != null
						? NumberUtils.toInt(Objects.toString(session.getAttribute("userId")))
						: 0;
				if (userId > 0) {
					bookSellDTO.setUser_id(userId);
					writer.write(bookServiceInterface.DisplayAllSellRequests(bookSellDTO).toString());
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
				}
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void DisplaySellRequestAdminside(HttpServletRequest request, HttpServletResponse response) {
		BookSellDTO bookSellDTO = new BookSellDTO();
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			writer.write(bookServiceInterface.DisplayAllSellRequests(bookSellDTO).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void ProcessRequest(HttpServletRequest request, HttpServletResponse response) {
		BookServiceInterface bookServiceInterface = new BookService();
		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			int requestid = Integer.parseInt(request.getParameter("requestid"));
			boolean flag = Boolean.parseBoolean(request.getParameter("requetflag"));
			writer.write(bookServiceInterface.processSellRequest(requestid, flag).toString());
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
// -------------------------------------------------------------------counts----------------------------------------------------------------------------------------------------------------------

	public void DisplayAllCounts(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			if (session != null) {
				int adminId = session.getAttribute("admin_id") != null
						? NumberUtils.toInt(Objects.toString(session.getAttribute("admin_id")))
						: 0;
				if (adminId > 0) {
					writer.write(bookServiceInterface.DisplayAllCounts(adminId).toString());
				}
			}
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//----------------------------------------------------------------------------------------------------------------------------------

	public void getFilteredBooks(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		BookServiceInterface bookService = new BookService();
		try {
			PrintWriter writer = response.getWriter();
			int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			int pageSize = Integer.parseInt(request.getParameter("pageSize"));

			FilterDTO filterDTO = new FilterDTO();
			filterDTO.setCategory(StringUtils.trimToEmpty(request.getParameter("category")));
			filterDTO.setSubCategory(StringUtils.trimToEmpty(request.getParameter("subCategory")));
			filterDTO.setBook(StringUtils.trimToEmpty(request.getParameter("book")));
			filterDTO.setAuthor(StringUtils.trimToEmpty(request.getParameter("author")));
			filterDTO.setDescription(StringUtils.trimToEmpty(request.getParameter("description")));
			filterDTO.setLanguage(StringUtils.trimToEmpty(request.getParameter("language")));
			filterDTO.setPublisher(StringUtils.trimToEmpty(request.getParameter("publisher")));
			filterDTO.setLastDay(StringUtils.trimToEmpty(request.getParameter("book")));
			if(request.getParameter("minPrice")!=null && request.getParameter("maxPrice")!=null ) {
				filterDTO.setMaxPrice(Integer.parseInt(request.getParameter("minPrice"),100));
				filterDTO.setMinPrice(Integer.parseInt(request.getParameter("maxPrice"),100000));
			}
			filterDTO.setMaxPrice(50);
			filterDTO.setMinPrice(100000);
			writer.write(bookService.getFilteredBooks(filterDTO, pageNumber, pageSize).toString());
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//---------------------------------------------------------------------------------------------------------------------------
	
	public void DisplayBookListCategoryWise(HttpServletRequest request, HttpServletResponse response) {
		BookDTO bookDTO = new BookDTO();
		try {
			PrintWriter writer = response.getWriter();
			BookServiceInterface bookServiceInterface = new BookService();
			int category_id = Integer.parseInt(request.getParameter("categoryid"));
			bookDTO.setCategory_id(category_id);
			writer.write(bookServiceInterface.DisplayBookCategorywise(bookDTO).toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
