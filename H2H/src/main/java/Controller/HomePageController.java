package Controller;

import java.util.List;

import com.jfinal.core.Controller;

import Model.Notice;
import Model.Task;
import Model.TaskType;
import Model.User;
import Service.TaskService;

public class HomePageController extends Controller{
	
	private static final TaskType taskTypeDao = new TaskType().dao();
	private static final Task taskDao = new Task().dao();
	private static final Notice noticeDao = new Notice().dao();
	
	public void index(){
		List<Task> tl = taskDao.findAll();
//		for(int i = 0; i < 4; i++){
//			System.out.println(tl.getStr("type"));
//		}
		System.out.println(tl.size());
		set("taskTypes", taskTypeDao.findAll());
		set("tasks", TaskService.me.find("select * from task where taskState=0 "));
		set("notices", noticeDao.findAll());
		render("/home.jsp");
	}
	
	public void publishTask(){
		Task newTask = getModel(Task.class);
		User curUser = getSessionAttr("User");
//		newTask.set("publisherNum", curUser.getStr("num"));
		newTask.set("publisherNum", "123");
		newTask.set("taskState", 0);
		System.out.println(newTask.getStr("type"));
		newTask.save();
		index();
	}
	
}
