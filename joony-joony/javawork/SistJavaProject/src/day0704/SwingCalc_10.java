package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class SwingCalc_10 extends JFrame{
	
	Container cp;
	JLabel lblResult,lbl1,lbl2;//결과 나오는 곳, 숫자1이름, 숫자2이름
	JTextField tfSu1, tfSu2;//입력하는 곳
	JButton btnAdd;//이벤트 발생 버튼
	
	public SwingCalc_10(String title) {
		super(title);//생성과 동시에 제목을 넘겨줌
		cp=this.getContentPane();
		this.setBounds(200,100,300,500);//x,y,너비,높이
		cp.setBackground(new Color(225,225,200));
		setDesign();//setDesign메소드 호출
		setVisible(true);
	}
	
	public void setDesign() {
		this.setLayout(null);
		
		lbl1=new JLabel("숫자1");
		lbl2=new JLabel("숫자2");
		
		//text 위치정하기
		lbl1.setBounds(20, 20, 50, 30);
		this.add(lbl1);
		lbl2.setBounds(20, 60, 50, 30);
		this.add(lbl2);
		
		tfSu1=new JTextField();
		tfSu1.setBounds(70, 20, 100, 30);
		this.add(tfSu1);
		tfSu2=new JTextField();
		tfSu2.setBounds(70, 60, 100, 30);
		this.add(tfSu2);
		
		btnAdd= new JButton("숫자 더하기");
		btnAdd.setBounds(30, 120, 150, 50);
		this.add(btnAdd);
		
		lblResult=new JLabel("");//"결과 나오는 곳"
		lblResult.setBounds(10, 180, 250, 60);
		this.add(lblResult);
		
		//버튼 이벤트인데 익명내부 클래스 형식으로 만들기
		btnAdd.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
				String su1 = tfSu1.getText();//첫번째 text의 문자값을 받아와 형변환
				String su2 = tfSu2.getText();//두번째 text의 문자값을 받아와 형변환
				
				int sum = Integer.parseInt(su1)+Integer.parseInt(su2);
				lblResult.setText(su1+"+"+su2+"="+sum);//연산 후 lblResult에 결과값을 반환, String.ValueOf(int)
				
			}
		});
		
	}

	
	public static void main(String[] args) {
		new SwingCalc_10("스윙 간단계산 연습");
	}

}
