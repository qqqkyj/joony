package day0704;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class SwingRandom_11 extends JFrame implements ActionListener{

	Container cp;
	JLabel[] lblName = new JLabel[9];//3행3열
	String[] str = {"이탈리아","인도","스웨덴","스페인","프랑스","우크라이나","한국","미국","일본"};
	JButton btn;
	
	
	public SwingRandom_11(String title) {
		super(title);//생성과 동시에 제목을 넘겨줌
		cp=this.getContentPane();
		this.setBounds(200,100,500,550);//x,y,너비,높이
		cp.setBackground(new Color(225,225,200));
		setDesign();//setDesign메소드 호출
		setVisible(true);
	}
	
	public void setDesign() {
		//패널을 프레임의 센터에 추가, 3행3열, Center에 위치
		JPanel pCenter = new JPanel(new GridLayout(3,3));
		this.add(pCenter,BorderLayout.CENTER);
		
		//라벨을 패널에 추가
		for(int i=0; i<lblName.length; i++) {
			//생성 후 str값을 동시에 넣어줌
			lblName[i]=new JLabel(str[i],JLabel.CENTER);
			int r=(int)(Math.random()*256);//0~225
			int g=(int)(Math.random()*256);//0~225
			int b=(int)(Math.random()*256);//0~225
			
			lblName[i].setBackground(new Color(r,g,b));
			
			//panel에 라벨 추가
			pCenter.add(lblName[i]);
			lblName[i].setOpaque(true);
		}
		
		//버튼
		btn = new JButton("라벨색상변경");
		this.add(btn,BorderLayout.SOUTH);//버튼을 아래쪽에 추가
		btn.addActionListener(this);
	}
	
	//액션
	@Override
	public void actionPerformed(ActionEvent e) {
				//버튼을 누를때마다 랜덤하게 색상이 변경됨
				for(int i=0; i<lblName.length; i++) {
					int r=(int)(Math.random()*256);//0~225
					int g=(int)(Math.random()*256);//0~225
					int b=(int)(Math.random()*256);//0~225
					
					lblName[i].setBackground(new Color(r,g,b));			
				}
		
	}
	
	public static void main(String[] args) {
		new SwingRandom_11("랜덤색상구하기");
		
	}


}
