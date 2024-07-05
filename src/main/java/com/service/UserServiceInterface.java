package com.service;

import com.google.gson.JsonObject;
import com.model.CartDTO;
import com.model.UserDTO;

public interface UserServiceInterface {
	public JsonObject userRegister(UserDTO userDTO);

	public JsonObject userProfileUpdate(UserDTO userDTO);

	public JsonObject userProfileDelete(int userId);

	public JsonObject userLogin(UserDTO userDTO);

	public JsonObject getAllUser(UserDTO userDTO);

	public JsonObject AddToCart(CartDTO cartDTO);
		
	public JsonObject getAllCartItems(CartDTO cartDTO);
	
	public JsonObject CalculateCartCount(CartDTO cartDTO);
	
	public JsonObject UpdateCartQuantity(int userId, int cartId, int newquantity);
	
	public JsonObject cartItemDelete(int cartId, int userId);
	
	public JsonObject AddToWishlist(CartDTO cartDTO);
	
	public JsonObject getAllwishistItems(int userId) ;
	
	public JsonObject AfterCheckoutOprations(int userId, boolean tokenflag);
	
	public JsonObject AmountCalculation(int userId, boolean istokenused);
	
	public JsonObject getAllOrderedItems(CartDTO cartDTO);
	
	public JsonObject getOrderedItemsWithPagination(CartDTO cartDTO, int pageNumber, int pageSize);
	
	
}
