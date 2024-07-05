package com.model;

public class DataTableDTO {
	int start;
	int length;
	String searchValue;
	String orderByColumn;
	String orderByDirection;

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getOrderByColumn() {
		return orderByColumn;
	}

	public void setOrderByColumn(String orderByColumn) {
		this.orderByColumn = orderByColumn;
	}

	public String getOrderByDirection() {
		return orderByDirection;
	}

	public void setOrderByDirection(String orderByDirection) {
		this.orderByDirection = orderByDirection;
	}

}
