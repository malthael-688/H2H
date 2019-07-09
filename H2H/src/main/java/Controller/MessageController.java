package Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.jfinal.core.Controller;

import Model.Admin;
import Model.Message;
import Model.Notice;
import Model.User;

public class MessageController extends Controller {

	@SuppressWarnings("unchecked")
	public void showMessage(){
	
			User user = getSessionAttr("User");
			StringBuilder sb = new StringBuilder("select * from message where receiverNum=? ");
			List<Message> messages = Message.message.find(sb.toString(),user.getStr("num"));
			SortClass sortClass = new SortClass();
			Collections.sort(messages, sortClass);
			
			HashMap<String,Integer> map =new HashMap<String, Integer>();
			ArrayList<Num_name>  num_names = new ArrayList<Num_name>() ;
			
			for(int i = 0; i < messages.size(); i++){
				Message s = (Message)messages.get(i);
				if(!map.containsKey(s.getStr("senderNum"))){
					map.put(s.getStr("senderNum"), 0);
				}
			}
			
			
			for (int i = 0; i < messages.size(); i++) {
				Message s = (Message)messages.get(i);
				
				if(s.getStr("messageState").equals("0")){
	            	map.put(s.getStr("senderNum"), map.get(s.getStr("senderNum"))+1);
				}
	            }
			
			Iterator<String> iterator = map.keySet().iterator();               
		         while (iterator.hasNext()) {   
		          String key = iterator.next(); 
		          User user1 = User.user.findById(key);
		          String name = user1.getStr("name");
		          System.out.println(name);
		          Num_name num_name = new Num_name(name,key);
		          num_names.add(num_name);
		         }
			
		     
			set("map",map);
			set("map1",num_names);
			render("../message1.jsp");
		
	}
	
	public void showMeseage_reader(){
		User user = getSessionAttr("user");
		StringBuilder sb = new StringBuilder("select * from message where receiverNum=? and messageState=0");
		List<Message> messages = Message.message.find(sb.toString(),user.getStr("num"));
		SortClass sortClass = new SortClass();
		Collections.sort(messages, sortClass);
		set("messages",messages);
		//render("../message1.jsp");
	}
	
	public void showMeseage_unreader(){
		User user = getSessionAttr("user");
		StringBuilder sb = new StringBuilder("select * from message where receiverNum=? and messageState=1");
		List<Message> messages = Message.message.find(sb.toString(),user.getStr("num"));
		SortClass sortClass = new SortClass();
		Collections.sort(messages, sortClass);
		set("messages",messages);
		//render("../message1.jsp");
	}
	
	public void deleteMessage(){
		String messageid = getPara("messageID");
		Message message = Message.message.findById(messageid);
		message.delete();
		showMessage();
	}
	
	public void responseMessage(){
		
	}
	
	public class Num_name{
		String name ;
		String num;
		
		
		public Num_name(String name, String num) {
			super();
			this.name = name;
			this.num = num;
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
		@Override
		public String toString() {
			return "Num_name [name=" + name + ", num=" + num + "]";
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
