package day0629;
/*
 **tv시청목록**
 
 채널:ebs시청
 볼륨:15
 
 --------------
 채널:tbn
 볼륨:22
 */
class MyTv{
	private String che; //채널
	private String vol; //볼륨
	
	//제목
	public static void title() {
		System.out.println(" **tv시청목록**\n");
	}
	
	//디폴트 생성자
	public MyTv() {
	
	}
	
	//명시적 생성자
	public MyTv(String che, String vol) {
		this.che = che;
		this.vol =vol;
	}
	
	public String getChe() {
		return che;
	}
	public void setChe(String che) {
		this.che = che;
	}
	public String getVol() {
		return vol;
	}
	public void setVol(String vol) {
		this.vol = vol;
	}
	
	
}

public class ReviewObject_01 {
	
	public static void getTv(MyTv tv) {
		
		System.out.println(tv.getChe()+"채널을 시청합니다.");
		System.out.println("볼륨은 "+tv.getVol()+"데시벨 입니다.");
	}
	
	public static void getTv(MyTv[] tv2) {//배열형태의 클래스를 인자값(파라메터값)으로 받아와 사용할 수 있음
		
		MyTv.title();
		
		for(MyTv mytv: tv2) {
			System.out.println("채널:"+mytv.getChe());
			System.out.println("볼륨:"+mytv.getVol());
			System.out.println("-----------------");
		}
	}

	public static void main(String[] args) {
		
		//setter와 getter를 이용한 방법
		MyTv[] tv = new MyTv[2];
		
		for(int i=0; i<tv.length; i++) {
			tv[i] = new MyTv();
		}
		
		tv[0].setChe("ebs");
		tv[0].setVol("15");
		
		tv[1].setChe("tvn");
		tv[1].setVol("18");
		
		MyTv.title();
		
		for(int i=0; i<tv.length; i++) {
			getTv(tv[i]);
			System.out.println("----------------");
		}
		
		//명시적 생성자를 이용한 방법
		MyTv[] tv2 = new MyTv[2];
		
		tv2[0] = new MyTv("ebs","15");
		tv2[1] = new MyTv("tvn","18");
		
		getTv(tv2);
		
	
		
		
	}

}
