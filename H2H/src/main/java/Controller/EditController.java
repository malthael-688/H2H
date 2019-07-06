package Controller;

import Model.Apply;
import Model.Task;
import Model.User;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.List;

public class EditController extends Controller {
    public static User thisOne=new User();
    public void index() {
        thisOne=User.user.findById(1);
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
        List<Task> tasks=Task.task.find("SELECT * FROM task WHERE taskState='0' AND receiverNum='"+thisNum+"'");
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
        List<Apply> applys= Apply.apply.findAll();
        List<User> users=new ArrayList<User>();
        for (Apply t:applys) {
            Task oneTask=Task.task.findById(t.get("taskID"));
            if (tasks.contains(oneTask)) {
                users.add(User.user.findById(t.get("applicantNum")));
            }
        }
        setAttr("tasks",tasks);
        setAttr("applyList1",users);
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
        setAttr("tasks",tasks);
        renderJsp("personalTask_publish_unaccept.jsp");
    }
}
