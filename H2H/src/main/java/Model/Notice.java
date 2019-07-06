package Model;

import com.jfinal.plugin.activerecord.Model;

public class Notice extends Model<Notice> {
    public static final Notice notice=new Notice().dao();
}
