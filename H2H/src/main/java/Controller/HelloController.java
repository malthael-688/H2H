package Controller;

import Model.User;
import com.jfinal.core.Controller;

public class HelloController extends Controller {
    public void index() {
        render("index.jsp");
    }

    public void testSave() {
    	renderJson("hello world!");
       //set("name", get("name")).render("/hello/index.jsp");
    }
}
