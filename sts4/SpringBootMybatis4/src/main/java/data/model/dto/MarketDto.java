package data.model.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mdto")//mybatis는 type으로 가져오기 때문에 
public class MarketDto {
	
	private String num;
	private int price;
	private String sang;
	private String photoname;
	private Timestamp ipgoday;

}
