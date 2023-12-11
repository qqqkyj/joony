package day0623;

public class ArrayMaxMin {

	public static void main(String[] args) {
		
		int[] data = {63,23,44,56,25,12,10,890,58,62};
		
		System.out.println("data의 길이:"+data.length);
		
		int max=data[0], min=data[0];//첫 데이터를 무조건 최대값에 저장

		//두번째 값부터 끝까지 max,min와 비교
		for(int i=1; i<data.length; i++) {
			if(max<data[i])
				max=data[i];
			
			if(min>data[i])
				min=data[i];
		}
		
		System.out.println("최대값:"+max);
		System.out.println("최소값:"+min);
	
		
	}

}
