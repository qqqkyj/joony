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

public class SwingCalculater extends JFrame implements ActionListener{

	Container cp;
	JLabel lblResult,lbl1,lbl2;//결과 나오는 곳, 숫자1이름, 숫자2이름
	JTextField tfSu1, tfSu2;//입력하는 곳
	JButton btnAdd,btnMinus,btnMulti,btnDiv;//이벤트 발생 버튼
	
	public SwingCalculater(String title) {
		super(title);//생성과 동시에 제목을 넘겨줌
		cp=this.getContentPane();
		this.setBounds(200,100,300,550);//x,y,너비,높이
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
		
		btnAdd= new JButton("+");
		btnAdd.setBounds(30, 120, 50, 50);
		this.add(btnAdd);
		
		btnMinus= new JButton("-");
		btnMinus.setBounds(80, 120, 50, 50);
		this.add(btnMinus);
		
		btnMulti= new JButton("X");
		btnMulti.setBounds(130, 120, 50, 50);
		this.add(btnMulti);
		
		btnDiv= new JButton("/");
		btnDiv.setBounds(180, 120, 50, 50);
		this.add(btnDiv);
		
		lblResult=new JLabel("결과 나오는 곳");//"결과 나오는 곳"
		lblResult.setBounds(10, 180, 250, 60);
		this.add(lblResult);
		
		btnAdd.addActionListener(this);
		btnMinus.addActionListener(this);
		btnMulti.addActionListener(this);
		btnDiv.addActionListener(this);
	}
	
	//액션
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();
		
		String su1 = tfSu1.getText();//첫번째 text의 문자값을 받아와 형변환
		String su2 = tfSu2.getText();//두번째 text의 문자값을 받아와 형변환
		int sum;
		
		if(ob==btnAdd) {
			sum=Integer.parseInt(su1)+Integer.parseInt(su2);
			lblResult.setText(su1+"+"+su2+"="+sum);
		}
		else if(ob==btnMinus) {
			sum=Integer.parseInt(su1)-Integer.parseInt(su2);
			lblResult.setText(su1+"-"+su2+"="+sum);
		}
		else if(ob==btnMulti) {
			sum=Integer.parseInt(su1)*Integer.parseInt(su2);
			lblResult.setText(su1+"X"+su2+"="+sum);
		}
		else if(ob==btnDiv) {
			double sum2=Integer.parseInt(su1)/Integer.parseInt(su2);
			lblResult.setText(su1+"/"+su2+"="+sum2);
		}
			
	}
	
	public static void main(String[] args) {
		new SwingCalculater("계산기");
	}

}
