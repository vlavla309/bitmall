package com.cafe24.bitmall.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	private static final String SAVE_PATH = "/bitmall/uploads/images/product";
	private static final String PREFIX_URL = "/assets/uploads/images/product/";
	
	public String restore(MultipartFile multipartFile) {
		String url = "";
		String originFileName = multipartFile.getOriginalFilename();
		String extName = originFileName.substring(originFileName.lastIndexOf("."), originFileName.length());
		long size = multipartFile.getSize();
		String saveFileName = genSaveFilename(extName);
		
		url = PREFIX_URL + saveFileName;
		try {
			writeFile(multipartFile, saveFileName);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return url;
	}
	
	private String genSaveFilename(String extName) {
		String fileName="";
		Calendar calendar= Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		byte[] fileData = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH+"/"+saveFileName);
		fos.write(fileData);
		fos.close();
	}
}
