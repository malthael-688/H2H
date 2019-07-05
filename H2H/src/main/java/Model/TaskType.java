package Model;

import com.jfinal.plugin.activerecord.Model;

public class TaskType extends Model<TaskType> {
    public static final TaskType taskType=new TaskType().dao();
}
