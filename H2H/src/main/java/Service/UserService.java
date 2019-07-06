package Service;

import java.util.List;

import com.jfinal.aop.Enhancer;

import Model.Task;
import Model.User;

public class UserService {

	public static final UserService me= Enhancer.enhance(UserService.class);
	
	private static final User userDao = new User().dao();

	public User findById( String id){
		return userDao.findById(id);
	}
	
	public List<User> find( String sql ){
		return userDao.find(sql.toString());
	}

	//@Before(Tx.class)
	public List<User> searchByElement( String key ){
		StringBuilder sb = new StringBuilder("select * from user where num=? or phone=?");
		return userDao.find(sb.toString(), key,key);
	}
	
}
