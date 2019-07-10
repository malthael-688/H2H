package Controller;

import Model.Apply;
import Model.Comment;
import Model.Message;
import Model.Task;
import Model.User;
import Service.TaskApplyingList;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import Service.Md5;
import Service.SessionListener;

public class EditController extends Controller {
    //public static User thisOne;
    public void index() {
    	User thisOne= getSessionAttr("User");
        setAttr("user",thisOne);
        renderJsp("test.jsp");
    }
    
    public void test_page() {
    	User thisOne= getSessionAttr("User");
        setAttr("user",thisOne);
        renderJsp("edit_Personal_Information.jsp");
    }
    

    public void changeName() {
    	User thisOne= getSessionAttr("User");
        String newName=getPara("name");
        thisOne.set("name",newName);
        thisOne.update();
        renderJsp("edit_Personal_Information.jsp");
    }

    public void changeMail() {
    	User thisOne= getSessionAttr("User");
        String newMail=getPara("mail");
        thisOne.set("email",newMail);
        thisOne.update();
        renderJsp("edit_Personal_Information.jsp");
    }

    public void changePhone() {
    	User thisOne= getSessionAttr("User");
        String newPhone=getPara("phone");
        thisOne.set("phone",newPhone);
        thisOne.update();
        renderJsp("edit_Personal_Information.jsp");
    }

    public void changePassword() {
    	Md5 md5 = new Md5();
    	User thisOne= getSessionAttr("User");
        String password=getPara("password");
        thisOne.set("password",md5.stringMD5(password));
        thisOne.update();
        renderJsp("edit_Personal_Information.jsp");
    }

    public void recieve_finished_page() {
    	User thisOne= getSessionAttr("User");
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='5' AND receiverNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_recieve_finished.jsp");
    }

    public void recieve_applying_page() {
    	User thisOne= getSessionAttr("User");
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT task.* FROM task , apply WHERE task.taskState='2' and task.taskID=apply.taskID  and  apply.applicantNum='"+thisNum+"' ");
        setAttr("tasks",tasks);
        renderJsp("personalTask_recieve_applying.jsp");
    }

    
    public void recieve_nowDoing_page() {
    	User thisOne= getSessionAttr("User");
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='3' AND receiverNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_recieve_nowDoing.jsp");
    }

    public void publish_examine_page() {
    	User thisOne= getSessionAttr("User");
        long thisNum=thisOne.get("num");
        List<Task> tasks= Task.task.find("SELECT * FROM task WHERE taskState='0' AND publisherNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_publish_examine.jsp");
    }

    public void publish_finished_page() {
    	User thisOne= getSessionAttr("User");
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='5' AND publisherNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_publish_finished.jsp");
    }

    public void publish_nowDoing_page() {
    	User thisOne= getSessionAttr("User");
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='3' OR taskState='4' AND publisherNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_publish_nowDoing.jsp");
    }

    @SuppressWarnings("null")
	public void publish_unaccept_page() {
    	User thisOne= getSessionAttr("User");
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='2' AND publisherNum='"+thisNum+"'");
        List<Apply> applys= Apply.apply.findAll();
       
        List<TaskApplyingList> sc =new ArrayList<TaskApplyingList>();
        for (Task t : tasks) {
        	TaskApplyingList temp= new TaskApplyingList();
        	List <User> users = new ArrayList<User>();
        	temp.setTask(t);
         for(Apply a:applys){
        	 if(a.getStr("taskID").equals(t.getStr("taskID"))){
        		 System.out.println("sccccccc---"+a.toString());
        		 User user = User.user.findById(a.getStr("applicantNum"));
        		 System.out.println("sccccccc---"+user.toString());
        		 users.add(user);
        	 }
         }
         temp.setUsers(users);
         sc.add(temp);
        }
        setAttr("scs",sc);
        renderJsp("personalTask_publish_unaccept.jsp");
    }

    
    public void personalTasks_page() {
    	User thisOne= getSessionAttr("User");
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE publisherNum='"+thisNum+"' OR receiverNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTasks1.jsp");
    }

    public void  taskInfo_publish_examine () {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        User user = User.user.findById(tasks.getStr("publisherNum"));
        setAttr("publisherName",user.getStr("name"));
        renderJsp("taskInfo_publish_examine.jsp");
    }
    
    public void publish_examine_submit() {
    	User thisOne= getSessionAttr("User");
        Comment comment=getModel(Comment.class);
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        comment.set("commentatorNum",thisOne.get("num"));
        comment.set("taskID",id);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(d);
        comment.set("time",time);
        comment.save();
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_publish_examine.jsp");
    }

    public void taskDelete() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task thisTask=Task.task.findById(id);
        thisTask.set("taskState",7);
        thisTask.update();
        index();
    }

    public void taskInfo_publish_finished() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
     
        String receivenum = tasks.getStr("receiverNum");
        User user = User.user.findById(receivenum);
        String receivename = user.getStr("name");
        
        String publisherNum = tasks.getStr("publisherNum");
        User user1 = User.user.findById(publisherNum);
        String publisherName = user1.getStr("name");
        
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        setAttr("receiverName",receivename);
        setAttr("publisherName",publisherName);
        renderJsp("taskInfo_publish_finished.jsp");
    }

    public void publish_finished_submit() {
    	User thisOne= getSessionAttr("User");
        Comment comment=getModel(Comment.class);
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        comment.set("commentatorNum",thisOne.get("num"));
        comment.set("taskID",id);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(d);
        comment.set("time",time);
        comment.save();
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_publish_finished.jsp");
    }

    public void taskInfo_publish_nowDoing() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
        
        String receivenum = tasks.getStr("receiverNum");
        User user = User.user.findById(receivenum);
        String receivename = user.getStr("name");
        
        String publisherNum = tasks.getStr("publisherNum");
        User user1 = User.user.findById(publisherNum);
        String publisherName = user1.getStr("name");
       
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        setAttr("receiverName",receivename);
        setAttr("publisherName",publisherName);
        renderJsp("taskInfo_publish_nowDoing.jsp");
    }

    public void publish_nowDoing_submit() {
    	User thisOne= getSessionAttr("User");
        Comment comment=getModel(Comment.class);
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        comment.set("commentatorNum",thisOne.get("num"));
        comment.set("taskID",id);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(d);
        comment.set("time",time);
        comment.save();
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_publish_nowDoing.jsp");
    }

    public void yanshouTask() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task thisTask=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        thisTask.set("taskState",5);
        thisTask.update();
        User publisher = User.user.findById(thisTask.getStr("publisherNum"));
        User receiver = User.user.findById(thisTask.getStr("receiverNum"));
        
        publisher.set("releasedTaskNum", Integer.valueOf(publisher.getStr("releasedTaskNum"))+1);
        publisher.set("points", Integer.valueOf(publisher.getStr("points"))-Integer.valueOf(thisTask.getStr("rewardPoints")));
        publisher.update();
        
        
        receiver.set("finishedTaskNum", Integer.valueOf(receiver.getStr("finishedTaskNum"))+1);
        receiver.set("points", Integer.valueOf(receiver.getStr("points"))+Integer.valueOf(thisTask.getStr("rewardPoints")));
        receiver.update();
        
        setAttr("taskId",thisTask.get("taskID"));
        renderJsp("pingjia.jsp");
    }

    public void  taskInfo_publish_unStart () {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        List<Apply> applys= Apply.apply.findAll();
        List<User> users=new ArrayList<User>();
        for (Apply t:applys) {
            int num=t.get("taskID");
            if (num==id) {
                users.add(User.user.findById(t.get("applicantNum")));
            }
        }
        String publisherNum = tasks.getStr("publisherNum");
        User user = User.user.findById(publisherNum);
        String publisherName = user.getStr("name");
        
        setAttr("applyList1",users);
        setAttr("comments",comments);
        setAttr("task",tasks);
        setAttr("publisherName",publisherName);
        renderJsp("taskInfo_publish_unStart.jsp");
    }

    public void publish_unStart_submit() {
    	User thisOne= getSessionAttr("User");
        Comment comment=getModel(Comment.class);
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        comment.set("commentatorNum",thisOne.get("num"));
        comment.set("taskID",id);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(d);
        comment.set("time",time);
        comment.save();
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_publish_unStart.jsp");
    }

    public void taskInfo_recieve_applying() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        String publisherNum = tasks.getStr("publisherNum");
        User user = User.user.findById(publisherNum);
        String publisherName = user.getStr("name");
        
        setAttr("publisherName",publisherName);
        
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_applying.jsp");
    }

    public void recieve_applying_submit() {
    	User thisOne= getSessionAttr("User");
        Comment comment=getModel(Comment.class);
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        comment.set("commentatorNum",thisOne.get("num"));
        comment.set("taskID",id);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(d);
        comment.set("time",time);
        comment.save();
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_applying.jsp");
    }
    
    public void quitApplying(){
    	User thisOne= getSessionAttr("User");
  	  String oneId = getPara("taskId");
  	  String usernum = thisOne.getStr("num");
  	  StringBuilder sb = new StringBuilder("select * from apply where taskID=? and applicantNum=? ");
      List<Apply> applys = Apply.apply.find(sb.toString(), oneId,usernum);
      for (Apply t:applys) {
         t.delete();
      }
      index();
    	
    }
    
    

    public void taskInfo_recieve_finished() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        String receivenum = tasks.getStr("receiverNum");
        User user = User.user.findById(receivenum);
        String receivename = user.getStr("name");
        String publisherNum = tasks.getStr("publisherNum");
        User user1 = User.user.findById(publisherNum);
        String publisherName = user1.getStr("name");
        
        setAttr("receiverName",receivename);
        setAttr("publisherName",publisherName);
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_finished.jsp");
    }

    public void recieve_finished_submit() {
    	User thisOne= getSessionAttr("User");
        Comment comment=getModel(Comment.class);
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        comment.set("commentatorNum",thisOne.get("num"));
        comment.set("taskID",id);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(d);
        comment.set("time",time);
        comment.save();
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_finished.jsp");
    }

    public void taskInfo_recieve_nowDoing() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        
        String publisherNum = tasks.getStr("publisherNum");
        User user = User.user.findById(publisherNum);
        String publisherName = user.getStr("name");
        
        setAttr("publisherName",publisherName);
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_nowDoing.jsp");
    }

    public void recieve_nowDoing_submit() {
    	User thisOne= getSessionAttr("User");
        Comment comment=getModel(Comment.class);
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        comment.set("commentatorNum",thisOne.get("num"));
        comment.set("taskID",id);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time = sdf.format(d);
        comment.set("time",time);
        comment.save();
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_nowDoing.jsp");
    }

    public void submitTask() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task thisTask=Task.task.findById(id);
        thisTask.set("taskState",4);
        thisTask.update();
        index();
    }
    
    public void quitTask(){
    	  String oneId=getPara("taskId");
          long id =Long.parseLong(oneId);
          Task thisTask=Task.task.findById(id);
          
          String receiverNum = thisTask.getStr("receiverNum");
          User user = User.user.findById(receiverNum);
          thisTask.set("taskState", 2);
          thisTask.set("receiverNum", null);
          thisTask.update();
          user.set("creditScore", Integer.valueOf(user.getStr("creditScore"))-5);
          user.set("giveUpTaskNum", Integer.valueOf(user.getStr("giveUpTaskNum"))+1);
          user.update();
          index();
    }
    
    public void selectReceiver(){
    	String num = getPara("num");
    	String taskID   = getPara("taskID");
    	List<Apply> applys = Apply.apply.find("SELECT * FROM apply WHERE taskID='"+taskID+"'");
        for (Apply t:applys) {
        	t.delete();
        }
    	Task task = Task.task.findById(taskID);
    	task.set("receiverNum", num);
    	task.set("taskState", "3");
    	task.update();
    	index();
    }
    
    public void ToOthers(){
    	String num = getPara("num");
    	User user = User.user.findById(num);
    	setAttr("user",user);
    	render("otherPeople.jsp");
    }
    
  
    public void LogOut(){
    	HttpSession se=getSession();
    	String sessionID=se.getId();
    	SessionListener.removeSession(sessionID);
    	se.invalidate();
    	render("/login");
    }

    public void pingjia() {
        String p=getPara("score");
        String taskId=getPara("taskId");
        Task task=Task.task.findById(taskId);
        User publisher=User.user.findById(task.get("publisherNum"));
        int pp=Integer.parseInt(p);
        int score=3;
        switch (pp) {
            case 1:score=-2;break;
            case 2:score=-1;break;
            case 3:score=0;break;
            case 4:score=1;break;
            case 5:score=2;break;
            default:
                System.out.println("wrong data");
        }
        int creditScore=publisher.get("creditScore");
        publisher.set("creditScore",creditScore+score);
        publisher.update();
    }
    
    
    
}
