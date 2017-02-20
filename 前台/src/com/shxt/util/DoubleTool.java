package com.shxt.util;

import java.math.BigDecimal;

/**
 * 浮点型数据操作工具类
 * @author 韩老师
 * @ClassName: DoubleTool
 * @Version 1.0
 * @ModifiedBy 
 * @Copyright 四海兴唐
 * @date 2012-12-19 下午03:52:09
 * @description
 */
public class DoubleTool {
	public static void main(String[] args) {
	}
	
	/** 
	 * 提供精确的加法运算
	 * @author 韩老师
	 * @title: add
	 * @date 2012-12-19 下午03:52:38
	 * @param v1 被加数
	 * @param v2 加数
	 * @return double 两个参数的和
	 */
	public static double add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.add(b2).doubleValue();
	}
	
	/**
	 * 提供精确的减法运算。
	 * @author 韩老师
	 * @title: subtract
	 * @date 2012-12-19 下午03:58:09
	 * @param v1 被减数
	 * @param v2 减数
	 * @return double 两个参数的差
	 */
	public static double subtract(double v1,double v2){ 
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2).doubleValue();
	}
	
	/**
	 * 提供精确的乘法运算。
	 * @author 韩老师
	 * @title: multiply 
	 * @date 2012-12-19 下午04:03:40
	 * @param v1 被乘数
	 * @param v2 乘数 
	 * @return double 两个参数的积
	 */
	public static double multiply(double v1,double v2){
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}
	
	/**
	 * 提供（相对）精确的除法运算。
	 * 当发生除不尽的情况时，由scale参数指定精度，以后的数字四舍五入。
	 * @author 韩老师
	 * @title: divide
	 * @date 2012-12-19 下午04:06:35
	 * @param v1 被除数
	 * @param v2 除数
	 * @param scale 表示表示需要精确到小数点以后几位。
	 * @return double 两个参数的商
	 */
	public static double divide(double v1,double v2,int scale){
		if(scale < 0){
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	
	
	/**
	 * 四舍五入
	 * @author 韩老师
	 * @title: round
	 * @date 2012-12-21 下午07:34:33
	 * @param v 需要处理的数值
	 * @param scale 保留小数的位数
	 * @return double
	 */
	public static double round(double v,int scale){
		if(scale < 0){
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b = new BigDecimal(Double.toString(v));
		return b.setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
}
