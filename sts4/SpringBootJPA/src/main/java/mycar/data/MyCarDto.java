package mycar.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Table(name = "mycar")//자동으로 mycar라는 테이블이 mysql에 만들어 진다
@Data
public class MyCarDto {
	
	@Id//각 entity를 구별할 수 있는 식별아이디(시퀀스 느낌으로 쓰이고 중요한 역할로 사용됨)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;
	
	@Column//(name="carname"), 이름같으면 생략가능
	private String carname;
	
	@Column
	private int carprice;
	
	@Column
	private String carcolor;
	
	@Column
	private String carguip;
	
	@CreationTimestamp//엔티티 생성시점에 시간이 자동등록
	@Column(updatable = false)//수정시 이 컬럼은 수정하지 않음
	//updatable = false 없으면 날짜가 null로 찍힐것
	private Timestamp guipday;
	
	

}
