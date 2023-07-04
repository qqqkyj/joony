package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingEvent_07 extends JFrame{

	Container cp;
	JButton btn1,btn2;
	
	public SwingEvent_07(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200,100,300,400);
		cp.setBackground(new Color(225,225,200));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		this.setLayout(new FlowLayout());
		
		//버튼1 생성 이벤트
		btn1 = new JButton("배경색을 핫핑크로 변경");//버튼 이름
		this.add(btn1);
		
		//버튼1에 액션을 줌(btn1을 누르면 핫핑크로 색 변경)
		btn1.addActionListener(new ActionListener() {
			
			@Override// implements ActionListener 대신 직접 오버라이딩
			public void actionPerformed(ActionEvent e) {
				cp.setBackground(Color.magenta);
			}
		});
		
		//버튼2 생성 이벤트
		btn2 = new JButton("배경색을 오렌지색으로 변경");//버튼 이름
		this.add(btn2);
		
		//버튼2에 액션을 줌(btn2을 누르면 오렌지색으로 색 변경)
		btn2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				cp.setBackground(Color.orange);
			}
		});
		
	}
	
	public static void main(String[] args) {
		new SwingEvent_07("스윙이벤트_7");
	}

}
