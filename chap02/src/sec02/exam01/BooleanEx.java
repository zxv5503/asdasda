package sec02.exam01;

public class BooleanEx {

	public static void main(String[] args) {
		
		string str = "1a";
		int value = Integer.parseInt(str);
		
		float result3 = (float) (1.5+2.5);
		
		byte x = 10;
		byte y = 20;
		byte result = (byte) (x+y);
		System.out.println(result);
		
		byte result2 = 10 + 20;
		System.out.println(result2);
		
		
		
		
		boolean stop = false;
		if(stop) {
			System.out.println("멈춥");
		}else {
			System.out.println("rrr");
		}
		
		
		boolean start = true;
		
		if(start) {
			System.out.println("중\t지");
		}else {
			System.out.println("시\t작");
		}

	}

}
