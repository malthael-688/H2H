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
import Service.Num_name;
import Service.SortClass;

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
	

	
	
	
	



}
