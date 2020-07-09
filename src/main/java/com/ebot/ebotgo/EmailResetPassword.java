package com.ebot.ebotgo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class EmailResetPassword {
    @Autowired
    JawMySQL jawMySQL;

    private final String username = System.getenv("email");
    private final String password = System.getenv("email_password");

    Properties prop = new Properties();

    public EmailResetPassword(){
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
    }

    public void sendPasswordResetEmail(String userId,String registeredEmail) throws Exception {
        String newPassword = jawMySQL.resetPassword(userId,registeredEmail);
        if(newPassword ==null) return;
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(registeredEmail)
            );
            message.setSubject("eBotGo Password Reset Request");
            message.setContent("Your new password on eBotGo is <strong>"+newPassword+"<strong>","text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
