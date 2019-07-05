package Model;

import com.jfinal.plugin.activerecord.Model;

public class User extends Model<User> {
    public static final User user=new User().dao();
}
