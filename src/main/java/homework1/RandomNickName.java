package homework1;

import java.util.Random;

// 랜덤 닉네임 제작 클래스
public class RandomNickName {
	public String makeNickName() {
		int startLimit = 48; // 0
		int endLimit = 122; // z
		int nameLength = 15;
		
		Random random = new Random();
		String name = random.ints(startLimit, endLimit+1)
				.filter(i -> (i<=57 || i>= 65) && (i<=90 || i>=97))
				.limit(nameLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				.toString();
		return name;
	}
}
