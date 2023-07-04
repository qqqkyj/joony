package day0704;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class SwingPanel_08 extends JFrame implements ActionListener{
	
	Container cp;
	JButton[] btn = new JButton[6];//6개의 버튼을 배열형태로 생성
	String[] btnLabel = {"red","green","gray","cyan","yellow","white"};//이름
	Color[] btnColor = {Color.red, Color.green, Color.gray,Color.cyan, Color.yellow, Color.white};//색
	
	public SwingPanel_08(String title) {
		super(title);//생성과 동시에 제목을 넘겨줌
		cp=this.getContentPane();
		this.setBounds(200,100,500,400);//x,y,너비,높이
		cp.setBackground(new Color(225,225,200));
		setDesign();//setDesign메소드 호출
		setVisible(true);
	}

	public void setDesign() {
		//panel(패널) 기본이 Flowlayout
		JPanel panel = new JPanel();
		panel.setBackground(Color.orange);
		//프레임에 패널을 추가_상,하,좌,우 선택가능
		this.add(panel,BorderLayout.NORTH);//frame의 위쪽에 추가
		//this.add(panel, BorderLayout.SOUTH);//frame의 아래에 추가
		
		//버튼 생성
		for(int i=0;i<btn.length; i++) {
			btn[i]=new JButton(btnLabel[i]);//버튼이름
			//버튼색
			btn[i].setBackground(btnColor[i]);
			//패널에 버튼 추가
			panel.add(btn[i]);
			//버튼6개에 이벤트 추가
			btn[i].addActionListener(this);
		}
		
	}
	
	//액션(btn클릭시 Container의 background색이 버튼 색으로 바뀜
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob =e.getSource();
		for(int i=0;i<btn.length; i++) {
			if(ob==btn[i]) {
				//배경색 변경
				cp.setBackground(btnColor[i]);
				//제목바꾸기(cp를 제외하곤 this에서 작업)
				this.setTitle("Color: "+btnLabel[i]);
			}
		}
	}
	
	public static void main(String[] args) {
		new SwingPanel_08("스윙 배열연습");
			
	}


}
