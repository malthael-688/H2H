package Service;

import java.util.List;

import Model.Task;
import Model.User;

public class TaskApplyingList {
	public Task task;
	public List <User> users;
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	@Override
	public String toString() {
		return "TaskApplyingList [task=" + task + ", users=" + users + "]";
	}
	
}
