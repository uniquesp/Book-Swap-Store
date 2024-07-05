package com.dao;

import java.util.List;

import org.json.JSONObject;

import com.google.gson.JsonObject;
import com.model.AdminDTO;
import com.model.DataTableDTO;

public interface AdminDao {
	
	public boolean registerOrUpdateAdmin(AdminDTO adminDTO);

	public JsonObject loginAdmin(AdminDTO adminDTO);

	public List<AdminDTO> getAllAdmins(AdminDTO adminDTO);
	
	public List<JSONObject> getAllOrderedItemsAdmin(DataTableDTO dataTableDTO);
	
	public int getCountOrderTable();
}
