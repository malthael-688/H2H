package Controller;

import Model.Apply;
import Model.Comment;
import Model.Task;
import Model.User;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;

public class EditController extends Controller {
    public static User thisOne;
    public void index() {
    	thisOne= getSessionAttr("User");
        setAttr("user",thisOne);
        renderJsp("edit_Personal_Information.jsp");
    }

    public void changeName() {
        String newName=getPara("name");
        thisOne.set("name",newName);
        thisOne.update();
        renderJsp("edit_Personal_Information.jsp");
    }

    public void changeMail() {
        String newMail=getPara("mail");
        thisOne.set("email",newMail);
        thisOne.update();
        renderJsp("edit_Personal_Information.jsp");
    }

    public void changePhone() {
        String newPhone=getPara("phone");
        thisOne.set("phone",newPhone);
        thisOne.update();
        renderJsp("edit_Personal_Information.jsp");
    }

    public void changePassword() {
        String password=getPara("password");
        thisOne.set("password",password);
        thisOne.update();
        renderJsp("edit_Personal_Information.jsp");
    }

    public void recieve_finished_page() {
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='5' AND receiverNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_recieve_finished.jsp");
    }

    public void recieve_applying_page() {
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='2'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_recieve_applying.jsp");
    }

    public void recieve_nowDoing_page() {
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='3' AND receiverNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_recieve_nowDoing.jsp");
    }

    public void publish_examine_page() {
        long thisNum=thisOne.get("num");
        List<Task> tasks= Task.task.find("SELECT * FROM task WHERE taskState='0' AND publisherNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_publish_examine.jsp");
    }

    public void publish_finished_page() {
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='5' AND publisherNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_publish_finished.jsp");
    }

    public void publish_nowDoing_page() {
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='3' AND publisherNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTask_publish_nowDoing.jsp");
    }

    public void publish_unaccept_page() {
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='1' AND publisherNum='"+thisNum+"'");
        List<Apply> applys= Apply.apply.findAll();
        List<User> users=new ArrayList<User>();
        for (Apply t:applys) {
            Task oneTask=Task.task.findById(t.get("taskID"));
            if (tasks.contains(oneTask)) {
                users.add(User.user.findById(t.get("applicantNum")));
            }
        }
        setAttr("applyList1",users);
        setAttr("tasks",tasks);
        renderJsp("personalTask_publish_unaccept.jsp");
    }

    public void personalTasks_page() {
        long thisNum=thisOne.get("num");
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE publisherNum='"+thisNum+"' OR receiverNum='"+thisNum+"'");
        setAttr("tasks",tasks);
        renderJsp("personalTasks1.jsp");
    }

    public void test_page() {
        setAttr("user",thisOne);
        renderJsp("test.jsp");
    }

    public void  taskInfo_publish_examine () {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_publish_examine.jsp");
    }
    public void publish_examine_submit() {
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
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_publish_finished.jsp");
    }

    public void publish_finished_submit() {
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
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_publish_nowDoing.jsp");
    }

    public void publish_nowDoing_submit() {
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
        setAttr("task",thisTask);
        renderJsp("taskInfo_publish_examine.jsp");
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
        setAttr("applyList1",users);
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_publish_unStart.jsp");
    }

    public void publish_unStart_submit() {
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
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_applying.jsp");
    }

    public void recieve_applying_submit() {
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

    public void taskInfo_recieve_finished() {
        String oneId=getPara("taskId");
        long id =Long.parseLong(oneId);
        Task tasks=Task.task.findById(id);
        List<Comment> comments=Comment.comment.find("SELECT * FROM comment WHERE taskID='"+id+"'");
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_finished.jsp");
    }

    public void recieve_finished_submit() {
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
        setAttr("comments",comments);
        setAttr("task",tasks);
        renderJsp("taskInfo_recieve_nowDoing.jsp");
    }

    public void recieve_nowDoing_submit() {
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
}
