package boot.data.service;

import java.util.HashMap;
import java.util.List;

import boot.data.dto.MemBoardDto;

public interface MemBoardServiceInter {
	
	public int getTotalCount();
	public void updateReadCount(String num);
	public void insertBoard(MemBoardDto dto);
	public MemBoardDto getData(String num);
	public int getMaxNum();//insert시 auto_increment라서 필요
	public List<MemBoardDto> getList(int start, int perpage);

}
