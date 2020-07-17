package com.team3.fileUpload;

public class FileVO {
	private String OriginFileName;
	private String StoredFileName;
	private long FileSize;
	
	public String getOriginFileName() {
		return OriginFileName;
	}
	public void setOriginFileName(String originFileName) {
		OriginFileName = originFileName;
	}
	public String getStoredFileName() {
		return StoredFileName;
	}
	public void setStoredFileName(String storedFileName) {
		StoredFileName = storedFileName;
	}
	public long getFileSize() {
		return FileSize;
	}
	public void setFileSize(long fileSize) {
		FileSize = fileSize;
	}
	
}
