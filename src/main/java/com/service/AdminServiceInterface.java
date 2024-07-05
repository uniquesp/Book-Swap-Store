package com.service;

import com.google.gson.JsonObject;
import com.model.AdminDTO;
import com.model.DataTableDTO;

public interface AdminServiceInterface {
	public JsonObject addAdmin(AdminDTO adminDTO);

	public JsonObject updateAdmin(AdminDTO adminDTO);

	public JsonObject loginAdmin(AdminDTO adminDTO);

	public JsonObject getAdminDetails(AdminDTO adminDTO);
	
	public JsonObject getAllOrderedItemsAdmin(DataTableDTO dataTableDTO) ;
}
