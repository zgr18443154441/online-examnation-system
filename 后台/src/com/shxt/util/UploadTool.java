package com.shxt.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadTool {
	private static File file;
	private static File newfile;
	private static String servletpath;
	private static String uuid;
	public static String upload(MultipartFile mf,HttpServletRequest request){
		uuid = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(mf.getOriginalFilename());
		if(mf.getSize()!=0){
			servletpath = request.getServletContext().getRealPath("/upload");
			file = new File(servletpath);
			if(!file.isDirectory()){
				file.mkdirs();
			}
			newfile = new File(servletpath, uuid);
			try {
				mf.transferTo(newfile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return uuid;
	}
}
