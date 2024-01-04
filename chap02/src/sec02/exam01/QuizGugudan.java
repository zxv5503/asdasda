package sec02.exam01;

import java.util.Scanner;

public class QuizGugudan {
/*
    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            int num1 = (int) (Math.random() * 99 + 1);
            int num2 = (int) (Math.random() * 99 + 1);
            System.out.println(num1 + " X " + num2 + " = ?");

            for (int i = 0; i < 3; i++) {
                int userAnswer = scanner.nextInt();
                int correctAnswer = num1 * num2;

                if (userAnswer == correctAnswer) {
                    System.out.println("정답입니다 " + (i + 1) + "/3");
                    break; // 정답을 맞췄을 때 반복 종료
                } else {
                    System.out.println("틀렸습니다");
                    // continue; // 틀렸을 때 다음 반복으로 진행
                }
            }
        }
    }
}
*/
public static void main (String [] args) {
	int var1=10;
	int var2 = 3;
	int var3 = 14;
	String var4 = var1 *var1*var2+"."+var3;
	System.out.println("원의 넓이 :' + var4");
}