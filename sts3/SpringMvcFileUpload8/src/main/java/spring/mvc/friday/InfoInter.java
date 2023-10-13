package spring.mvc.friday;

import java.util.List;

public interface InfoInter {
	
	public int getTotalCount();
	
	public void insertMyInfo(InfoDto dto);
	
	public List<InfoDto> getAllInfos();
	
	public void deleteMyinfo(String num);
	
	public InfoDto getData(String num);
	
	public void updateMyInfo(InfoDto dto);
}
