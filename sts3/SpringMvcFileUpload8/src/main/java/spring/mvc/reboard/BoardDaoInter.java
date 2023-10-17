package spring.mvc.reboard;

import java.util.List;

public interface BoardDaoInter {

	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup, int restep);
	public void insertReboard(BoardDto dto);
	public List<BoardDto> getPagingList(int start, int perpage);
	public BoardDto getBoard(String num);
	public void updateReadCount(String num);
	public int getCheckPass(String num, String pass);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(String num);
}
