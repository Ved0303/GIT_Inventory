package com.kheti.Inventory.util;

import java.util.ArrayList;
import java.util.List;

public class Units {

	public static List<String> unitTypes=new ArrayList<String>();
	public static List<String> complexUnitTypes=new ArrayList<String>();
	
	static {
		unitTypes.add("Gm");
		unitTypes.add("Kg");
		unitTypes.add("Ml");
		unitTypes.add("Ltr");
		unitTypes.add("Piece");
		
		complexUnitTypes.add("Bora");
		complexUnitTypes.add("Bag");
		complexUnitTypes.add("Tones");
		
	}
	
	public static boolean isComplexUnitType(String unitType) {
		
		return unitType!=null && complexUnitTypes.contains(unitType);
	}
	
	

}
