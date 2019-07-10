package Controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.jfinal.core.Controller;

import Model.Apply;
import Model.Comment;
import Model.Message;
import Model.Notice;
import Model.Task;
import Model.TaskType;
import Model.User;
import Service.MessageService;
import Service.SessionListener;
import Service.TaskService;
import Service.Num_name;
import Service.SortClass;

public class HomePageController extends Controller{
	private static final TaskType taskTypeDao = new TaskType().dao();
	private static final Task taskDao = new Task().dao();
	private static final Notice noticeDao = new Notice().dao();
	private static final User userDao = new User().dao();
	private static final Apply applyDao = new Apply().dao();
	private static final Message messageDao = new Message().dao();
	private static final Comment commentDao = new Comment().dao();
	
	private static List<String> publisherName = new ArrayList();
	public class TaskSortClass implements Comparator {
		public int compare(Object o1, Object o2) {
			Task t1 = (Task) o1;
			Task t2 = (Task) o2; 
			return Integer.parseInt(t2.getStr("heatValue")) - Integer.parseInt(t1.getStr("heatValue"));
		}
	}
	
	public void index(){
		User curUser = getSessionAttr("User");
		
		List<Task> tl;
		String searchKey = getPara("searchKey");
		System.out.println(searchKey);
		String tt = getPara("filterType");
		if(tt==null && searchKey == null){
			tl = taskDao.find("select * from task where taskState=? and publisherNum != ?", "2", curUser.get("num"));
		} else if(tt != null){
			tl = taskDao.find("select * from task where taskState=? and type=? and publisherNum != ?", "2", tt, curUser.get("num"));
		} else {
			tl = taskDao.find("select * from task where title like %?$ and publisherNum != ?", searchKey, curUser.get("num"));
		}
		set("tasks", tl);
		set("taskTypes", taskTypeDao.findAll());
		set("notices", noticeDao.findAll());
		
		publisherName.clear();
		for(int i = 0; i < tl.size(); i++){
			StringBuilder sb = new StringBuilder("select name from user where num=?");
			List<User> pb = userDao.find(sb.toString(), tl.get(i).getStr("publisherNum"));
			publisherName.add(pb.get(0).getStr("name"));
		}
		set("publisherName", publisherName);
		
		for(int i = 0; i < tl.size(); i++){
			List<Comment> cl = commentDao.find(
					"select * from comment where taskID=?", tl.get(i).get("taskID"));
			tl.get(i).set("heatValue", cl.size());
		}
		
		List<Task>hotTasks = new ArrayList<Task>();
		int tlSize = tl.size();
		if(tlSize > 5) tlSize = 5;
		for(int i = 0; i < tlSize; i++){
			hotTasks.add(tl.get(i));
		}
		TaskSortClass tSort = new TaskSortClass();
		Collections.sort(hotTasks, tSort);
		set("hotTasks", hotTasks);
		List<Message> ml = messageDao.find(
				"select * from message where receiverNum=? and messageState=0", 
				curUser.get("num"));
		set("messageNum", ml.size());
		set("User",curUser);
		
		set("point", getPara("point"));
		
		render("home.jsp");
	}
	
	public void publishTask(){
		Task newTask = getModel(Task.class);
		User curUser = getSessionAttr("User");
		newTask.set("publisherNum", curUser.getStr("num"));
		newTask.set("taskState", 0);
		newTask.set("heatValue", 0);
		
		String taskType = getPara("type");
		newTask.set("type", taskType);
		
		newTask.set("deadLine", newTask.getStr("startTime") + " " + newTask.getStr("deadLine"));
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		newTask.set("startTime", df.format(new java.util.Date()));
		
		newTask.save();
		

		redirect("/home");
	}
	
	public void showTaskDetail(){
		String taskID = getPara("taskID");
		StringBuilder sb = new StringBuilder("select * from task where taskID=?");
		List<Task> tasks = taskDao.find(sb.toString(), taskID);
		set("task", tasks.get(0));
		
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+taskID+"'");
        set("comments",comments);
        
        List<String> comNames = new ArrayList<String>();
        for(int i = 0; i < comments.size(); i++){
    		List<User> ul = userDao.find("select * from user where num=?", comments.get(i).get("commentatorNum"));
    		String cName = ul.get(0).get("name");
    		comNames.add(cName);
        }
        set("comNames", comNames);
		
		User curUser = getSessionAttr("User");
		sb = new StringBuilder("select * from apply where taskID=? and applicantNum=?");
		List<Apply> aps = applyDao.find(sb.toString(), taskID, curUser.getStr("num"));
		
		List<User> ul = userDao.find("select * from user where num=?", tasks.get(0).get("publisherNum"));
		String publisherName = ul.get(0).get("name");
		set("publisherName", publisherName);
		
		if(aps.isEmpty()){
			render("taskInfo_can_accept.jsp");
		} else {
			render("taskInfo_recieve_applying.jsp");
		}
	}
	
	public void acceptTask(){
		String taskID = getPara("taskID");
		User curUser = getSessionAttr("User");
		Apply newApply = new Apply();
		newApply.set("taskID", taskID);
		newApply.set("applicantNum", curUser.getStr("num"));
		newApply.save();
		
		StringBuilder sb = new StringBuilder("select * from task where taskID=?");
		List<Task> tasks = taskDao.find(sb.toString(), taskID);
		set("task", tasks.get(0));
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+taskID+"'");
        set("comments",comments);
		List<User> ul = userDao.find("select * from user where num=?", tasks.get(0).get("publisherNum"));
		String publisherName = ul.get(0).get("name");
		set("publisherName", publisherName);
        List<String> comNames = new ArrayList<String>();
        for(int i = 0; i < comments.size(); i++){
    		ul = userDao.find("select * from user where num=?", comments.get(i).get("commentatorNum"));
    		String cName = ul.get(0).get("name");
    		comNames.add(cName);
        }
        set("comNames", comNames);
		render("taskInfo_recieve_applying.jsp");
	}
	
	public void cancelApply(){
		String taskID = getPara("taskID");
		User curUser = getSessionAttr("User");
		StringBuilder sb = new StringBuilder("select * from apply where taskID=? and applicantNum=?");
		System.out.println(taskID);
		System.out.println(curUser.get("num"));
		List<Apply> aps = applyDao.find(sb.toString(), taskID, curUser.getStr("num"));
		aps.get(0).delete();
		
		sb = new StringBuilder("select * from task where taskID=?");
		List<Task> tasks = taskDao.find(sb.toString(), taskID);
		set("task", tasks.get(0));
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+taskID+"'");
        set("comments",comments);
		List<User> ul = userDao.find("select * from user where num=?", tasks.get(0).get("publisherNum"));
		String publisherName = ul.get(0).get("name");
		set("publisherName", publisherName);
        List<String> comNames = new ArrayList<String>();
        for(int i = 0; i < comments.size(); i++){
    		ul = userDao.find("select * from user where num=?", comments.get(i).get("commentatorNum"));
    		String cName = ul.get(0).get("name");
    		comNames.add(cName);
        }
        set("comNames", comNames);
		render("taskInfo_can_accept.jsp");
	}
	
    public void commit() {
        Comment comment=getModel(Comment.class);
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        User curUser = getSessionAttr("User");
        comment.set("commentatorNum",curUser.get("num"));
        comment.set("taskID",id);
        java.util.Date d = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(d);
        comment.set("time",time);
        comment.save();
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
		List<User> ul = userDao.find("select * from user where num=?", tasks.get("publisherNum"));
		String publisherName = ul.get(0).get("name");
		set("publisherName", publisherName);
		StringBuilder sb = new StringBuilder("select * from apply where taskID=? and applicantNum=?");
		List<Apply> aps = applyDao.find(sb.toString(), oneId, curUser.getStr("num"));
        List<String> comNames = new ArrayList<String>();
        for(int i = 0; i < comments.size(); i++){
    		ul = userDao.find("select * from user where num=?", comments.get(i).get("commentatorNum"));
    		String cName = ul.get(0).get("name");
    		comNames.add(cName);
        }
        set("comNames", comNames);
		if(aps.isEmpty()){
			render("taskInfo_can_accept.jsp");
		} else {
			render("taskInfo_recieve_applying.jsp");
		}
    }
	
	//message部分
	//加入了 跳转message部分
	//
	@SuppressWarnings("unchecked")
	public void showMessage(){
	
			User user = getSessionAttr("User");
			StringBuilder sb = new StringBuilder("select * from message where receiverNum=? ");
			List<Message> messages = Message.message.find(sb.toString(),user.getStr("num"));
			SortClass sortClass = new SortClass();
			Collections.sort(messages, sortClass);
			
			HashMap<String,Integer> map =new HashMap<String, Integer>();
			ArrayList<Num_name>  num_names = new ArrayList<Num_name>() ;
			ArrayList<String> time = new ArrayList<String>() ;
			for(int i = 0; i < messages.size(); i++){
				Message s = (Message)messages.get(i);
				if(!map.containsKey(s.getStr("senderNum"))){
					map.put(s.getStr("senderNum"), 0);
					time.add(s.getStr("time"));
				}
			}
			
			for (int i = 0; i < messages.size(); i++) {
				Message s = (Message)messages.get(i);
				
				if(s.getStr("messageState").equals("0")){
	            	map.put(s.getStr("senderNum"), map.get(s.getStr("senderNum"))+1);
				}
	            }
			int i = 0;
			Iterator<String> iterator = map.keySet().iterator();               
		         while (iterator.hasNext()) {   
		          String key = iterator.next(); 
		          User user1 = User.user.findById(key);
		          String name = user1.getStr("name");
		      
		          Num_name num_name = new Num_name(name,key,time.get(i));
		          i++;
		          num_names.add(num_name);
		         } 
		         
		         System.out.println(num_names.toString());
			set("map",map);
			set("map1",num_names);
			render("message1.jsp");
	}
	

	
	//私信功能 对应的是message2页面的相关内容
	//author mqy
	//
	public void initMessage() {
		
		String senderNum1 = getPara("senderNum");
		User usersender = User.user.findById(senderNum1);
		String sendername = usersender.getStr("name");
		
		User userreceiver = getSessionAttr("User");
		String receiverNum1 = userreceiver.getStr("num");
		String receivername = userreceiver.getStr("name");
		
		int senderNum = Integer.valueOf(senderNum1);
		int receiverNum = Integer.valueOf(receiverNum1);
		
		System.out.println("hhhhhhhhhhhhhhhhhh"+senderNum);
		System.out.println("aaaaaaaaaaaaaaaaaa"+receiverNum);
		
		List<Message> list1 = MessageService.me
				.find("select * from message where senderNum = " + senderNum + " and receiverNum = " + receiverNum);
		for (Message temp : list1) {
			temp.set("messageState", 1);
			temp.set("showState", 1);
			temp.update();
		}
		List<Message> list2 = MessageService.me
				.find("select * from message where senderNum = " + receiverNum + " and receiverNum = " + senderNum);
		list1.addAll(list2);
		for(Message temp: list1){
			System.out.println(temp.getStr("senderNum"));
			//System.out.println(temp.getStr(attr));
		}
		SortClass sortClass = new SortClass();
		Collections.sort(list1, sortClass);
		System.out.println(list1.size());
		set("messages", list1);
		set("senderNum", senderNum);
		set("receiverNum", receiverNum);
		set("senderName",sendername);
		set("receiverName",receivername);
		render("message2.jsp");
	}

	public void getMessage() {
		String senderNum = getPara("senderNum");
		String receiverNum = getPara("receiverNum");
		List<Message> list = MessageService.me.find("select * from message where senderNum = " + senderNum
				+ " and receiverNum = " + receiverNum + " and showState = 0");
		for (Message temp : list) {
			temp.set("messageState", 1);
			temp.set("showState", 1);
			temp.update();
		}
		System.out.println("size==================="+list.size());
		SortClass sortClass = new SortClass();
		Collections.sort(list, sortClass);
		renderJson(list);
	}

	public void sendMessage() {
		String senderNum = getPara("senderNum");
		String receiverNum = getPara("receiverNum");
		String msg = getPara("msg");
		System.out.println(msg);
		// msg插入数据库操作
		Message message = new Message();
		message.set("senderNum", Integer.parseInt(receiverNum));
		message.set("receiverNum", Integer.parseInt(senderNum));
		message.set("content", msg);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateFormat.format(new java.util.Date());
		message.set("time", time);
		message.set("messageState", 0);
		message.set("showState", 0);
		if (message.save())
			renderText("ok");
		else
			renderText("failed");
	}

	
    public void LogOut(){
    	HttpSession se=getSession();
    	String sessionID=se.getId();
    	SessionListener.removeSession(sessionID);
    	se.invalidate();
    	render("/login");
    }
	
    public void ToOthers(){
    	String num = getPara("num");
    	User user = User.user.findById(num);
    	setAttr("user",user);
    	render("otherPeople.jsp");
    }
	
}
