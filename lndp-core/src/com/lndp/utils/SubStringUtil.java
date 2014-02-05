package com.lndp.utils;

import java.io.IOException;

import com.lndp.constant.CommonConst;

public class SubStringUtil {

	/**
	 * Split the strng for a corresponding length
	 * @param str: String The target string
	 * @param len: int The target length
	 * @param elide: String The elide
	 * @return: String
	 * @throws IOException 
	 */
	public static String splitString(String str, int len, String elide) throws IOException {
		if (str == null) {
			return "";
		}
		byte[] strByte = str.getBytes(getDefaultEncoding());
		int strLen = strByte.length;
		// int elideLen = (elide.trim().length() == 0) ? 0 :
		// elide.getBytes().length;
		if (len >= strLen || len < 1) {
			return str;
		}
		/*
		 * if (len - elideLen > 0) { len = len - elideLen; }
		 */
		int count = 0;
		for (int i = 0; i < len; i++) {
			int value = (int) strByte[i];
			if (value < 0) {
				count++;
			}
		}
		if (count % 2 != 0) {
			len = (len == 1) ? len + 1 : len - 1;
		}
		return new String(strByte, 0, len) + elide.trim();
	}
	
	
	

	/**
	 * The main function for testing
	 * @param args: String[] args
	 */
	public static void main(String[] args) {
		String s = "北京时间5月13日早间消息，据国外媒体报道，SAP周三宣布将以58亿美元现";
		
		try {
			System.out.println(splitString(s, 20, "..."));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static String getDefaultEncoding() throws IOException {
		PropertiesUtil propertiesUtil = new PropertiesUtil(CommonConst.LNDP_PROPERTIES);
		return propertiesUtil.getString("default.encoding");
	}

}
