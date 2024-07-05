package com.service;

import java.util.List;
import java.util.Map;

import com.dao.UserDao;
import com.dao.UserDaoImplementation;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.CartDTO;
import com.model.UserDTO;

public class UserService implements UserServiceInterface {

	@Override
	public JsonObject userRegister(UserDTO userDTO) {
		JsonObject responseJson = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		try {
			boolean userInserted = userDao.registerUser(userDTO);

			if (userInserted) {
				responseJson.addProperty("success", true);
				responseJson.addProperty("message", "User registered successfully");
			} else {
				responseJson.addProperty("success", false);
				responseJson.addProperty("message", "Failed to register user");
			}
		} catch (Exception e) {
			e.printStackTrace();
			responseJson.addProperty("success", false);
			responseJson.addProperty("message", "An error occurred during user process");
		}

		return responseJson;
	}

	@SuppressWarnings("null")
	@Override
	public JsonObject userLogin(UserDTO userDTO) {
		JsonObject responseJson = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		try {
			responseJson = userDao.loginUser(userDTO);
			if (responseJson != null) {
				int userId = responseJson.get("userId").getAsInt();
				if (userId > 0) {
					responseJson.addProperty("success", true);
					responseJson.addProperty("message", "Login successfully");
				} else {
					responseJson.addProperty("success", false);
					responseJson.addProperty("message", "Failed to Login");
				}
			} else {
				responseJson.addProperty("success", false);
				responseJson.addProperty("message", "Failed to Login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			responseJson.addProperty("success", false);
			responseJson.addProperty("message", "An error occurred during the process");
		}
		return responseJson;
	}

	@Override
	public JsonObject userProfileUpdate(UserDTO userDTO) {
		JsonObject responseJson = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		try {
			boolean userUpdated = userDao.updateUser(userDTO);

			if (userUpdated) {
				responseJson.addProperty("success", true);
				responseJson.addProperty("message", "User Updated successfully");
			} else {
				responseJson.addProperty("success", false);
				responseJson.addProperty("message", "Failed to Update user");
			}
		} catch (Exception e) {
			e.printStackTrace();
			responseJson.addProperty("success", false);
			responseJson.addProperty("message", "An error occurred during user process");
		}
		return responseJson;
	}

	@Override
	public JsonObject userProfileDelete(int userId) {
		JsonObject jsonObject = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		boolean isUserDeleted = userDao.deleteUser(userId);
		if (isUserDeleted) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "User deleted successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to delete book");
		}
		return jsonObject;
	}

	@Override
	public JsonObject getAllUser(UserDTO userDTO) {
		List<UserDTO> usertObject = new UserDaoImplementation().getAllUsers(userDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (usertObject != null && !usertObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("users", gson.toJsonTree(usertObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No user found");
		}
		return jsonObject;
	}

	@Override
	public JsonObject AddToCart(CartDTO cartDTO) {
		JsonObject responseJson = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		try {
			responseJson = userDao.addToCart(cartDTO);
			if (responseJson != null && responseJson.get("flag").getAsBoolean()) {
				responseJson.addProperty("success", true);
				responseJson.addProperty("message", "Added to cart");
			} else {
				responseJson.addProperty("success", false);
				responseJson.addProperty("message", "Failed to add item in cart");
			}
		} catch (Exception e) {
			e.printStackTrace();
			responseJson.addProperty("success", false);
			responseJson.addProperty("message", "An error occurred during process");
		}
		return responseJson;
	}

	@Override
	public JsonObject getAllCartItems(CartDTO cartDTO) {
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		UserDao userDao = new UserDaoImplementation();
		List<CartDTO> cartObject = userDao.getAllCartItems(cartDTO);
		if (cartObject != null && !cartObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("cartitems", gson.toJsonTree(cartObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No item found");
		}
		return jsonObject;
	}

	@Override
	public JsonObject cartItemDelete(int cartId, int userId) {
		JsonObject jsonObject = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		boolean isItemDeleted = userDao.deletecartItems(cartId, userId);
		if (isItemDeleted) {
			jsonObject.addProperty("success", true);
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to remove item from cart");
		}
		return jsonObject;
	}

	@Override
	public JsonObject UpdateCartQuantity(int userId, int cartId, int newquantity) {
		JsonObject jsonObject = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		boolean isItemUpdeted = userDao.updateCartItems(cartId, userId, newquantity);
		if (isItemUpdeted) {
			jsonObject.addProperty("success", true);
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to update quantity");
		}
		return jsonObject;
	}

	@SuppressWarnings("null")
	@Override
	public JsonObject CalculateCartCount(CartDTO cartDTO) {
		JsonObject responseJson = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		try {
			responseJson = userDao.CalculateCartCount(cartDTO);
			if (responseJson != null) {
				responseJson.addProperty("success", true);
			} else {
				responseJson.addProperty("success", false);
				responseJson.addProperty("message", "Failed to display  count of item in cart");
			}
		} catch (Exception e) {
			e.printStackTrace();
			responseJson.addProperty("success", false);
			responseJson.addProperty("message", "An error occurred during process");
		}
		return responseJson;
	}

	@Override
	public JsonObject AddToWishlist(CartDTO cartDTO) {
		JsonObject responseJson = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		try {
			responseJson = userDao.addToWishlist(cartDTO);
			boolean itemInserted = responseJson.get("itemInserted").getAsBoolean();
			boolean itemDeleted = responseJson.get("itemDeleted").getAsBoolean();

			if (itemInserted) {
				responseJson.addProperty("success", true);
				responseJson.addProperty("message", "Added to wishlist");
			} else if (itemDeleted) {
				responseJson.addProperty("success", true);
				responseJson.addProperty("message", "Item deleted from wishlist");
			} else {
				responseJson.addProperty("success", false);
				responseJson.addProperty("message", "Failed to add or delete item from wishlist");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseJson;
	}

	@Override
	public JsonObject getAllwishistItems(int userId) {
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		UserDao userDao = new UserDaoImplementation();
		List<CartDTO> wishlistObject = userDao.getAllWishlistItems(userId);
		if (wishlistObject != null && !wishlistObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("wishlist", gson.toJsonTree(wishlistObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No item found");
		}
		return jsonObject;
	}

	
	@SuppressWarnings("null")
	@Override
	public JsonObject AmountCalculation(int userId, boolean istokenused) {
		JsonObject jsonObject = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		jsonObject = userDao.AmountCalculation(userId, istokenused);
		if(jsonObject!=null) {
			jsonObject.addProperty("success", true);
		}else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to fetch amount");
		}
		return jsonObject;
	}
	
	@Override
	public JsonObject AfterCheckoutOprations(int userId, boolean tokenflag) {
		JsonObject jsonObject = new JsonObject();
		UserDao userDao = new UserDaoImplementation();
		boolean isItemUpdeted = userDao.AfterCheckoutOperations(userId, tokenflag);
		if (isItemUpdeted) {
			jsonObject.addProperty("success", true);
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to update");
		}
		return jsonObject;
	}

	@Override
	public JsonObject getAllOrderedItems(CartDTO cartDTO) {
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		UserDao userDao = new UserDaoImplementation();
		List<CartDTO> orderObject = userDao.getAllOrderedItems(cartDTO);
		if (orderObject != null && !orderObject.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("cartitems", gson.toJsonTree(orderObject));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No Orders found");
		}
		return jsonObject;
	}
	
	@Override
	public JsonObject getOrderedItemsWithPagination(CartDTO cartDTO, int pageNumber, int pageSize) {
	    JsonObject jsonObject = new JsonObject();
	    Gson gson = new Gson();
	    UserDao userDao = new UserDaoImplementation();
	    Map<String, Object> result = userDao.getOrderedItemsWithPagination(cartDTO, pageNumber, pageSize);
	    @SuppressWarnings("unchecked")
		List<CartDTO> orderObject = (List<CartDTO>) result.get("cartitems");
	    int totalCount = (int) result.get("total_count");

	    if (!orderObject.isEmpty()) {
	        jsonObject.addProperty("success", true);
	        jsonObject.add("cartitems", gson.toJsonTree(orderObject));
	        jsonObject.addProperty("total_count", totalCount);
	    } else {
	        jsonObject.addProperty("success", false);
	        jsonObject.addProperty("message", "No Orders found");
	    }
	    return jsonObject;
	}


}
