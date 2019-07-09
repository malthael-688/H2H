package Service;

import java.util.List;

import com.jfinal.aop.Enhancer;

import Model.Message;

public class MessageService {
public static final MessageService me= Enhancer.enhance(MessageService.class);
	
	private static final Message userDao = new Message().dao();
	
	public List<Message> find( String sql ){
		return userDao.find(sql.toString());
	}
}
