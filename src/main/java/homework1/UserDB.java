package homework1;

import java.util.ArrayList;

// 유저 정보를 저장하는 데이터베이스 역할 클래스
public class UserDB {
	private ArrayList<User> UserList = new ArrayList<User>();
	private static UserDB instance = new UserDB();
	
	public UserDB() {
		// 기존 유저 예제로 초기값 지정.
		UserList.add(new User("jksohn28@naver.com","scanner2023!","jaekyung"));
	}
	
	public static UserDB getInstance() {
		return instance;
	}
	
	public ArrayList<User> getAllUserList() {
		return UserList;
	}
	
	public ArrayList<String> getEmailList() {
		ArrayList<String> list = new ArrayList<String>();
		for(int i=0; i<UserList.size(); i++) {
			list.add(UserList.get(i).getUserEmail());
		}
		return list;
	}
	
	public ArrayList<String> getNickNameList() {
		ArrayList<String> list = new ArrayList<String>();
		for(int i=0; i<UserList.size(); i++) {
			list.add(UserList.get(i).getUserNickName());
		}
		return list;
	}
	
	public void addUserList(String email, String password, String nickname) {
		UserList.add(new User(email, password, nickname));
	}
	public void addUserList(User u) {
		UserList.add(u);
	}
}
