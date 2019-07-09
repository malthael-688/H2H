package Controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.jfinal.core.Controller;

import Controller.MessageController.Num_name;
import Controller.MessageController.SortClass;
import Model.Message;
import Model.Notice;
import Model.Task;
import Model.TaskType;
import Model.User;
import Service.MessageService;
import Service.TaskService;

public class HomePageController extends Controller{
	
	
	private static int senderNum ;
	private static int receiverNum ;
	private static final TaskType taskTypeDao = new TaskType().dao();
	private static final Task taskDao = new Task().dao();
	private static final Notice noticeDao = new Notice().dao();
	private static final User userDao = new User().dao();
	private static List<String> publisherName = new ArrayList();
	
	public class hotTask implements Comparable<hotTask>{
		public String num;
		public String title;
		public int heatValue;
		
		hotTask(String num, String title, int heatValue){
			this.num = num;
			this.title = title;
			this.heatValue = heatValue;
		}

		public int compareTo(hotTask o) {
			return o.heatValue - this.heatValue;
		}
	}
	private static List<hotTask> hotTasks = new ArrayList();
	
	public void index(){
		List<Task> tl = taskDao.findAll();
		set("taskTypes", taskTypeDao.findAll());
		set("tasks", TaskService.me.find("select * from task where taskState=0 "));
		set("notices", noticeDao.findAll());
		
		publisherName.clear();
		for(int i = 0; i < tl.size(); i++){
			StringBuilder sb = new StringBuilder("select name from user where num=?");
			List<User> pb = userDao.find(sb.toString(), tl.get(i).getStr("publisherNum"));
			publisherName.add(pb.get(0).getStr("name"));
		}
		set("publisherName", publisherName);
		
		hotTasks.clear();
		for(int i = 0; i < tl.size(); i++){
			hotTasks.add(new hotTask(
					tl.get(i).getStr("taskID"), 
					tl.get(i).getStr("title"), 
					Integer.parseInt(tl.get(i).getStr("heatValue"))));
		}
		Collections.sort(hotTasks);
		set("hotTasks", hotTasks);
		
		render("home.jsp");
	}
	
	public void publishTask(){
		Task newTask = getModel(Task.class);
		User curUser = getSessionAttr("User");
		newTask.set("publisherNum", curUser.getStr("num"));
		System.out.println(curUser.getStr("num"));
//		newTask.set("publisherNum", "123");
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
		String taskNum = getPara("taskNum");
		StringBuilder sb = new StringBuilder("select * from task where num=?");
		List<Task> tasks = taskDao.find(sb.toString(), taskNum);
		set("task", tasks.get(0));
		render("taskInfo_can_accept.html");
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
		
		senderNum = Integer.valueOf(senderNum1);
		receiverNum = Integer.valueOf(receiverNum1);
		
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
		String msg = getPara("msg");
		System.out.println(msg);
		// msg插入数据库操作
		Message message = new Message();
		message.set("senderNum", receiverNum);
		message.set("receiverNum", senderNum);
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//为了实验新建的两个类一个用来排序日期
	//一个用来 进行 userNum 和  Username 和 日期time 的对应
	public class Num_name{
		String name ;
		String num;
		String time;
		
		
		public Num_name(String name, String num) {
			super();
			this.name = name;
			this.num = num;
		}
		
		
		/**
		 * @param name
		 * @param num
		 * @param time
		 */
		public Num_name(String name, String num, String time) {
			super();
			this.name = name;
			this.num = num;
			this.time = time;
		}


		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getNum() {
			return num;
		}
		public void setNum(String num) {
			this.num = num;
		}
		
		/**
		 * @return the time
		 */
		public String getTime() {
			return time;
		}
		/**
		 * @param time the time to set
		 */
		public void setTime(String time) {
			this.time = time;
		}


		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "Num_name [name=" + name + ", num=" + num + ", time=" + time + "]";
		}
	
		
	}
	
	public class SortClass implements Comparator {
		 
		public int compare(Object o1, Object o2) {
			// TODO 自动生成的方法存根
			Message message1 = (Message) o1;
			Message message2 = (Message) o2;
//			public int compareTo(String anotherString)
//			按字典顺序比较两个字符串。该比较基于字符串中各个字符的 Unicode 值。
//			按字典顺序将此 String 对象表示的字符序列与参数字符串所表示的字符序列进行比较。
//			如果按字典顺序此 String 对象位于参数字符串之前，则比较结果为一个负整数。
//			如果按字典顺序此 String 对象位于参数字符串之后，则比较结果为一个正整数。
//			如果这两个字符串相等，则结果为 0；compareTo 只在方法 equals(Object) 返回 true 时才返回 0。 
			
			int flag = message1.getStr("time").compareTo(message2.getStr("time"));
	 
			return flag;
		}
	 
	}
	
	
	
	
	
}
