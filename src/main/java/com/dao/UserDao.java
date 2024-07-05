package com.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.JsonObject;
import com.model.CartDTO;
import com.model.UserDTO;

public interface UserDao {
	public boolean registerUser(UserDTO userDto);

	public JsonObject loginUser(UserDTO userDto);

	public boolean updateUser(UserDTO userDto);

	public boolean deleteUser(int userId);

	public List<UserDTO> getAllUsers(UserDTO userDto);

	public JsonObject addToCart(CartDTO cartDTO);
	
	public List<CartDTO> getAllCartItems(CartDTO cartDTO);
	
	public boolean deletecartItems(int cartId,int userId);
	
	public boolean updateCartItems(int cartId,int userId, int bookId);
	
	public JsonObject CalculateCartCount(CartDTO cartDTO);
	
	public JsonObject addToWishlist(CartDTO cartDTO);
	
	public List<CartDTO> getAllWishlistItems(int userId) ;
	
	public JsonObject AmountCalculation(int userId, boolean istokenused);
	
	public boolean AfterCheckoutOperations(int userId,boolean tokenflag);
	
	public List<CartDTO> getAllOrderedItems(CartDTO cartDTO);
	
	public Map<String, Object> getOrderedItemsWithPagination(CartDTO cartDTO, int pageNumber, int pageSize);
	

}
