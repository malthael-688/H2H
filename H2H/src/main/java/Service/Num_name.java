package Service;

//为了实验新建的两个类一个用来排序日期
//一个用来 进行 userNum 和  Username 和 日期time 的对应
public class Num_name{
	String name ;
	String num;
	String time;
	
	
	public Num_name(String name, String num) {
		super();
		this.name = name;
		this.num = num;
	}
	
	
	/**
	 * @param name
	 * @param num
	 * @param time
	 */
	public Num_name(String name, String num, String time) {
		super();
		this.name = name;
		this.num = num;
		this.time = time;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	
	/**
	 * @return the time
	 */
	public String getTime() {
		return time;
	}
	/**
	 * @param time the time to set
	 */
	public void setTime(String time) {
		this.time = time;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Num_name [name=" + name + ", num=" + num + ", time=" + time + "]";
	}

	
}
