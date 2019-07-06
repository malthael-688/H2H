package Controller;

import java.security.GeneralSecurityException;
import java.sql.SQLType;
import java.util.Iterator;
import java.util.List;

import org.eclipse.jetty.server.Request;

import com.alibaba.druid.sql.ast.SQLDataType;
import com.alibaba.druid.sql.ast.SQLParameter;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.SqlPara;

import Config.SendEmail;
import Model.Admin;
import Model.Notice;
import Model.Param;
import Model.Task;
import Model.User;
import Service.TaskService;
import Service.UserService;

public class AdminController extends Controller {
	private static String randomCode;
	
    public void index(){

        //render("AdminIndex.jsp"); 
    	render("Login.jsp");
    }
    
  
	//admin 对于  任务 处理的部分
    public void taskManage(){
    	List<Task> tasks = TaskService.me.find("select * from task where taskState=0 ");	
    	set("tasks", tasks);	
    	render("TaskManage.jsp");
    }
     
    public void checkTask(){
    	String taskid = getPara("taskid");
    	Task task = TaskService.me.findById(taskid);
    
    	task.set("taskState", 1);
    	task.update();
    	taskManage();
    }
    
    public void taskSearch(){ //通过任务编号 或者 发布人账号 找到task
    	String  search = getPara("search");
    	
    	List <Task> tasks = TaskService.me.searchByElement(search);
    	set("tasks",tasks);
    	render("TaskManage.jsp");
    	
    }
    
    
    public void taskDelete(){
    	String id = getPara("taskid");
    	
    	System.out.println("获取的id是------------------------------------"+id);
    	
    	Task task = TaskService.me.findById(id);
    	if(task.getStr("taskState").equals("0")){
    		task.set("taskState", 6);
    		task.update();
    		 taskManage();
    	}
    }
 
    
  //admin 对于   用户 处理的部分
    public void userManage(){
    	List<User> users = UserService.me.find("select * from user ");	
    	set("users", users);
    	set("state",5);
    	//renderJson("{\"state\":\"yes\"}");
    	render("UserManage.jsp");
    }
    
    public void banUser(){
    	String usernum = getPara("num");
    	User user = UserService.me.findById(usernum);
    	
    	if(user.getStr("userState").equals("0"))
    	{	
    	user.set("userState", 1);
    	user.update();
    	List<User> users = UserService.me.find("select * from user ");	
    	set("users", users);	
    	set("state",0);
    	render("UserManage.jsp");
    	
    	}else if(user.getStr("userState").equals("1")){
    		List<User> users = UserService.me.find("select * from user ");	
        	set("users", users);	
        	set("state",1);
        	render("UserManage.jsp");
    	}else if(user.getStr("userState").equals("2")){
    		List<User> users = UserService.me.find("select * from user ");	
        	set("users", users);
        	set("state",2);
        	render("UserManage.jsp");
    	}
    	
    }
    
    public void deleteUser(){
    	String usernum = getPara("num");
    	User user = UserService.me.findById(usernum);
    	if(user.getStr("userState").equals("0"))
    	{	
    	user.set("userState", 2);
    	user.update();
    	List<User> users = UserService.me.find("select * from user ");	
    	set("users", users);	
    	set("state",3);
    	render("UserManage.jsp");
    	}else if(user.getStr("userState").equals("1")){
    		List<User> users = UserService.me.find("select * from user ");	
        	set("users", users);	
        	set("state",1);
        	render("UserManage.jsp");
    	}else if(user.getStr("userState").equals("2")){
    		List<User> users = UserService.me.find("select * from user ");	
        	set("users", users);
        	set("state",2);
        	render("UserManage.jsp");
    	}
    }
    
    public void getNum(){
    	System.out.println("jingru le --------------------");
    	String num1 = getPara("num");
    	System.out.println(num1);
    	
    }
    
    public void changePoint(){
    	
    }
    
    public void userSearch(){
    	String  search = getPara("search");
    	List <User> users = UserService.me.searchByElement(search);
    	set("users",users);
    	
    	set("state",5);
    	render("UserManage.jsp");
    	
    }
    
    
  //admin 对于   公告  处理的部分
    public void noticeManage(){
    	List<Notice> notices = Notice.notice.find("select * from notice ");	
    	set("notices", notices);	
    	render("NoticeManage.jsp");
    }
    
    public void noticeSearch(){
    	String  search = getPara("search");
    	StringBuilder sb = new StringBuilder("select * from notice where noticeID=? or title=?");
    	List <Notice> notices = Notice.notice.find(sb.toString(), search, search);
    	set("notices", notices);	
    	render("NoticeManage.jsp");			
    }
    
  //admin 对于  管理员其他信息  处理的部分
    public void changeAttribute(){
    	
    	render("ChangeAttribute.jsp");
    }
    
  //admin 对于   设置其他系统参数   处理的部分
    public void setParameter(){
    	Param param = Param.param.findById(1) ;
    	String point = param.getStr("point");
    	set("point",point);
    	render("SetParameter.jsp");
    }
    
    public void modifyParameter(){
    	String param = getPara("param");
    	Param paramdb = Param.param.findById(1);
    	paramdb.set("point", param);
    	paramdb.update();
    	setParameter();
    }
    
    //admin 对于   修改密码  处理的部分
    public void changePassword(){
    	
    	render("ChangePassword.jsp");
    }
    
    //老李完成的内容
    public void loginCheck() {
		Admin getUser = getModel(Admin.class);
		Admin one = Admin.admin.findById(getUser.get("adminNum"));
		if (one == null) {
			set("error", 1).render("/Login.jsp");
		} else if (one != null) {
			if (getUser.get("password").equals(one.get("password"))) {
				/**
				 * 登录成功操作。。目前没添加
				 */
				//创建管理员session
				setSessionAttr("admin", one);
				render("/admin/AdminIndex.jsp");
			} else {
				set("error", 2).render("/Login.jsp");
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
			redirect("/admin/RefindPassWord2.jsp?account=" + account);
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
			render("/admin/RefindPassWord2.jsp");
		}
	}
	/**
	 * 跳转页面
	 */
	public void refindPassWord()
	{
		render("/admin/RefindPassWord.jsp");
	}
    
    
    
}
