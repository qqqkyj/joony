package day0626;

public class ArrNumsChange_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] arr = {4,6,7,33,22,44,1,78,8,9};
		
		//출력
		System.out.println("원래데이터");
		
		for(int i=0; i<arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		
		//데이터 거꾸로 변경하기
		for(int i=0; i<arr.length/2; i++) {
			int temp=arr[i];
			arr[i]=arr[arr.length-1-i];//10개일때 0과9를 바꾼다, 1과8, 2와7...
			arr[arr.length-1-i]=temp;
		}
		
		System.out.println("\n순서변경 데이터");
		
		for(int i=0; i<arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		
		
		//selection sort(오름차순)
		//Arrays.sort(arr): 배열 arr을 정렬한다.
		//선택정렬: 가장작은 숫자를 앞으로 보내자
		
		//기준데이터는 0부터 끝에서 두번째까지
		for(int i=0; i<arr.length-1; i++) 
		{
			//비교하는 데이터는 기준 다음값부터 끝까지
			for(int j=i+1; j<arr.length;j++) {
				if(arr[i]>arr[j]) {//앞에가 더 크면 그때 순서를 바꿈
					int tmp=arr[i];
					arr[i]=arr[j];
					arr[j]=tmp;
				}
			}
		}
		
		System.out.println("\n오름차순 데이터");
		
		//내림차순 정렬
		
		for(int i=0; i<arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		
		for(int i=0; i<arr.length-1; i++) 
		{
			//비교하는 데이터는 기준 다음값부터 끝까지
			for(int j=i+1; j<arr.length;j++) {
				if(arr[i]<arr[j]) {//앞에가 더 작으면 그때 순서를 바꿈
					int tmp=arr[i];
					arr[i]=arr[j];
					arr[j]=tmp;
				}
			}
		}
		
		System.out.println("\n내림차순 데이터");
		
		for(int i=0; i<arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		
	}

}
