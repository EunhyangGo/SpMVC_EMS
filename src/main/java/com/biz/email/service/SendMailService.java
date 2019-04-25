package com.biz.email.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.biz.email.model.EMSVO;

@Service
public class SendMailService {

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	ServletContext context;
	
	public void sendMail(EMSVO eVO) {
		
		String from_email = eVO.getFrom_email() ; // 보내는사람 E-mail
		String to_email = eVO.getTo_email() ;	// 받는사람 E-mail
		String subject = eVO.getS_subject();
		String content= eVO.getS_content();
		String file1 = eVO.getS_file1();
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper mHelper ;
		try {
			
			// message, true : 첨부파일이 있을때 UTF-8: 한글 인코딩을 위한
			mHelper 
			= new MimeMessageHelper(message,true,"UTF-8");
			
			mHelper.setFrom(from_email); //보내는 사람 주소
			mHelper.setTo(to_email); //받는 사람 주소
			mHelper.setSubject(subject); // 제목
			mHelper.setText(content); // 본문 true:HTML형식의 본문
			
			// 서버에 올려져 있는 실제 파일을 가져와야 한다.
			FileSystemResource fr = new FileSystemResource(context.getRealPath("/files/") + file1);
			
			// file1 :첨부될 실제 파일 이름
			// fr : 첨부파일을 실제로 메시지에 연결

			mHelper.addAttachment(file1, fr);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
}