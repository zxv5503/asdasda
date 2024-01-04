package sec02.exam01;

public class FloatDoubleEx {

	public static void main(String[] args) {
		float num1 = 123.394853984579938f;
		double num2 = 123.394853984579938;
		
		System.out.println("float형 변수 num1 : " + num1);
		System.out.println("double형 변수 num2 : " + num2);
			
		double var = 0.1;
		for(int i = 0; i<10; i++) {
			var += 0.1;
			double value = 2e-308;
		}
				System.out.println(var);
	}
}


