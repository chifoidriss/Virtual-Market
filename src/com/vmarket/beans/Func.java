package com.vmarket.beans;
public abstract class Func {
	
	public static final boolean validInt(int val) {
		if(val>0) {
			return true;
		}
		return false;
	}
	
	public static final boolean validFloat(float val) {
		if(val>0) {
			return true;
		}
		return false;
	}
	
	public static final boolean validString(String val) {
		if(val.length()>3 && val.length()<100) {
			return true;
		}
		return false;
	}

}