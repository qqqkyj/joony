package day0703;

import java.util.HashSet;
import java.util.Set;

public class SetInt_11 {
		
	public static void main(String[] args) {
		HashSet<Integer> set1 = new HashSet<Integer>();
		
		set1.add(11);
		set1.add(51);
		set1.add(23);
		set1.add(11);
		set1.add(45);
		set1.add(8);
		
		System.out.println("set1 개수:"+set1.size());
		
		Object[] ob = set1.toArray();
		for(int i=0; i<ob.length; i++) {
			System.out.printf("%5d",ob[i]);
		}
		System.out.println();
		
	}

}
