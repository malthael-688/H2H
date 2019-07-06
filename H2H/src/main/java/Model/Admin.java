package Model;

import com.jfinal.plugin.activerecord.Model;

public class Admin extends Model<Admin> {
    public static final Admin admin=new Admin().dao();
}
