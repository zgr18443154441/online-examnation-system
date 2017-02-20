package com.shxt.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 公用方法类
 * @author 韩老师
 * @ClassName: Common
 * @Version 
 * @ModifiedBy
 * @Copyright
 * @date 2012-8-16 下午04:26:32
 * @description
 */
public class Common {
	
	/**
	 * 获得验证码，如果无session，则返回空
	 * 需判断返回值是否为null
	 * @author 韩老师
	 * @title: getIdentifyingCode
	 * @date 2012-11-14 下午04:16:52
	 * @param request
	 * @return String
	 */
	public static String getIdentifyingCode(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if (session == null) {
			return null;
		}
		Object obj = session.getAttribute("RANDOM");
		if ( obj != null) {
			return obj.toString().toLowerCase();
		}else{
			return null;
		}
	}
}
