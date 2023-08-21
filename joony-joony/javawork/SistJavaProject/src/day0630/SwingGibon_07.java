package day0630;

import java.awt.Color;

import javax.swing.JFrame;

public class SwingGibon_07 extends JFrame{
	
	public SwingGibon_07(String title) {
		super(title);
		
		//시작위치, 너비, 높이, <this는 JFrame>
		this.setBounds(500, 100, 500, 500);
		//종료
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//backgroung=>Container가 있어야 실행(getContentPane()으로 실행가능)
		//this.setBackground(Color.MAGENTA);
		//this.setBackground(new Color(152,12,54));
		this.getContentPane().setBackground(new Color(152,12,54));
		//프레임 보이게
		this.setVisible(true);
		
	}
	
	

	public static void main(String[] args) {
		
		new SwingGibon_07("스윙기본");//This is Swing Title
		
	}

}
