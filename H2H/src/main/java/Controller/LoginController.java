package Controller;

import Config.DemoConfig;
import Config.SendEmail;
import Model.Param;
import Model.User;
import com.jfinal.core.Controller;
import com.jfinal.template.expr.ast.Map;

import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import Service.SessionListener;

public class LoginController extends Controller {
	public static HashMap<String, String> code=new HashMap<String, String>();
	public void index() {
		render("Login.jsp");
	}

	/**
	 * 登录判断
	 * 判断最后登录日期，根据最后日期为用户添加积分
	 * @throws ParseException
	 */
	public void loginCheck() throws ParseException {
		User getUser = getModel(User.class);
		User one = User.user.findById(getUser.get("num"));
		//获取积分数值
		Param param=Param.param.findById("1");
		if (one == null) {
			set("error", 1).render("/login/Login.jsp");
		} else if (one != null) {
			if (getUser.get("password").equals(one.get("password"))) {
				if (one.get("userState").equals(1)) {
					set("error",5).render("/login/Login.jsp");
				}else if (one.get("userState").equals(2)) {
					set("error",6).render("/login/Login.jsp");
				}else if (one.get("userState").equals(0)) {
					
					
					/**
					 * 判断是否为重复登录
					 */
					boolean hasLogin=SessionListener.checkIfHasLogin(one);
					System.out.println(hasLogin);
					HttpSession session = getSession(); 
					if (!hasLogin) {
						//根据参数数据库，为用户添加积分
						/**
						 * 验证日期操作
						 */
						SimpleDateFormat dFormat=new SimpleDateFormat("yyyy-MM-dd");
						//当时间不存在
						//System.out.println(one.get("lastLoginDate"));
						String last=one.get("lastLoginDate");
						if (last!=null) {
							long now=new Date().getTime();
							long sqldate=dFormat.parse((String) one.get("lastLoginDate")).getTime();
							long between=(now-sqldate)/(60*60*24*1000);
							//判断是否超过一天
							if (between>=1) {
								one.set("lastLoginDate",dFormat.format(new Date()) );
								int point=one.getInt("points");
								one.set("points", point+param.getInt("point"));
								one.update();
								//创建session
								 String sessionId = session.getId();  
					              Cookie cookie = new Cookie("JSESSIONID", sessionId);  
					              cookie.setMaxAge(60 * 60);
					              session.setAttribute("User", one);
								setCookie(cookie).set("point", param.get("point")).setSessionAttr("User", one).forwardAction("/home");
								SessionListener.addUserSession(session);
							}else {
								one.set("lastLoginDate",dFormat.format(new Date()) );
								one.update();
								
								//创建session
								 String sessionId = session.getId();  
					              Cookie cookie = new Cookie("JSESSIONID", sessionId);  
					              cookie.setMaxAge(60 * 60);
					              session.setAttribute("User", one);
								setSessionAttr("User", one).forwardAction("/home");
								SessionListener.addUserSession(session);
							}
						}else{                 //当时间为空时
							one.set("lastLoginDate",dFormat.format(new Date()) );
							int point=one.getInt("points");
							one.set("points", point+param.getInt("point"));
							one.update();
							//创建session
							 String sessionId = session.getId();  
				              Cookie cookie = new Cookie("JSESSIONID", sessionId);  
				              cookie.setMaxAge(60 * 60);
				              session.setAttribute("User", one);
							set("point", param.get("point")).setSessionAttr("User", one).forwardAction("/home");
							SessionListener.addUserSession(session);
						}	
						
						
						
						
					}else {
						set("error", 8).render("/login/Login.jsp");
					}
					
				}else {
					set("error", 7).render("/login/Login.jsp");
				}
			} else {
				set("error", 2).render("/login/Login.jsp");
			}
		}
	}
	
	
	/**
	 * 获取注册邮箱验证码
	 */
	public void getRegisterCode() {
		String email = getPara("account");
		String userNum=getPara("user.num");
		System.out.println(userNum);
		if (email != null) {
			SendEmail util = new SendEmail();
			try {
				String randomCode = String.valueOf((int) ((Math.random() * 9 + 1) * 1000));
				code.put(userNum,randomCode );
				System.out.println(randomCode);
				util.sendRegister(randomCode, email);
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	/**
	 * 获取邮箱验证码
	 */
	public void getMailCode() {
		String account = getPara("email");
		String useraccount=getPara("useraccount");
		if (account != null) {
			SendEmail util = new SendEmail();
			try {
				String randomCode = String.valueOf((int) ((Math.random() * 9 + 1) * 1000));
				code.put(useraccount, randomCode);
				util.sendcode(randomCode, account);
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			}
		} else {
			
			//renderJson("邮箱没有输入！");
		}
		//renderJson("发送成功");
	}

	public void registerService() {
		User getUser = getModel(User.class);
		User getSql = User.user.findById(getUser.get("num"));
		String password2 = getPara("userpassword2");
		String mailbox = getPara("mailbox");
		String userNum=String.valueOf(getUser.get("num"));
		if (mailbox.equals(code.get(userNum))){
			if (getSql == null) {
				getUser.set("userState", 0);
				getUser.set("points", 100);
				getUser.set("creditScore", 85);
				getUser.set("releasedTaskNum", 0);
				getUser.set("finishedTaskNum", 0);
				getUser.set("giveUpTaskNum", 0);
				getUser.save();
				set("error", 3).render("/login/Login.jsp");
			} else {
				set("error", 4).render("/login/Register1.jsp");
			}
		} else {
			set("error", 6).render("/login/Register1.jsp");
		}
	}

	public void findPassWord() {
		String account = getPara("useraccount");
		System.out.println(account);
		String email = getPara("email");
		String mailbox = getPara("mailbox");
		User one = User.user.findById(account);
		System.out.println("code======"+code.get(account));
		if (one==null) {
			set("error", 7).render("/login/RefindPassWord.jsp");
		}else {
			if (one.get("email").equals(email)) {
				if (mailbox.equals(code.get(account))) {
					redirect("/login/RefindPassWord2.jsp?account=" + account);
				}else{
					set("error", 8).render("/login/RefindPassWord.jsp");
				}
			}else {
				set("error", 7).render("/login/RefindPassWord.jsp");
			}		
		}
	}

	public void setPassWord() {
		String account = getPara("account");
		String userpassword = getPara("userpassword");
		String userpassword2 = getPara("userpassword2");
		System.out.println(userpassword);
		System.out.println(userpassword2);
		if (userpassword.equals(userpassword2)) {
			User one = new User();
			one.set("num", account);
			one.set("password", userpassword);
			System.out.println("action 1");
			one.update();
			System.out.println("finish");
			set("error", 4).render("/login");
		} else {
			render("/login/RefindPassWord2.jsp");
		}
	}

	public void register1() {
		render("/login/Register1.jsp");
	}

	public void refindPassWord() {
		render("/login/RefindPassWord.jsp");
	}
	
	
	public void logout(){
		HttpSession session = getSession(); 
		String sessionID=session.getId();
		SessionListener.removeSession(sessionID);
		session.removeAttribute("User");
		render("/login");
		
	}

}
