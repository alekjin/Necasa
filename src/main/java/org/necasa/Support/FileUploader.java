package org.Necasa.Support;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {

	private static final String ATTACHMENT_ROOT_DIR = "/Users/Alek/Source Code/Necasa/webapp/images";

	public static String upload(Long id, MultipartFile multipartFile) {
		if (multipartFile.isEmpty()) {
			return null;
		}
		File file = transferToAttachmentDir(id, multipartFile);
		return file.getName();
	}

	private static File transferToAttachmentDir(Long id, MultipartFile multipartFile) {
		String type = multipartFile.getContentType();
		File destFile = getDestinationFile(id, type);
		try {
			multipartFile.transferTo(destFile);
		} catch (Exception ex) {
			throw new IllegalArgumentException(destFile + "로 첨부파일 옮기다 오류 발생");
		}
		return destFile;
	}

	public static File getDestinationFile(Long id, String type) {
		if (type.equals("image/png")) {
			type = ".png";
		}
		else if (type.equals("image/jpeg")) {
			type = ".jpg";
		}
		else {
			type = "";
		}
		String id_modified = String.format("%04d", id);
		return new File(ATTACHMENT_ROOT_DIR + File.separator + "IMG" + id_modified + type);
	}
}
