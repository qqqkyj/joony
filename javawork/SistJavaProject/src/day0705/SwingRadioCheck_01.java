package day0705;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class SwingRadioCheck_01 extends JFrame implements ActionListener{

	Container cp;
	JRadioButton[] rb = new JRadioButton[4];//하나만 선택가능
	JCheckBox[] cb = new JCheckBox[4];//다중 선택가능
	JLabel lblMessage;//라디오버튼, 체크박스 결과값 출력 장소
	JPanel pTop,pBottom;//라디오버튼, 체크박스 올릴 패널
	Color[] colors = {Color.red,Color.pink, Color.blue,Color.green};//색
	
	
	public SwingRadioCheck_01(String title) {
		super(title);//생성과 동시에 제목을 넘겨줌
		cp=this.getContentPane();
		this.setBounds(200,100,550,800);//x,y,너비,높이
		cp.setBackground(new Color(225,225,200));
		setDesign();//setDesign메소드 호출
		setVisible(true);
	}
	
	//디자인
	public void setDesign() {
		//상단패널에 보더로 감싼 4개의 radio버튼 만들기
		String[] str1= {"빨강","핑크","파랑","초록"};
		pTop=new JPanel();
		pTop.setBorder(new TitledBorder("글자색"));
		this.add("North",pTop);//위쪽에 pTop을 올림
		
		//radio버튼 하나만 선택되도록 그룹을 지어줌
		ButtonGroup bg = new ButtonGroup();
		for(int i=0; i<rb.length; i++) {
			//라디오버튼 생성(default로 str1[1]이 선택되어있음)
			//초기값을 설정하지 않으면 null값이 들어갈 수 있기에 설정 필요
			rb[i]=new JRadioButton(str1[i],i==1?true:false);
			rb[i].addActionListener(this);//라디오버튼에 액션추가
			pTop.add(rb[i]);//4개의 라디오버튼은 각각 pTop에 추가
			bg.add(rb[i]);//버튼 그룹에 add를 해줘야 다중선택을 막을 수 있음
		}
		
		ImageIcon icon = new ImageIcon("C:\\Users\\user\\Desktop\\Joony\\짱구1.png");
		lblMessage = new JLabel("Have a Nice Day!!!",icon,JLabel.CENTER);
		lblMessage.setHorizontalTextPosition(JLabel.LEFT);//가로 왼쪽
		lblMessage.setBorder(new LineBorder(Color.magenta,2));//보더라인 굵기
		this.add("Center",lblMessage);
		
		//하단패널에 보더로 감싼 4개의 checkbox버튼 만들기
		pBottom= new JPanel();
		pBottom.setBorder(new TitledBorder("가능언어"));
		this.add("South",pBottom);
		
		String[] str2 = {"JAVA","C","JSP","MYSQL"};
		//체크박스 생성(default로 str2[1]과 str2[3]이 선택되어있음)
		//초기값을 설정하지 않으면 null값이 들어갈 수 있기에 설정 필요
		for(int i=0; i<cb.length; i++) {
			cb[i]=new JCheckBox(str2[i],i==0||i==3?true:false);
			cb[i].addActionListener(this);//체크박스에 액션추가
			pBottom.add(cb[i]);//4개의 체크박스를 각각 pBottom에 추가
		}
		
	}
	
	//액션
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();
		
		//라디오버튼 호출처리, 메세지를 컬러별로 출력
		for(int i=0; i<rb.length; i++) {
			if(ob==rb[i]) {
				lblMessage.setForeground(colors[i]);
				lblMessage.setFont(new Font("",Font.BOLD,15));
			}
		}
		
		//체크박스 호출처리..선택한 체크를 라벨메세지별 출력
		String lang="나의 가능언어는 ";
		for(int i=0; i<cb.length; i++) {
			if(cb[i].isSelected()) {//boolean으로 값을 반환해줘야 됨
				lang+=cb[i].getText()+" ";//누적해서 체크박스의 메시지를 출력함
			}
		}
		lblMessage.setText(lang);
		
		//클래스 타입 비교(체크박스와 라디오버튼을 구별해서 액션하도록 클래스 타입 비교)
		//자주 사용하진 않음
		if(ob instanceof JCheckBox)
			lblMessage.setText(lang);
		else if(ob instanceof JRadioButton)
			lblMessage.setText("Have a Nice Day!");
			
		
	}
	
	
	public static void main(String[] args) {
		
		new SwingRadioCheck_01("라디오 체크 연습");
	}


}
