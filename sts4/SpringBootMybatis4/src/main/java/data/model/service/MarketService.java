package data.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;

@Service
public class MarketService implements MarketServiceInter {
	
	@Autowired
	MarketMapperInter mapper;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

	@Override
	public List<MarketDto> getAllSangpums() {
		// TODO Auto-generated method stub
		return mapper.getAllSangpums();
	}

	@Override
	public void insertMarket(MarketDto dto) {
		
		mapper.insertMarket(dto);
		
	}

	@Override
	public MarketDto getData(String num) {
		// TODO Auto-generated method stub
		return mapper.getData(num);
	}

	@Override
	public void updateMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapper.updateMarket(dto);
	}

	@Override
	public void deleteMarket(String num) {
		// TODO Auto-generated method stub
		mapper.deleteMarket(num);
	}

	
}
