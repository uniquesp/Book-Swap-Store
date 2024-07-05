package com.service;

import java.util.*;
import com.dao.BookDao;
import com.dao.BookDaoImplementation;
import com.google.gson.JsonObject;
import com.model.BookDTO;
import com.model.BookSellDTO;
import com.model.FilterDTO;
import com.google.gson.Gson;

public class BookService implements BookServiceInterface {

//----------------------------------------category------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public JsonObject AddCategory(BookDTO bookDTO) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean isCategoryAdded = bookDao.addOrUpdateCategory(bookDTO);
		if (isCategoryAdded) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "category added successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to add category");
		}
		return jsonObject;
	}

	@Override
	public JsonObject DisplayCategory(BookDTO bookDTO) {
		List<BookDTO> categorylistObject = new BookDaoImplementation().getAllCategories(bookDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (categorylistObject != null && !categorylistObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("category", gson.toJsonTree(categorylistObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No category found");
		}
		return jsonObject;
	}

	@Override
	public JsonObject GetOneCategory(BookDTO bookDTO) {
		List<BookDTO> categoryObject = new BookDaoImplementation().getAllCategories(bookDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (categoryObject != null && !categoryObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("category", gson.toJsonTree(categoryObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No category found");
		}
		return jsonObject;
	}
	
	@Override
	public JsonObject UpdateCategory(BookDTO bookDTO) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean iscategoryUpdated = bookDao.addOrUpdateCategory(bookDTO);
		if (iscategoryUpdated) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "Category Updated successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to Update category");
		}
		return jsonObject;
	}

//------------------------------------------------------subcategory-------------------------------------------------------------------------------------------------------------------
	@Override
	public JsonObject AddSubCategory(BookDTO bookDTO) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean isSubCategoryAdded = bookDao.addOrUpdateSubCategory(bookDTO);
		if (isSubCategoryAdded) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "sub-category added successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to add sub-category");
		}
		return jsonObject;
	}

	@Override
	public JsonObject DisplaySubCategory(BookDTO bookDTO) {
		List<BookDTO> subcategoryobject = new BookDaoImplementation().getAllSubCategories(bookDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (subcategoryobject != null && !subcategoryobject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("subcategory", gson.toJsonTree(subcategoryobject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No subcategory found");
		}
		return jsonObject;
	}
	
	@Override
	public JsonObject GetOnesubCategory(BookDTO bookDTO) {
		List<BookDTO> subcategoryObject = new BookDaoImplementation().getAllSubCategories(bookDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (subcategoryObject != null && !subcategoryObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("subcategory", gson.toJsonTree(subcategoryObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No subcategory found");
		}
		return jsonObject;
	}
	
	@Override
	public JsonObject UpdatesubCategory(BookDTO bookDTO) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean issubcategoryUpdated = bookDao.addOrUpdateSubCategory(bookDTO);
		if (issubcategoryUpdated) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "SubCategory Updated successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to Update SubCategory");
		}
		return jsonObject;
	}
	
	
	
	@Override
	public JsonObject GetsubCategoryFromcategoryid(int categoryId) {
		List<BookDTO> subcategoryObject = new BookDaoImplementation().getSubcategoryFromCategoryId(categoryId);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (subcategoryObject != null && !subcategoryObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("subcategory", gson.toJsonTree(subcategoryObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No subcategory found");
		}
		return jsonObject;
	}
	
//-------------------------------------------------book-----------------------------------------------------------------------------------------------------------------------------------
	@Override
	public JsonObject AddBook(BookDTO bookDTO) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean isBookRegistered = bookDao.registerOrUpdateBook(bookDTO);
		if (isBookRegistered) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "Book added successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to add book");
		}
		return jsonObject;
	}

	@Override
	public JsonObject DisplayBook(BookDTO bookDTO) {
		List<BookDTO> booklistObject = new BookDaoImplementation().getAllBooks(bookDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (booklistObject != null && !booklistObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("books", gson.toJsonTree(booklistObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No books found");
		}
		return jsonObject;
	}

	@Override
	public JsonObject GetOneBook(BookDTO bookDTO) {
		List<BookDTO> booklistObject = new BookDaoImplementation().getAllBooks(bookDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (booklistObject != null && !booklistObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("books", gson.toJsonTree(booklistObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No books found");
		}
		return jsonObject;
	}

	@Override
	public JsonObject DeleteBook(int bookId) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean isBookDeleted = bookDao.deleteBook(bookId);
		if (isBookDeleted) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "Book deleted successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to delete book");
		}
		return jsonObject;
	}

	public JsonObject UpdateBook(BookDTO bookDTO) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean isBookUpdated = bookDao.registerOrUpdateBook(bookDTO);
		if (isBookUpdated) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "Book Updated successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to Update book");
		}
		return jsonObject;
	}
//----------------------------------------------booksell---------------------------------------------------------------------------------------------------------------------------------------	
	@Override
	public JsonObject AddBookforSell(BookSellDTO bookSellDTO) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean isBookRegistered = bookDao.addBookSellRequest(bookSellDTO);
		if (isBookRegistered) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "Book Request Sent successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to send book request");
		}
		return jsonObject;
	}
	
	@Override
	public JsonObject DisplayAllSellRequests(BookSellDTO bookSellDTO) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		List<BookSellDTO> booklistObject = bookDao.getAllBookSellRequests(bookSellDTO);
		Gson gson = new Gson();
		if (booklistObject != null && !booklistObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("sellRequests", gson.toJsonTree(booklistObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No book Request found");
		}
		return jsonObject;
	}
	
	
	@Override
	public JsonObject processSellRequest(int requestId,boolean flag){
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		boolean isItemUpdeted = bookDao.processSellRequest(requestId,flag);
		if (isItemUpdeted) {
			jsonObject.addProperty("success", true);
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to update");
		}
		return jsonObject;
	}
//--------------------------------------------------------------counts-------------------------------------------------------------------------------------------------------------------------
	
	@SuppressWarnings("unused")
	@Override
	public JsonObject DisplayAllCounts(int adminId) {
		JsonObject jsonObject = new JsonObject();
		BookDao bookDao = new BookDaoImplementation();
		if (jsonObject != null) {
			jsonObject.addProperty("success", true);
			jsonObject.add("counts", bookDao.displayCounts(adminId));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to fetch Counts");
		}
		return jsonObject;
	}
//--------------------------------------------------FilterDTO-------------------------------------------------------------------------
	
	@SuppressWarnings("unused")
	@Override
	 public JsonObject getFilteredBooks(FilterDTO filterDTO, int pageNumber, int pageSize) {
	        JsonObject jsonObject = new JsonObject();
	        Gson gson = new Gson();
	        BookDao bookDao = new BookDaoImplementation();
	        try {
	        	jsonObject = bookDao.getFilteredBooks(filterDTO, pageNumber, pageSize);
	        	int filteredCount = jsonObject.get("totalCount").getAsInt();
	    	    int totalCount = jsonObject.size(); 
	    	    
	        	if(jsonObject!=null) {
	        		if (jsonObject.has("books") && jsonObject.has("totalCount")) {
		                jsonObject.addProperty("success", true);
		                jsonObject.add("books", gson.toJsonTree(jsonObject.get("books").getAsJsonObject()));
		                jsonObject.addProperty("recordsTotal", totalCount);
		                jsonObject.addProperty("recordsFiltered", filteredCount);
		            }
	        	}else {
	                jsonObject.addProperty("success", false);
	                jsonObject.addProperty("message", "No books found");
	            }
	        } catch (Exception e) {
	            jsonObject.addProperty("success", false);
	            jsonObject.addProperty("message", "Error retrieving books: " + e.getMessage());
	        }
	        return jsonObject;
	    }
	
//--------------------------------------------------------------------------------------------------------------------------
	
	@Override
	public JsonObject DisplayBookCategorywise(BookDTO bookDTO) {
		List<BookDTO> booklistObject = new BookDaoImplementation().getAllBooksCategorywise(bookDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (booklistObject != null && !booklistObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("books", gson.toJsonTree(booklistObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No books found");
		}
		return jsonObject;
	}
}
