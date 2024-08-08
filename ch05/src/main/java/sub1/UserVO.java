package sub1;

public class UserVO {
	private String uid;
	private String pass;
	private String name;
	private String hp;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", pass=" + pass + ", name=" + name + ", hp=" + hp + "]";
	}
	
	
}
