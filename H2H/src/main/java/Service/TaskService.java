package Service;

import java.util.List;
import java.util.logging.Logger;

import com.jfinal.aop.Before;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import Model.Task;

public class TaskService {
	
	//全局共享业务对象 但要无状态保证   线程安全
	//public static final TaskService me= new TaskService(); 
	public static final TaskService me= Enhancer.enhance(TaskService.class);
	
	//dao对象只让本业务使用 其他对象要使用统一在业务层创建方法来转调
	private static final Task taskDao = new Task().dao();
	
	///protected static Logger log = Logger.getLogger(TaskService.class);
	
	public Task findById( String id){
		return taskDao.findById(id);
	}
	
	public List<Task> find( String sql ){
		
		return taskDao.find(sql.toString());
		
	}
	
	//@Before(Tx.class)
	public List<Task> searchByElement( String key ){
		
		StringBuilder sb = new StringBuilder("select * from task where taskID=? or publisherNum=? and taskstate!=7");
		return taskDao.find(sb.toString(), key,key);
	}
	
	public List<Task> searchByState(){
		
		StringBuilder sb = new StringBuilder("select * from task where taskstate!=7");
		return taskDao.find(sb.toString());
	}
	
}
