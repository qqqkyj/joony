package spring.mvc.reboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInter {
	
	@Autowired
	SqlSession session;

	@Override
	public int getTotalCount() {
		
		return session.selectOne("getTotalCountOfReboard");
	}

	@Override
	public int getMaxNum() {
		return session.selectOne("MaxNumOfBoard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("UpdateStepOfReBoard", map);
	}

	@Override
	public void insertReboard(BoardDto dto) {
		
		int num = dto.getNum();
		int regroup = dto.getRegroup();
		int restep = dto.getRestep();
		int relevel = dto.getRelevel();
		
		//����
		if(num==0) {
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {//���
			//���� �׷��� ���޹��� restep���� ū�۵��� ��� +1
			this.updateRestep(regroup, restep);
			
			//���޹��� step�� level ��� +1
			restep++;
			relevel++;
		}
		//�ٲﰪ���� �ٽ� dto�� �ֱ�
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//insert
		session.insert("insertOfReboard", dto);
	}

	@Override
	public List<BoardDto> getPagingList(int start, int perpage) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return session.selectList("SelectPagingOfReboard", map);
	}

	@Override
	public BoardDto getBoard(String num) {
		return session.selectOne("getBoard", num);
	}

	@Override
	public void updateReadCount(String num) {
		
		session.update("updateOfReadCount", num);
	}

	@Override
	public int getCheckPass(String num, String pass) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("num", num);
		map.put("pass", pass);

		return session.selectOne("checkpassEqualOfReboard", map);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		
		session.update("updateOfReboard", dto);
	}

	@Override
	public void deleteBoard(String num) {
		
		session.delete("deleteOfReboard", num);
		
	}
	
	
	
	
}
