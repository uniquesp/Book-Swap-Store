package com.model;

public class BookSellDTO {
	private int sellrequestid;
	private int user_id;
	private String book_name;
	private String book_author;
	private String publication_Year;
	private String book_language;
	private double orignal_price;
	private double selling_price;
	private String book_image;
	private String user_name;
	private String user_email;
	private String requestfor;
	private String status;
	
	
	public String getRequest() {
		return requestfor;
	}
	public void setRequest(String request) {
		this.requestfor = request;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getPublication_Year() {
		return publication_Year;
	}
	public void setPublication_Year(String publication_Year) {
		this.publication_Year = publication_Year;
	}
	public String getBook_language() {
		return book_language;
	}
	public void setBook_language(String book_language) {
		this.book_language = book_language;
	}
	public double getOrignal_price() {
		return orignal_price;
	}
	public void setOrignal_price(double orignal_price) {
		this.orignal_price = orignal_price;
	}
	public double getSelling_price() {
		return selling_price;
	}
	public void setSelling_price(double selling_price) {
		this.selling_price = selling_price;
	}
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	public int getSellrequestid() {
		return sellrequestid;
	}
	public void setSellrequestid(int sellrequestid) {
		this.sellrequestid = sellrequestid;
	}
	
	
	
}
