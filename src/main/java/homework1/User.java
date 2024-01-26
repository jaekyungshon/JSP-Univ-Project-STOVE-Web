package homework1;

import java.io.Serializable;

public class User implements Serializable {
	private String userEmail;
	private String userPW;
	private String userNickName="";
	
	public User() {
		
	}
	
	public User(String email, String password, String nickname) {
		userEmail=email;
		userPW=password;
		userNickName=nickname;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	
	
}
