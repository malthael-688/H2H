package Controller;

import java.security.GeneralSecurityException;

import com.jfinal.core.Controller;

import Config.SendEmail;
import Model.Admin;
import Model.User;


public class AdminLoginController extends Controller {
	private static String randomCode;
	public void index(){
		render("Login.jsp");
	}
	
	public void loginCheck() {
		Admin getUser = getModel(Admin.class);
		Admin one = Admin.admin.findById(getUser.get("adminNum"));
		if (one == null) {
			set("error", 1).render("/adminLogin/Login.jsp");
		} else if (one != null) {
			if (getUser.get("password").equals(one.get("password"))) {
				/**
				 * 登录成功操作。。目前没添加
				 */
				render("/index.jsp");
			} else {
				set("error", 2).render("/adminLogin/Login.jsp");
			}
		}
	}
	/**
	 * 发送找回密码验证码
	 */
	public void getMailCode() {
		String account = getPara("account");
		System.out.println(account);
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
			renderJson("邮箱没有输入！");
		}
		renderJson("发送成功");
	}
	/**
	 * 找回密码
	 */
	public void findPassWord() {
		String account = getPara("useraccount");
		String email = getPara("email");
		String mailbox = getPara("mailbox");
		Admin one = Admin.admin.findById(account);
		if (one == null) {
			set("error", 7).render("/adminLogin/RefindPassword.jsp");
		} else if (one != null && !mailbox.equals(randomCode)) {
			set("error", 8).render("/adminLogin/RefindPassword.jsp");
		} else if (one != null && one.get("email").equals(email) && mailbox.equals(randomCode)) {
			redirect("/adminLogin/RefindPassWord2.jsp?account=" + account);
		}
	}
	/**
	 * 重置密码
	 */
	public void setPassWord() {
		String account = getPara("account");
		String userpassword = getPara("userpassword");
		String userpassword2 = getPara("userpassword2");
		if (userpassword.equals(userpassword2)) {
			Admin one = new Admin();
			one.set("adminNum", account);
			one.set("password", userpassword);
			one.update();
			set("error", 4).render("/adminLogin");
		} else {
			render("/adminLogin/RefindPassWord2.jsp");
		}
	}
	/**
	 * 跳转页面
	 */
	public void refindPassWord()
	{
		render("/adminLogin/RefindPassWord.jsp");
	}
}
