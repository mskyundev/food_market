package com.team3.service;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.team3.vo.Email;

@Service
public class EmailService {

	@Inject
	private JavaMailSender mailSender;
	
	public void SendEmail(Email email){
        MimeMessage msg = mailSender.createMimeMessage();
        
        try{
        	MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
        	messageHelper.setFrom(email.getSender());
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
            
        }catch(MessagingException e){
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        
        try{
            mailSender.send(msg);
        }catch(MailException e){
            System.out.println("MailException 발생");
            e.printStackTrace();
        }
        
    }

}
