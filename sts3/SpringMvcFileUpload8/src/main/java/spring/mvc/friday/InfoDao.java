package spring.mvc.friday;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao implements InfoInter {

	@Autowired
	SqlSession session;
	
	@Override
	public int getTotalCount() {
		
		return session.selectOne("selectTotalCountOfMyInfo");
	}

	@Override
	public void insertMyInfo(InfoDto dto) {
		
		session.insert("insertOfMyInfo", dto);
	}

	@Override
	public List<InfoDto> getAllInfos() {
		
		return session.selectList("selectAllOfMyInfo");
	}

	@Override
	public void deleteMyinfo(String num) {
		session.delete("deleteOfMyInfo", num);
	}

	@Override
	public InfoDto getData(String num) {
		
		return session.selectOne("getData", num);
	}

	@Override
	public void updateMyInfo(InfoDto dto) {
		
		session.update("updateOfMyInfo", dto);
		
	}

}
