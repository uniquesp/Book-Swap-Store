package com.service;


import java.util.List;

import org.json.JSONObject;

import com.dao.AdminDao;
import com.dao.AdminDaoImplementation;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.AdminDTO;
import com.model.DataTableDTO;


public class AdminService implements AdminServiceInterface {

	@Override
	public JsonObject addAdmin(AdminDTO adminDTO) {
		JsonObject jsonObject = new JsonObject();
		AdminDao adminDao = new AdminDaoImplementation();
		boolean isAdminRegistered = adminDao.registerOrUpdateAdmin(adminDTO);
		if (isAdminRegistered) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "Admin added successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to add Admin");
		}
		return jsonObject;
	}
	
	@Override
	public JsonObject updateAdmin(AdminDTO adminDTO) {
		JsonObject jsonObject = new JsonObject();
		AdminDao adminDao = new AdminDaoImplementation();
		boolean isAdminUpdated = adminDao.registerOrUpdateAdmin(adminDTO);
		if (isAdminUpdated) {
			jsonObject.addProperty("success", true);
			jsonObject.addProperty("message", "Admin updated successfully");
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "Failed to add Admin");
		}
		return jsonObject;
	}

	@Override
	public JsonObject loginAdmin(AdminDTO adminDTO) {
		AdminDao adminDao = new AdminDaoImplementation();
		JsonObject jsonObject = adminDao.loginAdmin(adminDTO);
		return jsonObject;
	}

	@Override
	public JsonObject getAdminDetails(AdminDTO adminDTO) {
		AdminDao adminDao = new AdminDaoImplementation();
		List<AdminDTO> list = adminDao.getAllAdmins(adminDTO);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		if (list != null && !list.isEmpty()) {
			jsonObject.addProperty("success", true);
			jsonObject.add("admin", gson.toJsonTree(list));
		} else {
			jsonObject.addProperty("success", false);
			jsonObject.addProperty("message", "No Admin with this Info found");
		}
		return jsonObject;
	}
	
	
	@Override
	public JsonObject getAllOrderedItemsAdmin(DataTableDTO dataTableDTO) {
	    JsonObject jsonObject = new JsonObject();
	    AdminDao adminDao = new AdminDaoImplementation();
	    Gson gson = new Gson();
	    List<JSONObject> orderObject = adminDao.getAllOrderedItemsAdmin(dataTableDTO);
	    int filteredCount = adminDao.getCountOrderTable();
	    int totalCount = orderObject.size(); // Number of records after filtering

	    if (orderObject != null && !orderObject.isEmpty()) {
	        jsonObject.addProperty("success", true);
	        jsonObject.add("orderitems", gson.toJsonTree(orderObject));
	        jsonObject.addProperty("recordsFiltered", filteredCount);
	        jsonObject.addProperty("recordsTotal",totalCount );
	    } else {
	        jsonObject.addProperty("success", false);
	        jsonObject.addProperty("message", "No Orders found");
	    }
	    return jsonObject;
	}

}
