package data.model.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mdto")//MovieSql,xml
public class MovieDto {
	
	private String mv_num;
	private String mv_title;
	private String mv_poster;
	private String mv_director;
	private String mv_opendate;
	

}
