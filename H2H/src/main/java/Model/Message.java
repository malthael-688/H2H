package Model;

import com.jfinal.plugin.activerecord.Model;

public class Message extends Model<Message> {
    public static final Message message=new Message().dao();
}
