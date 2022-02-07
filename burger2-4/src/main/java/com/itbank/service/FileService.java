package com.itbank.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.NoticeDAO;
import com.itbank.model.NoticeDTO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

@Service
public class FileService {
	
	@Autowired private NoticeDAO dao;

//	private String uploadPath = "C://upload";  
//	private File dir;
	
//	public FileService() {
//		dir = new File(uploadPath);
//		if(dir.exists() == false) {
//			System.out.println("폴더가 없어서 새로 생성함");
//			dir.mkdirs();
//		}
//	}
	
	// 전송에 필요한 정보
	private final String serverIP = "192.168.0.98";
	private final int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;
		
	public int upload(NoticeDTO dto) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		
		// 1. 업로드 받은 파일을 임시파일로 웹서버에 생성
		MultipartFile file = dto.getUploadFile();
		
		File dest = new File(today + file.getOriginalFilename());
		
		file.transferTo(dest);
		
		// 2. 웹 서버에 생성된 임시파이을 파일서버에 전송
		Session sess = null;
		Channel channel = null;
		JSch jsch = new JSch();
		
		sess = jsch.getSession(serverUser, serverIP, serverPort);
		sess.setPassword(serverPass);
		sess.setConfig("StrictHostKeyChecking", "no");
		sess.connect();
		
		System.out.println("sftp > connected");
		channel = sess.openChannel("sftp");
		channel.connect();
		
		// 리눅스 서버에 SFTP 형식으로 접속
		chSftp = (ChannelSftp)channel;
		
		FileInputStream fis = new FileInputStream(dest);
		
		// 디렉토리 이동
		chSftp.cd("/var/www/html");
		
		// 동일한 이름으로 전송
		chSftp.put(fis, dest.getName());
		
		System.out.println("sftp > transfer complete");
		
		fis.close();
		chSftp.exit();
		
		String fileName = "";
		
		fileName += "http://";
		fileName += serverIP;
		
		// 기본 포트는 80이며 작성할 필요는 없으나, 서비스가 중복된다면 별도로 지정
		fileName += ":1234";			
		fileName += "/" + dest.getName();
		dto.setFileName(fileName);
		
		return dao.insert(dto);
	}
	
	public int uploadModify(NoticeDTO dto) throws Exception {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
//		String fileName = dto.getUploadFile().getOriginalFilename();
//		fileName = today + "_" + fileName;
		
		// 1. 업로드 받은 파일을 임시파일로 웹서버에 생성
		MultipartFile file = dto.getUploadFile();

		File dest = new File(today + file.getOriginalFilename());

		file.transferTo(dest);

		// 2. 웹 서버에 생성된 임시파이을 파일서버에 전송
		Session sess = null;
		Channel channel = null;
		JSch jsch = new JSch();

		sess = jsch.getSession(serverUser, serverIP, serverPort);
		sess.setPassword(serverPass);
		sess.setConfig("StrictHostKeyChecking", "no");
		sess.connect();

		System.out.println("sftp > connected");
		channel = sess.openChannel("sftp");
		channel.connect();

		// 리눅스 서버에 SFTP 형식으로 접속
		chSftp = (ChannelSftp) channel;

		FileInputStream fis = new FileInputStream(dest);

		// 디렉토리 이동
		chSftp.cd("/var/www/html");

		// 동일한 이름으로 전송
		chSftp.put(fis, dest.getName());

		System.out.println("sftp > transfer complete");

		fis.close();
		chSftp.exit();

		String fileName = "";

		fileName += "http://";
		fileName += serverIP;

		// 기본 포트는 80이며 작성할 필요는 없으나, 서비스가 중복된다면 별도로 지정
		fileName += ":1234";
		fileName += "/" + dest.getName();
		dto.setFileName(fileName);
		
		return dao.update(dto);
	}

}

