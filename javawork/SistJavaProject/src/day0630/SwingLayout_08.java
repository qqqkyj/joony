package day0630;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingLayout_08 extends JFrame{
	
	Container cp;
	//버튼
	JButton btn1;
	
	public SwingLayout_08(String title) {
		super(title);
		this.setBounds(200,100,300,500);
		cp = this.getContentPane();//자주 사용함으로 따로 빼서 사용
		cp.setBackground((new Color(225,225,100)));
		
		//버튼 생성
		btn1 = new JButton("위쪽");
		//프레임에 버튼 추가
		//프레임 기본레이아웃이 BorderLayout(동서남북, 위치지정 필수)=>this.add("위치",new JButton("버튼이름"));
		//this.add(btn1,BorderLayout.NORTH);//북쪽으로 버튼위치 설정(위쪽)
		//this.add(btn1,BorderLayout.SOUTH);//남쪽으로 버튼위치 설정(아래쪽)
		//this.add("North",btn1);//this.add(btn1,BorderLayout.NORTH);, 첫글자 대문자로
		this.add("North",btn1);
		
		//생성과 동시에 프레임추가 위치지정
		this.add("South",new JButton("아래쪽"));
		this.add("West",new JButton("왼쪽"));
		this.add("East",new JButton("오른쪽"));
		this.add("Center",new JButton("가운데"));
		
		//버튼1에 속성
		btn1.setBackground(Color.cyan);//백그라운드색 변경
		btn1.setForeground(Color.white);//글자색 변경
		
		this.setVisible(true);
	}

	public static void main(String[] args) {
		new SwingLayout_08("스윙기본");
		
	}

}
