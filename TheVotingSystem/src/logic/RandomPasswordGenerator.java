package logic;

import java.util.Random;

public class RandomPasswordGenerator {
	public static String createPassword() {
		Random random = new Random();
		
		String alphabetString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		String numberString = "0123456789";
		String specialCharString = "`~!@#$%^&*()_-+={}[]|;:',./<>?";
		
		StringBuilder builderAlphabet = new StringBuilder().append(alphabetString);
		char[] alphabet = builderAlphabet.toString().toCharArray();
		StringBuilder generatorAlphabet = new StringBuilder();
		for (int i = 0; i < 4; i++) {
			generatorAlphabet.append(alphabet[random.nextInt(alphabet.length)]);
		}
		String createdAlphabet = generatorAlphabet.toString();
		
		
		
		StringBuilder builderNumber = new StringBuilder().append(numberString);
		char[] number = builderNumber.toString().toCharArray();
		StringBuilder generatorNumber = new StringBuilder();
		for (int i = 0; i < 3; i++) {
			generatorNumber.append(number[random.nextInt(number.length)]);
		}
		String createdNumber = generatorNumber.toString();
		
		StringBuilder builderSpecialChar = new StringBuilder().append(specialCharString);
		char[] specialChar = builderSpecialChar.toString().toCharArray();
		StringBuilder generatorSpecialChar = new StringBuilder();
		for (int i = 0; i < 1; i++) {
			generatorSpecialChar.append(specialChar[random.nextInt(specialChar.length)]);
		}
		String createdSpecialChar = generatorSpecialChar.toString();
		
		
		
		
		return createdAlphabet + createdNumber + createdSpecialChar;
	}
	
	/*
	public static String createString() {
		Random random = new Random();
		
		String alphabetString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		String specialCharString = "`~!@#$%^&*()_-+={}[]|;:',./<>?";
		
		StringBuilder builder = new StringBuilder().append(alphabetString);
		
		builder.append(specialCharString);
		
		char[] alphabet = builder.toString().toCharArray();
		
		StringBuilder generator = new StringBuilder();
		for (int i = 0; i < 8; i++) {
			generator.append(alphabet[random.nextInt(alphabet.length)]);
		}
		
		return generator.toString();
		
	}
	*/
}
