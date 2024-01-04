package sec02.exam01;

public class LottoEx {

	public static void main(String[] args) {
//		System.out.println(Math.PI);
		//난수 발생 1번
		for(int i=0; i<6; i++) {
			int num = (int) (Math.random()*45 + 1);
		
			System.out.println(num); //난수발생
		

	}
//난수 발생 2번
		{
		Random rd = new Random();
		for (int i=0; i<6, i++) {
			System.out.println(rd.nextInt(45)+1);
		}
		
		
	}
}
