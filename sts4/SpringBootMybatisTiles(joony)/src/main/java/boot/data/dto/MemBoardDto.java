package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("memboard")
public class MemBoardDto {

	private String num;  
	private String myid;
	private String name;
	private String subject;
	private String content; 
	private String uploadfile;//db에 들어가는 이름
	private MultipartFile upload;//form의 name과 일치
	private int readcount;
	private Timestamp writeday;
}
