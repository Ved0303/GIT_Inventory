package com.kheti.Inventory.util;

public class Constants {
	public static final int ADMIN_ROLE=1;
	public static final int EDIT_ROLE=2;
	public static final int USER_ROLE=3;
	public static boolean isUnitType(String unitType) {
		
		if(unitType!=null && 
				(unitType.equalsIgnoreCase("bora") ||  
				unitType.equalsIgnoreCase("bag") ||
				unitType.equalsIgnoreCase("ton") || 
				unitType.equalsIgnoreCase("box") )){
			return true;
		}

		return false;
	}
	

}
