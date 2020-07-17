package com.team3.fileUpload;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUtils {

	public List<FileVO> FileUpload(FileVO fileVO, HttpServletRequest request,String path) throws Exception {
		// HttpServletRequest에서 파일을 담을 수 없기 때문에 MultiparHttpServletRequest를 사용한다. form에서 값을 받아 오는 역할
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		// Iterator : 모든 컬랙션 클래스의 데이터를 읽을때 사용. 
		// JSP의 <form>태그 내의 <input> 태그의 name속성의 값을 몰라도 모든 데이터를 가지고 올 수 있다.
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originFileName = null;
		String storedFileName = null;
		
		// 다중 파일을 전송할때 사용
		List<FileVO> list = new ArrayList<FileVO>();
		
		// 파일 저장 경로에 해당 폴더가 없을 경우 폴더 생성
		File file = new File(path);
		if (file.exists() == false) {
			file.mkdirs();
		}
		
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			originFileName = multipartFile.getOriginalFilename();
			storedFileName = originFileName;
			
			if (multipartFile.isEmpty() == false) {
				if (new File(path + storedFileName).exists()) {
					//.기준으로 자르기 
					int dotIndex = storedFileName.lastIndexOf('.');
					//파일 이름 바꾸기
					String newStoredFileName = storedFileName.substring(0,dotIndex)+"_"+System.currentTimeMillis();
					//파일 형식
					String fileFormat = storedFileName.substring(dotIndex+1);
					//새로운 이름 
					storedFileName = newStoredFileName+"."+fileFormat;
				}
				// 지정된 경로에 파일 생성
				file = new File(path + storedFileName);
				multipartFile.transferTo(file);
				
				fileVO.setOriginFileName(originFileName);
				fileVO.setStoredFileName(storedFileName);
				fileVO.setFileSize(multipartFile.getSize());
				list.add(fileVO);
			}
		}
		return list;
	}

	
	
	

}
