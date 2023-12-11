import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Stack;

public class Solution {
	
	    private static final int MOD = 1_000_000_000;

	    public int solution(int n, int[] orders) {
	        int answer = 0;
	        Map<Integer, Integer> bookCounts = new HashMap<>();
	        Stack<Integer> stack = new Stack<>();
	        

	        for (int order : orders) {
	            bookCounts.put(order, bookCounts.getOrDefault(order, 0) + 1);
	        }

	        for (int i = orders.length - 1; i >= 0; i--) {
	            int currentBook = orders[i];

	            while (!stack.isEmpty() && stack.peek() < currentBook) {
	                int removedBook = stack.pop();
	                bookCounts.put(removedBook, bookCounts.get(removedBook) - 1);
	                answer = (int) ((answer + removedBook) % MOD);
	            }

	            stack.push(currentBook);
	        }

	        return answer;
	    }
	    
	    public static void main(String[] args) {
	        Scanner scanner = new Scanner(System.in);

	        // n 입력 받기
	        System.out.print("Enter n: ");
	        int n = scanner.nextInt();

	        // orders 입력 받기
	        System.out.print("Enter the length of orders (2 * n): ");
	        int length = scanner.nextInt();
	        int[] orders = new int[length];
	        
	        System.out.print("Enter orders: ");
	        for (int i = 0; i < length; i++) {
	            orders[i] = scanner.nextInt();
	        }

	        Solution solution = new Solution();
	        int result = solution.solution(n, orders);
	        System.out.println("Result: " + result);

	        scanner.close();
	    }
	}
}
