package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingGrid_06 extends JFrame implements ActionListener{
	
	Container cp;
	//이미지 아이콘, 이미지가 저장돼 있는 파일의 경로
	ImageIcon icon1 = new ImageIcon("C:\\file\\logoImg\\a.png");
	ImageIcon icon2 = new ImageIcon("C:\\file\\logoImg\\a01.png");
	ImageIcon icon3 = new ImageIcon("C:\\file\\logoImg\\a02.png");
	ImageIcon icon4 = new ImageIcon("C:\\file\\logoImg\\a03.png");
	
	//버튼 선언
	JButton btn1, btn2, btn3, btn4;
	
	
	public SwingGrid_06(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200,100,300,400);
		cp.setBackground(new Color(225,225,200));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		//버튼4개 생성
		this.setLayout(new GridLayout(2, 2));//버튼을 2행2열로 배치
		btn1 = new JButton("hello", icon1);
		btn1.setVerticalTextPosition(JButton.BOTTOM);//텍스트 세로위치
		btn1.setHorizontalTextPosition(JButton.CENTER);//텍스트 가로위치
		this.add(btn1);
		
		btn1.setRolloverIcon(icon2);//마우스 올렸을 때 icon2으로 변경
		btn1.setPressedIcon(icon3);//클릭시 아이콘 icon3으로 변경
		
		//2
		btn2 = new JButton(icon4);
		this.add(btn2);
		
		//3
		btn3 = new JButton("JAVA");
		this.add(btn3);
		
		//4
		btn4 = new JButton("hi",icon2);
		this.add(btn4);
		
		//버튼에 액션이벤트 추가, actionPerformed메서드가 실행
		btn1.addActionListener(this);
		btn2.addActionListener(this);
		btn3.addActionListener(this);
		btn4.addActionListener(this);
		
	}
	
	//액션
	@Override
	public void actionPerformed(ActionEvent e) {//implements ActionListener
		
		Object ob = e.getSource();//Object, 명확하게 객체를 지정
		
		//메세지를 다이얼로그 형태로 보여주기
		//JOptionPane.showMessageDialog(this, "버튼클릭");
		
		if(ob==btn1)//버튼 클릭시 알림 메시지가 뜸
			JOptionPane.showMessageDialog(this, "1번 버튼입니다.");
		else if(ob==btn2)
			JOptionPane.showMessageDialog(this, "2번 버튼입니다");
		else if(ob==btn3)
			JOptionPane.showMessageDialog(this, "3번 버튼입니다");
		else if(ob==btn4)
			JOptionPane.showMessageDialog(this, "4번 버튼입니다.");
		
		
	}
	
	
	
	public static void main(String[] args) {
		new SwingGrid_06("그리드 레이아웃");
		
	}

}
