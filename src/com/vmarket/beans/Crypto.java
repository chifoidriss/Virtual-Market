package com.vmarket.beans;

public abstract class Crypto {
	
	private static String table = "azertyuiopqsdfghjklmwxcvbnNBVCXWMLKJHGFDSQPOIUYTREZA0123456789"+
								  "@#$&~_-+/*.?!%: ";
	private static String[] tab = table.split("");
	private static int z = tab.length;
	
	// À Â Æ Ç È É Ê Î Ô Ø Œ Ù Ú Û
	// à â æ ç è é ê î ô ø œ ù ú û
	
	private static String getVal(int val) {
		if(val<0  || val>=z) {
			return "";
		}
		return tab[val];
	}
	
	private static int getPos(String val) {
		for(int i=0; i<z; i++) {
			if(tab[i].equals(val)) {
				return i;
			}
		}
		return -1;
	}
	
	public static String encode(String val) {
		String[] t = val.split("");
		String ret = "";
		for(int i=0; i<t.length; i++) {
			if(getPos(t[i]) == -1) {
				return "";
			}
			// int y = (25*getPos(t[i]) + 19)%z;  //Avec uniquement les lettres et les chiffres
			int y = (47*getPos(t[i]) + 13)%z;
			ret += getVal(y);
		}
		return ret;
	}
	
	public static String decode(String val) {
		if(val == null) {
			return "";
		}
		String[] t = val.split("");
		String ret = "";
		for(int i=0; i<t.length; i++) {
			if(getPos(t[i]) == -1) {
				return "ERROR";
			}
			// int x = (5*getPos(t[i]) + 29)%z; //Avec uniquement les lettres et les chiffres
			int x = (5*getPos(t[i]) + 13)%z;
			ret += getVal(x);
		}
		return ret;
	}

	public static void main(String[] args) {
		
		System.out.println(Crypto.z);
		System.out.println(Crypto.encode("Idriss CHIFO"));
		System.out.println(Crypto.decode("@@"));
		System.out.println(Crypto.decode(Crypto.encode("Idriss CHIFO")));
	}
}
