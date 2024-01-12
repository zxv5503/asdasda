package com.project;

import java.util.Scanner;

public class Project1 {
	static Scanner sc = new Scanner(System.in);

	public static void disp1() {
		System.out.println("-------------------------------------");
		System.out.println("  1.로그인 | 2.회원가입 | 3.예금/출금 | 4.종료");
		System.out.println("-------------------------------------");
	}
	public static void disp2() {
		System.out.println("-------------------------------------");
		System.out.println("  1.예금 | 2.출금 | 3.잔고 | 4.상위메뉴");
		System.out.println("-------------------------------------");
	}

	public static void menu2(Session session) {
//		boolean run = true;
		while (session.isRun2()) {
			disp2();
			System.out.print("선택> ");
			int menuNum = Integer.parseInt(sc.nextLine());
			switch (menuNum) {
			case 1:
				// 로그인 처리
				System.out.println("예금 >>");
				break;
			case 2:
				// 회원 가입
				System.out.println("출금 >>");
				break;
			case 3:
				// 예금 출금
				System.out.println("잔고 >>");
				break;
			case 4:
//				session.run = false;
				session.setMenuState(MenuState.DEPOSIT_EXIT);
				System.out.println("상위 메뉴");
				
				
				break;
			}
		}
		
	}
	
	
	public static void menu1(Session session) {
//		boolean run = true;
		while (session.isRun()) {
			disp1();
			System.out.print("선택> ");
			int menuNum = Integer.parseInt(sc.nextLine());
			switch (menuNum) {
			case 1:
				// 로그인 처리
				System.out.println("로그인 처리");
				break;
			case 2:
				// 회원 가입
				System.out.println("회원 가입");
				break;
			case 3:
				// 예금 출금
				if(session.getLoginInfo()!=null) {
//					session.setRun2(true);
				session.setMenuState(MenuState.DEPOSIT);
				System.out.println("예금 출금");
				menu2(session);
				}
				break;
			case 4:
//				session.run = false;
				session.setMenuState(MenuState.TOP_EXIT);
				System.out.println("프로그램 종료");
				session.setRun(false);
				
				break;
			}
		}
		
	}

	public static void main(String[] args) {
		LoginInfo logininfo = new LoginInfo("id", "pass");
		Session session = new Session(true, false, logininfo);
		menu1(session);
		


	}
}