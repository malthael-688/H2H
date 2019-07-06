package Controller;

import Config.SendEmail;
import Model.Param;
import Model.User;
import com.jfinal.core.Controller;

import java.security.GeneralSecurityException;

public class LoginController extends Controller {
	private static String randomCode;

	public void index() {
		render("Login.jsp");
	}

	public void loginCheck() {
		User getUser = getModel(User.class);
		User one = User.user.findById(getUser.get("num"));
		//获取积分数值
		Param param=Param.param.findById(get("1"));
		if (one == null) {
			set("error", 1).render("/login/Login.jsp");
		} else if (one != null) {
			if (getUser.get("password").equals(one.get("password"))) {
				if (one.get("userState").equals(1)) {
					set("error",5).render("/login/Login.jsp");
				}else if (one.get("userState").equals(2)) {
					set("error",6).render("/login/Login.jsp");
				}else if (one.get("userState").equals(0)) {
					//根据参数数据库，为用户添加积分
					/**
					 * 验证日期操作还未完成
					 */
					int point=one.getInt("points");
					one.set("points", point+param.getStr("point"));
					one.save();
					//创建session
					set("point", param.get("point")).setSessionAttr("User", one).render("/home.jsp");
					
				}else {
					set("error", 7).render("/login/Login.jsp");
				}
			} else {
				set("error", 2).render("/login/Login.jsp");
			}
		}
	}
	public void getRegisterCode() {
		String account = getPara("account");
		//System.out.println(account);
		if (account != null) {
			SendEmail util = new SendEmail();
			try {
				randomCode = String.valueOf((int) ((Math.random() * 9 + 1) * 1000));
				System.out.println(randomCode);
				util.sendRegister(randomCode, account);
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			}
		} else {
			//renderJson("邮箱没有输入！");
		}
		//renderJson("发送成功");
	}

	public void getMailCode() {
		String account = getPara("account");
		//System.out.println(account);
		if (account != null) {
			SendEmail util = new SendEmail();
			try {
				randomCode = String.valueOf((int) ((Math.random() * 9 + 1) * 1000));
				System.out.println(randomCode);
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
		System.out.println(randomCode);
		if (mailbox.equals(randomCode)) {
			if (getSql == null) {
				getUser.set("userState", 0);
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
		String email = getPara("email");
		String mailbox = getPara("mailbox");
		User one = User.user.findById(account);
		if (one == null) {
			set("error", 7).render("/login/RefindPassWord.jsp");
		} else if (one != null && !mailbox.equals(randomCode)) {
			set("error", 8).render("/login/RefindPassWord.jsp");
		} else if (one != null && one.get("email").equals(email) && mailbox.equals(randomCode)) {
			redirect("/login/RefindPassWord2.jsp?account=" + account);
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

}
