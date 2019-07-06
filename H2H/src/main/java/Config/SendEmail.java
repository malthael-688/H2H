package Config;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class SendEmail {
	/**
	 * 发送验证码
	 */
	public void sendcode(String code,String email) throws GeneralSecurityException
	{
		 //发送人邮箱
        String to = email;

        // smtp邮箱
        String from = "2889876004@qq.com";

        //主机
        String host = "smtp.qq.com";  //QQ 

        // 建立配置
        Properties properties = System.getProperties();

        // 主机名称
        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);
        // session开通
        Session session = Session.getInstance(properties,new Authenticator(){
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication("2889876004@qq.com", "ntytmaqclkrwdecg"); 
            }
        });

        try{
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(from));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject("H2H-找回密码");

            message.setText("你向H2H校园帮帮发送了一个找回密码请求.\n"+"如果不是你本人，请忽略这封邮件！\n"+"你的验证码为：\n"+code);

            Transport.send(message);
            System.out.println("Sent message successfully....from runoob.com");
        }catch (MessagingException mex) {
            mex.printStackTrace();
        }
	}
	/**
	 * 发送注册验证码
	 */
	public void sendRegister(String code,String email) throws GeneralSecurityException
	{
		 //发送人邮箱
        String to = email;

        // smtp邮箱
        String from = "2889876004@qq.com";

        //主机
        String host = "smtp.qq.com";  //QQ 

        // 建立配置
        Properties properties = System.getProperties();

        // 主机名称
        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);
        // session开通
        Session session = Session.getInstance(properties,new Authenticator(){
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication("2889876004@qq.com", "ntytmaqclkrwdecg"); 
            }
        });

        try{
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(from));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject("H2H-注册账号");

            message.setText("你向H2H校园帮帮发送了一个注册账号请求.\n"+"如果不是你本人，请忽略这封邮件！\n"+"你的验证码为：\n"+code);

            Transport.send(message);
            System.out.println("Sent message successfully....from runoob.com");
        }catch (MessagingException mex) {
            mex.printStackTrace();
        }
	}
}
