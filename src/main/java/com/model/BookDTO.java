package com.model;

public class BookDTO {
	
	private int id;
	private String title;
	private String author;
	private String publisher;
	private int publicationYear;
	private String description;
	private double price;
	private String image;
	private String bookStatus;
	private String language;
	private int category_id;
	private String category;
	private int subCategory_id;
	private String sub_category;
	private String registrationDate;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPublicationYear() {
		return publicationYear;
	}
	public void setPublicationYear(int publicationYear) {
		this.publicationYear = publicationYear;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBookStatus() {
		return bookStatus;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public int getSubCategory_id() {
		return subCategory_id;
	}
	public void setSubCategory_id(int subCategory_id) {
		this.subCategory_id = subCategory_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	@Override
	public String toString() {
		return "BookDTO [id=" + id + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", publicationYear=" + publicationYear + ", description=" + description + ", price=" + price
				+ ", image=" + image + ", bookStatus=" + bookStatus + ", language="
				+ language + ", category_id=" + category_id + ", category=" + category + ", subCategory_id="
				+ subCategory_id + ", sub_category=" + sub_category + "]";
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	
}