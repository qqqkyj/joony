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
		
		//새글
		if(num==0) {
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {//댓글
			//같은 그룹중 전달받은 restep보다 큰글들은 모두 +1
			this.updateRestep(regroup, restep);
			
			//전달받은 step과 level 모두 +1
			restep++;
			relevel++;
		}
		//바뀐값들을 다시 dto에 넣기
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
	public BoardDto detailBoard(String num) {
		return session.selectOne("detailOfReboard", num);
	}
	
	
	
	
}
