package validation;

import java.util.Scanner;

public class CheckPassword {
	private static String pattern;
	private static Scanner scan;
	private static String matched;
	private static boolean flag;

	public static boolean checkPassword(String password) {
		pattern = "^[0-9]{4}";
		scan = new Scanner(password);
		matched = scan.findInLine(pattern);
		if (matched == null) {
			flag = false;
		} else {
			flag = true;
		}
		return flag;
	}

}
