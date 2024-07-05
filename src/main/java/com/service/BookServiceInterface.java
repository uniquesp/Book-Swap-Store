package com.service;

import com.google.gson.JsonObject;
import com.model.BookDTO;
import com.model.BookSellDTO;
import com.model.FilterDTO;

public interface BookServiceInterface {
	public JsonObject AddCategory(BookDTO bookDTO);

	public JsonObject UpdateCategory(BookDTO bookDTO);

	public JsonObject DisplayCategory(BookDTO bookDTO);

	public JsonObject GetOneCategory(BookDTO bookDTO);

	public JsonObject AddSubCategory(BookDTO bookDTO);

	public JsonObject DisplaySubCategory(BookDTO bookDTO);

	public JsonObject GetOnesubCategory(BookDTO bookDTO);

	public JsonObject UpdatesubCategory(BookDTO bookDTO);

	public JsonObject AddBook(BookDTO bookDTO);

	public JsonObject DisplayBook(BookDTO bookDTO);

	public JsonObject UpdateBook(BookDTO bookDTO);

	public JsonObject DeleteBook(int bookId);

	public JsonObject GetOneBook(BookDTO bookDTO);

	public JsonObject AddBookforSell(BookSellDTO bookSellDTO);

	public JsonObject DisplayAllSellRequests(BookSellDTO bookSellDTO);
	
	public JsonObject processSellRequest(int requestId,boolean flag);
	
	public JsonObject DisplayAllCounts(int adminId);
	
	public JsonObject GetsubCategoryFromcategoryid(int categoryId) ;
	
	 public JsonObject getFilteredBooks(FilterDTO filterDTO, int pageNumber, int pageSize);
	 
	 public JsonObject DisplayBookCategorywise(BookDTO bookDTO);
}
