package com.dao;

import java.util.List;

import com.google.gson.JsonObject;
import com.model.BookDTO;
import com.model.BookSellDTO;
import com.model.FilterDTO;

public interface BookDao {

	public boolean addOrUpdateCategory(BookDTO bookDTO);

	public List<BookDTO> getAllCategories(BookDTO bookDTO);

	public boolean addOrUpdateSubCategory(BookDTO bookDTO);

	public boolean registerOrUpdateBook(BookDTO bookDTO);

	public List<BookDTO> getAllSubCategories(BookDTO bookDTO);

	public List<BookDTO> getSubcategoryFromCategoryId(int categoryId);

	public List<BookDTO> getAllBooks(BookDTO bookDTO);

	public boolean deleteBook(int bookid);

	public boolean addBookSellRequest(BookSellDTO bookSellDTO);

	public List<BookSellDTO> getAllBookSellRequests(BookSellDTO bookSellDTO);

	public JsonObject displayCounts(int adminId);

	public boolean processSellRequest(int requestId, boolean flag);

	public JsonObject getFilteredBooks(FilterDTO filterDTO, int pageNumber, int pageSize);
	
	public List<BookDTO> getAllBooksCategorywise(BookDTO bookDTO);
}
