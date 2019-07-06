package Model;

import com.jfinal.plugin.activerecord.Model;

public class Task extends Model<Task> {
    public static final Task task=new Task().dao();
}
