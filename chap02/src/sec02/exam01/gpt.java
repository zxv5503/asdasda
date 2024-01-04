package sec02.exam01;

import java.util.Scanner;

public class gpt {

	public static void main(String[] args) {
		        Scanner scanner = new Scanner(System.in);

		        while (true) {
		            int num = (int) (Math.random() * 9 + 1);
		            int num2 = (int) (Math.random() * 9 + 1);
		            System.out.println(num + " X " + num2 + " = ?");

		            int userAnswer = scanner.nextInt();
		            int correctAnswer = num * num2;

		            for(;;) {
		            if (userAnswer == correctAnswer) {
		                System.out.println("정답입니다");
		            } else {
		                System.out.println("틀렸습니다. 정답은 " + correctAnswer + "입니다.");
		                continue; // 틀렸을 경우 다시 반복
		            }

		            System.out.print("계속하시겠습니까? (Y/N): ");
		            char response = scanner.next().charAt(0);

		            if (response != 'Y' && response != 'y') {
		                break; // 'Y' 또는 'y'가 아니면 프로그램 종료
		            }
		        }

		        System.out.println("프로그램을 종료합니다.");
		        scanner.close();
		    }
		


	}


