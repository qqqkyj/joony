package day0705;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class SwingJTable_02 extends JFrame{
		
		Container cp;
		JTable table;//테이블
		JLabel lblTitle;//제목
		JLabel lblOut;//출력
		
		public SwingJTable_02(String title) {
			super(title);
			cp=this.getContentPane();
			this.setBounds(200,100,400,500);
			cp.setBackground(new Color(225,225,200));
			setDesign();
			setVisible(true);
		}
		
		//디자인
		public void setDesign() {
			String[][] data = {{"김영준","서울","010-2656-1254"},
								{"최성현","경기","010-8956-5623"},
								{"장미란","인천","010-1245-2225"},
								{"박세리","제주","010-4444-5689"}};
			
			String[] title= {"이름","주소","연락처"};
			lblTitle=new JLabel("JTable연습",JLabel.CENTER);
			lblOut=new JLabel("결과출력...",JLabel.CENTER);
			
			table=new JTable(data, title);//행의 데이터와 이름
			JScrollPane pane = new JScrollPane(table);//스크롤팬위에 테이블을 올려줌
			
			//테이블에 마우스 이벤트 추가
			table.addMouseListener(new TableEvent());
			
			this.add("North",lblTitle);
			this.add("Center",pane);
			this.add("South",lblOut);
			
		}
		
		//테이블 클릭시 발생하는 마우스이벤트
		class TableEvent extends MouseAdapter{
			@Override
			public void mouseClicked(MouseEvent e) {
				super.mouseClicked(e);
				//System.out.println("테이블 클릭!!");//event가 정상적으로 실행시 console에 출력됨
				//선택한 행번호 얻기
				int rowNum = table.getSelectedRow();
				
				String str="이름: "+table.getValueAt(rowNum, 0)
							+"주소: "+table.getValueAt(rowNum, 1)
							+"연락처: "+table.getValueAt(rowNum, 2);
				
				lblOut.setText(str);
				
			}
		}
		
	public static void main(String[] args) {
		new SwingJTable_02("스윙 테이블 연습");
	}

}
