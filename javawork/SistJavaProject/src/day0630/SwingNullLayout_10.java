package day0630;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingNullLayout_10 extends JFrame implements ActionListener{
		
		Container cp;
		//버튼
		JButton btn1,btn2;
		
		public SwingNullLayout_10(String title) {
			super(title);
			cp=this.getContentPane();
			this.setBounds(200,100,300,400);
			cp.setBackground(new Color(225,225,200));
			setDesign();
			setVisible(true);
		}
		
		//디자인
		public void setDesign() {
			//기본레이아웃 없애기
			this.setLayout(null);
			
			btn1= new JButton("◀");
			btn2= new JButton("▶");
			
			//위치 직접 지정
			btn1.setBounds(50, 100, 80, 30);
			btn2.setBounds(150, 100, 80, 30);
			
			//프레임에 올리기
			this.add(btn1);
			this.add(btn2);
			
			//색상, 버튼 속성
			btn1.setBackground(Color.red);
			btn2.setBackground(Color.blue);
			btn1.setForeground(Color.white);
			btn2.setForeground(Color.white);
			
			//이벤트 핸들러랑 이벤트 발생객체 연결
			btn1.addActionListener(this);
			btn2.addActionListener(this);
					
	}
		
		
	@Override
	public void actionPerformed(ActionEvent e) {
			Object ob = e.getSource();
			
			if(ob==btn1)
				JOptionPane.showMessageDialog(this, "왼쪽으로 이동");
			else if(ob==btn2)
				JOptionPane.showMessageDialog(this, "오른쪽으로 이동");
	}
	
	
	public static void main(String[] args) {
		new SwingNullLayout_10("레이아웃 없이 만들기");
	}

	

}
