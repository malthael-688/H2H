package Model;

import com.jfinal.plugin.activerecord.Model;

public class Comment extends Model<Comment> {
    public static final Comment comment=new Comment().dao();
}
