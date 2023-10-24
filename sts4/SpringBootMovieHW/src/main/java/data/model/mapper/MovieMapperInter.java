package data.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.model.dto.MovieDto;

@Mapper
public interface MovieMapperInter {
	
	public int getTotalCount();
	
	public List<MovieDto> getAllDatas();
	
	public MovieDto getData(String num);
	
	public void insertMovie(MovieDto dto);

}
