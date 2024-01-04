package sec02.exam01;

public class P86_4 {

	public static void main(String[] args)throws Exception {
	
	int keyCode;
		
		while(true) {
			keyCode = System.in.read();
			System.out.println("key code"+ keyCode);
			if(keyCode == 113) {
				break;
			}
		}
		System.out.println("종료");
			
		}
}
		
		
		/*
		int keyCode;
		
		keyCode = System.in.read();
		System.out.println("keyCode"+keyCode);
	}
}
		
		/*
		double var1 = 3.5;
		double var2 = 2.7;
		int result = (int) (var1+var2);
	System.out.println(result);
	}
}

		
		/*
		int x = 5;
		int y = 2;
		double result = (double)x/y;
		System.out.println(result);
	}
}
		
		short s1 = 1;
		short s2 = 2;
		int i1 = 3;
		int i2 = 4;
		short result = s1+s2;
		int result2 = i1+i2;

	}

}
*/