package Controller;

import java.security.GeneralSecurityException;
import java.sql.SQLType;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import Model.Comment;
import Model.Notice;
import Model.Param;
import Model.Task;
import Model.User;
import Service.Md5;
import Service.TaskService;
import Service.UserService;

public class AdminController extends Controller {
	public static HashMap<String, String> code=new HashMap<String, String>();
	
	//跳转进入管理员登录界面
	//作用
	//进入管理员模块第一步
    public void index(){
    	render("Login.jsp");
    }
    
    public void LogOut(){
    	removeSessionAttr("admin");
    	render("Login.jsp");
    	
    }
    
    //针对admin 对任务 (Task) 处理的部分
    //其中包含了方法
    //显示任务    审核任务  任务搜索    任务删除
    public void taskManage(){
    	List<Task> tasks = TaskService.me.find("select * from task where taskState=0 ");	
    	set("tasks", tasks);	
    	render("TaskManage.jsp");
    }
     
    public void checkTask(){
    	String taskid = getPara("taskid");
    	Task task = TaskService.me.findById(taskid);
    	if(task.getStr("taskState").equals("0")){
    	task.set("taskState", 2);
    	task.update();
    	taskManage();
    	} else{
    		set("judge",1);
    		taskManage();
    	}
    }
    
    public void checkTask_no(){
    	String taskid = getPara("taskid");
    	Task task = TaskService.me.findById(taskid);
    	if(task.getStr("taskState").equals("0")){
    	task.set("taskState", 1);
    	task.update();
    	taskManage();
    	} else{
    		set("judge",1);
    		taskManage();
    	}
    }
    
    public void taskSearch(){ //通过任务编号 或者 发布人账号 找到task
    	String state = getPara("type");
    	String search = getPara("search");
    	
    	if(!search.equals("")){
    		List<Task> tasks = TaskService.me.searchByElement(search);
    		if(state.equals("已审核")){
    			Iterator<Task> it = tasks.iterator();
    			while(it.hasNext()){
    				Task x = it.next();
    				if(x.getStr("taskState").equals("0")){
    					it.remove();
    				}
    			}
        	}
        	else if(state.equals("未审核")){
        		Iterator<Task> it = tasks.iterator();
    			while(it.hasNext()){
    				Task x = it.next();
    				if(!x.getStr("taskState").equals("0")){
    					it.remove();
    				}
    			}
        	}
        	else{
        		
        	}
    		set("tasks",tasks);
        	render("TaskManage.jsp");
        	return;
    	}
    	else{
    		List<Task> tasks = TaskService.me.searchByState();
    		if(state.equals("已审核")){
    			Iterator<Task> it = tasks.iterator();
    			while(it.hasNext()){
    				Task x = it.next();
    				if(x.getStr("taskState").equals("0")){
    					it.remove();
    				}
    			}
        	}
        	else if(state.equals("未审核")){
        		Iterator<Task> it = tasks.iterator();
    			while(it.hasNext()){
    				Task x = it.next();
    				if(!x.getStr("taskState").equals("0")){
    					it.remove();
    				}
    			}
        	}
        	else{
        		
        	}
    		set("tasks",tasks);
        	render("TaskManage.jsp");
        	return;
    	}
    	
    	
    	
    	/*
    	String  search = getPara("search");
    	List <Task> tasks = TaskService.me.searchByElement(search);
    	set("tasks",tasks);
    	render("TaskManage.jsp");*/
    }
    
    public void taskDelete(){
    	String id = getPara("taskid");
    	Task task = TaskService.me.findById(id);
    	task.set("taskState", 7);
		task.update();
		taskManage();
    }
    
    public void showTask(){
    	String taskID = getPara("taskID");
    	Task task = Task.task.findById(taskID);
    	if(task.getStr("taskState").equals("0")){
    		
    		set("task",task);
    		render("taskInfoAdminWeiShenHe.jsp");
    	}
    	else{
    		
    		StringBuilder sb = new StringBuilder("select * from comment where taskID=? ");
    		List<Comment> comments = Comment.comment.find(sb.toString(),taskID);
    		set("comments",comments);
    		set("task",task);
    		
    		render("taskInfoAdminYiFaBu.jsp");
    	}
    }
 
    
    
    //针对admin 对 用户 (User) 处理的部分
    //其中包含了方法
    //显示用户    封禁用户   用户删除    修改用户积分    用户搜索  展示用户
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
    	if(user.getStr("userState")==null){
    		user.set("userState", 1);
        	user.update();
        	List<User> users = UserService.me.find("select * from user ");	
        	set("users", users);	
        	set("state",0);
        	render("UserManage.jsp");
    	}
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
    
    public void changePoint(){
    	String num = getPara("num");
    	String point = getPara("point");
    	User user = UserService.me.findById(num);
    	if(!point.equals("")){
    	user.set("points", point);
    	user.update();
    	List<User> users = UserService.me.find("select * from user ");	
    	set("users", users);	
    	set("state",4);
    	render("UserManage.jsp");}
    	else{
    		user.set("points", "0");
        	user.update();
        	List<User> users = UserService.me.find("select * from user ");	
        	set("users", users);	
        	set("state",4);
        	render("UserManage.jsp");
    	}
    }
    
    public void userSearch(){
    	String  search = getPara("search");
    	String  state = getPara("type");
    	
    	if(search.equals("")){
    		List<User> users = UserService.me.find("select * from user ");
    		if(state.equals("正常用户")){
    			Iterator<User> it = users.iterator();
    			while(it.hasNext()){
    				User x = it.next();
    				if(!x.getStr("userState").equals("0")){
    					it.remove();
    				}
    			}
    		}
    		else if(state.equals("已封禁")){
    			Iterator<User> it = users.iterator();
    			while(it.hasNext()){
    				User x = it.next();
    				if(!x.getStr("userState").equals("1")){
    					it.remove();
    				}
    			}
    		}
    		else if(state.equals("已删除")){
    			Iterator<User> it = users.iterator();
    			while(it.hasNext()){
    				User x = it.next();
    				if(!x.getStr("userState").equals("2")){
    					it.remove();
    				}
    			}
    		}
    		else{
    			
    		}
    		set("users",users);
        	set("state",5);
        	render("UserManage.jsp");
        	return;
    	}
    	else{
    		List<User> users = UserService.me.searchByElement(search);
    		if(state.equals("正常用户")){
    			Iterator<User> it = users.iterator();
    			while(it.hasNext()){
    				User x = it.next();
    				if(!x.getStr("userState").equals("0")){
    					it.remove();
    				}
    			}
    		}
    		else if(state.equals("已封禁")){
    			Iterator<User> it = users.iterator();
    			while(it.hasNext()){
    				User x = it.next();
    				if(!x.getStr("userState").equals("1")){
    					it.remove();
    				}
    			}
    		}
    		else if(state.equals("已删除")){
    			Iterator<User> it = users.iterator();
    			while(it.hasNext()){
    				User x = it.next();
    				if(!x.getStr("userState").equals("2")){
    					it.remove();
    				}
    			}
    		}
    		else{
    			
    		}
    		set("users",users);
        	set("state",5);
        	render("UserManage.jsp");
        	return;
    	}
    	
    	/*
    	List <User> users = UserService.me.searchByElement(search);
    	set("users",users);
    	set("state",5);
    	render("UserManage.jsp");
    	*/
    }
    
    public void showUser(){
    	String num = getPara("num");
    	User user = User.user.findById(num);
    	set("user",user);
    	render("userDetail.jsp");
    }
    
    
    
    //针对admin 对 公告 (Notice)处理的部分
    //其中包含了方法
    //显示公告    公告搜索   公告删除    公告发布     公告修改
    public void noticeManage(){
    	List<Notice> notices = Notice.notice.find("select * from notice ");	
    	set("notices", notices);	
    	set("state",0);
    	render("NoticeManage.jsp");
    }
    
    public void noticeSearch(){
    	String  search = getPara("search");
    	StringBuilder sb = new StringBuilder("select * from notice where noticeID=? or title=?");
    	List <Notice> notices = Notice.notice.find(sb.toString(), search, search);
    	set("notices", notices);	
    	set("state",0);
    	render("NoticeManage.jsp");			
    }
    
    public void deleteNotice(){
    	String noticeID = getPara("noticeID");
    	Notice notice = Notice.notice.findById(noticeID);
    	notice.delete();
    	noticeManage();
    }
    
    public void releaseNotice(){
    	System.out.println("........................");
    	String title = getPara("title");
    	if(title.equals("") || title==null){
    		List<Notice> notices = Notice.notice.find("select * from notice ");	
        	set("notices", notices);
        	set("state",1);
        	System.out.println(".........................");
        	render("NoticeManage.jsp");
    		return;
    	}
    	String content = getPara("content");
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
    	String time = 	df.format(new Date());
    	new Notice().set("title",title).set("content", content).set("time", time).save();
    	noticeManage();
    }
    
    public void modifyNotice(){
    	String noticeID = getPara("noticeID");
    	String title = getPara("title");
    	String content = getPara("content");
    	if(title.equals("") || title==null){
    		List<Notice> notices = Notice.notice.find("select * from notice ");	
        	set("notices", notices);
        	set("state",1);
        	System.out.println(".........................");
        	render("NoticeManage.jsp");
    		return;
    	}
    	Notice notice = Notice.notice.findById(noticeID);
    	notice.set("title", title);
    	notice.set("content", content);
    	notice.update();
    	noticeManage();
    }
    

    

    //针对admin 对 系统参数 (Param) 处理的部分
    //其中包含了方法
    //显示公告   设置参数      参数修改
    public void setParameter(){
    	Param param = Param.param.findById(1) ;
    	String point = param.getStr("point");
    	set("point",point);
    	render("SetParameter.jsp");
    }
    
    public void modifyParameter(){
    	String param = getPara("param");
    	Param paramdb = Param.param.findById(1);
    	System.out.println(param.length());
    	if(!param.equals("")){
    	paramdb.set("point", param);
    	paramdb.update();
    	setParameter();
    	}
    	else{
    		setParameter();
    	}
    }
    
    
    
    //针对admin 对  管理员其他属性  处理的部分
    //其中包含了方法
    //修改 当前管理员的 邮箱 名字
    public void changeAttribute(){
    	Admin admin = getSessionAttr("admin");
    	String email = admin.getStr("email");
    	String name = admin.getStr("name");
    	set("email",email);
    	set("name",name);
    	render("ChangeAttribute.jsp");
    }
    
    public void changeEmail(){
    	String email = getPara("email");
    	Admin admin = getSessionAttr("admin");
    	
    	if(!email.equals("")){
    	admin.set("email", email);
    	admin.update();
    	changeAttribute();}
    	else{
    		changeAttribute();
    	}
    }
    
    public void changeName(){
    	String name = getPara("name");
    	Admin admin = getSessionAttr("admin");
    	if(!name.equals("")){
    	admin.set("name", name);
    	admin.update();
    	changeAttribute();}
    	else{
    		changeAttribute();
    	}
    }
    
    
    
    //针对admin 对  管理员密码  处理的部分
    //其中包含了方法
    //修改 当前管理员的 密码
    public void changePassword(){
    	Admin admin = getSessionAttr("admin");
    	String adminNum = admin.getStr("adminNum");
    	set("adminNum",adminNum);
    	render("ChangePassword.jsp");
    }
    
    public void modifyPassword(){
    	Md5 md5 = new Md5();
    	String  adminNum = getPara("adminNum");
    	String  oldPassword= getPara("oldPassword");
    	String  newPassword= getPara("newPassword");
    	Admin admin = Admin.admin.findById(adminNum);
    	if(admin==null){
    		Admin admin1 = getSessionAttr("admin");
        	String adminNum1 = admin1.getStr("adminNum");
        	set("adminNum",adminNum1);
        	set("error",1);
        	render("ChangePassword.jsp");
    		return;
    	}
    	System.out.println(adminNum);
    	System.out.println(admin.toString());
    	
    	if(admin.getStr("password").equals(md5.stringMD5(oldPassword)) && !newPassword.equals("")){
    		admin.set("password", md5.stringMD5(newPassword));
    		admin.update();
    		Admin admin1 = getSessionAttr("admin");
        	String adminNum1 = admin1.getStr("adminNum");
        	set("adminNum",adminNum1);
        	set("error",0);
        	render("ChangePassword.jsp");
    	} 
    	else{
    		Admin admin1 = getSessionAttr("admin");
        	String adminNum1 = admin1.getStr("adminNum");
        	set("adminNum",adminNum1);
        	set("error",1);
        	render("ChangePassword.jsp");
    	} 
    	
    }
    
    
    
    //针对admin登录的情况
    //其中包含了方法
    //登录检测    获取邮箱验证码   找回密码  重置密码  跳转页面
    @SuppressWarnings("static-access")
	public void loginCheck() {
    	Md5 md5 = new Md5();
		Admin getUser = getModel(Admin.class);
		Admin one = Admin.admin.findById(getUser.get("adminNum"));
		if (one == null) {
			set("error", 1).render("Login.jsp");
		} else if (one != null) {
			if (md5.stringMD5( getUser.getStr("password")).equals(one.get("password"))) {
				/**
				 * 登录成功操作。。目前没添加
				 */
				//创建管理员session
				setSessionAttr("admin", one);
				render("AdminIndex.jsp");
			} else {
				set("error", 2).render("Login.jsp");
			}
		}
	}
    
	/**
	 * 发送找回密码验证码
	 */
	public void getMailCode() {
		String email = getPara("account");
		String adminNum=getPara("admin.num");
		if (email != null) {
			SendEmail util = new SendEmail();
			try {
				String randomCode = String.valueOf((int) ((Math.random() * 9 + 1) * 1000));
				code.put(adminNum, randomCode);
				util.sendcode(randomCode, email);
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
		System.out.println("-----"+code.get(account));
		Admin one = Admin.admin.findById(account);
		if (one==null) {
			set("error", 7).render("/admin/RefindPassWord.jsp");
		}else {
			if (one.get("email").equals(email)) {
				if (mailbox.equals(code.get(account))) {
					redirect("/admin/RefindPassWord2.jsp?account=" + account);
				}else{
					set("error", 8).render("/admin/RefindPassWord.jsp");
				}
			}else {
				set("error", 7).render("/admin/RefindPassWord.jsp");
			}		
		}
	}
	/**
	 * 重置密码
	 */
	public void setPassWord() {
		Md5 md5 = new Md5 ();
		String account = getPara("account");
		String userpassword = getPara("userpassword");
		String userpassword2 = getPara("userpassword2");
		if (userpassword.equals(userpassword2)) {
			Admin one = new Admin();
			one.set("adminNum", account);
			String userpassword1 = md5.stringMD5(userpassword);
			one.set("password", userpassword1);
			one.update();
			set("error", 4).render("/admin");
		} else {
			render("RefindPassWord2.jsp");
		}
	}
	/**
	 * 跳转页面
	 */
	public void refindPassWord()
	{
		render("RefindPassWord.jsp");
	}
    
    
    
}
