package data.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.model.dto.MarketDto;

@Mapper
public interface MarketMapperInter {

	public int getTotalCount();///MarketSql.xml의 id와 일치시켜줘야됨
	
	public List<MarketDto> getAllSangpums();
	
	public void insertMarket(MarketDto dto);
	
	public MarketDto getData(String num);
	
	public void updateMarket(MarketDto dto);
	
	public void deleteMarket(String num);
}
