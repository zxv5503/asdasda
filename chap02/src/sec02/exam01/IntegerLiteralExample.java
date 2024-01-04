package sec02.exam01;

public class IntegerLiteralExample {

	public static void main(String[] args) {
		char var13 = '각';
		System.out.println(var13);
		char var14 = '각';
		System.out.println(var14);
		char var15='\uac00';
		System.out.println(var15);
		String str = "가";
		String str2 = "가";
		
		long var12 = 2150000000000000000L;
		long var11 = 1000000000000000000L;
		byte var1 = -128;
//		byte var1 = -129;
		byte var3 = 127;	
//		byte var4 = 128;		
		short var5 = -32768;
//		short var6 = 32768;
//		long var7 = 900000000000;
		int var8 = 2147483646;
		int var9 = 0B101010001;
		System.out.println(var9);
		int var10 = 0Xf;
		System.out.println(var10);
		
		String str3 = "가\"나\"\\다";
		float var16 = 0.25f;
		double var17 = 1.8e307;
		System.out.println(var17);
		
	}
	

}
