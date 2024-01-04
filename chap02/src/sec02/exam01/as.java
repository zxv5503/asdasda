package sec02.exam01;

import java.util.Scanner;

public class as {

	public static void main(String[] args) {

	}

	public static void main1(String[] args) {
		try (Scanner scanner = new Scanner(System.in)) {
			int num = (int) (Math.random() * 99 + 1);

			int num2 = (int) (Math.random() * 99 + 1);
			System.out.println(num + "X" + num2 + "= ?");

			for (int i=0; i<3; i++) {
				int userAnswer = scanner.nextInt();
				int correctAnswer = num * num2;

				if (userAnswer == correctAnswer) {
					
					System.out.println("정답입니다1/3");
					
				break;
						}
					

		else {
						System.out.println("틀렸습니다");
						continue;
					}
				}
			}

}
}
