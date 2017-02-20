package com.shxt.util;

import java.awt.Font;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Random;

/**
 * 获取ttf文件的字体。程序中用该包中的字体可以保证字体不受系统限制和影响
 * 自定义字体库对象
 * @author 韩老师
 * @ClassName: FontHandle
 * @Version
 * @ModifiedBy
 * @Copyright
 * @date 2012-8-16 下午03:24:19
 * @description
 */
public class FontHandle {

	private FileInputStream fi;
	private BufferedInputStream fb;
	private Font nf;
	
	/**字体所在的路径*/
	private static String path ;
	/**字体集合*/
	private static Font[] fontTypes;
	/** 创建随机类的实例以供下面调用 */
	private static Random random = new Random();
	
	/**设置字体文件路径*/
	static {
		path = FontHandle.class.getResource("/").toString();
		//16为WebRoot下， 2为WEB-INF下
		path = path.substring(0, path.lastIndexOf("/", path.length() - 16) + 1);
		try {
			path = new URL(path).getPath();
			path = URLDecoder.decode(path, "UTF-8") + "vcode/fonts/";
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
	
	/**设置待随机的字体*/
	static {
		//创建自定义字体库对象（FontHandle为自定义读取字体文件的类） 
		FontHandle fh = new FontHandle();
		Font f1 = fh.getFont("1.ttf");
		Font f2 = fh.getFont("2.ttf");
		Font f3 = fh.getFont("3.ttf");
		Font f4 = fh.getFont("4.ttf");
		Font f5 = fh.getFont("5.ttf");
		fontTypes = new Font[]{f1,f2,f3,f4,f5}; 
	}
	
	/**
	 * 获取一个随机字体
	 * @author 韩老师
	 * @title: getRandomFont
	 * @date 2012-8-18 上午11:44:27
	 * @return Font
	 */
	public static Font getRandomFont() {
		return fontTypes[random.nextInt(fontTypes.length)];
	}
	
	/**
	 * 根据字体文件名称，获得一个字体对象
	 * @author 韩老师
	 * @title: getFont
	 * @date 2012-8-18 上午11:47:16
	 * @param fileName
	 * @return Font
	 */
	public Font getFont(String fileName) {
		try {
			File file = new File(path, fileName);
			if (!file.exists()) {
				//System.out.println("file not found");
				return null;
			}
			fi = new FileInputStream(file);
			fb = new BufferedInputStream(fi);
			nf = Font.createFont(Font.TRUETYPE_FONT, fb);
			nf = nf.deriveFont(Font.BOLD, 22);
			return nf;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (fb != null)
					fb.close();
				if (fi != null)
					fi.close();
			} catch (Exception e) {
				e.printStackTrace();
				fb = null;
				fi = null;
			}

		}
	}
}
