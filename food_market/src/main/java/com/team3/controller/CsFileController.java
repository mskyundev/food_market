package com.team3.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team3.service.CsFileService;


@Controller
public class CsFileController {
	
	@Inject
	private CsFileService service;
	
	@RequestMapping(value="/cs/downloadFile")
	public void donwloadFile(@RequestParam int idx, HttpServletResponse response) throws Exception {
		Map<String, Object> map = service.selectFileInfo(idx);
		String org_filename = (String)map.get("org_filename");
		String str_filename = (String)map.get("str_filename");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File("D:\\team\\"+str_filename));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(org_filename,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}
	
	
}

