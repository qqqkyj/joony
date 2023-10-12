package spring.mysql.carmember;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberInter {
	
	//sql session 가져오기
	@Autowired
	private SqlSession session;

	@Override
	public int getTotalCount() {
		
		return session.selectOne("getTotalCountOfCarMember");
	}
	
	//insert
	@Override
	public void insertMember(CarMemberDto dto) {
		
		session.insert("insertMember", dto);
		
	}

	//getAllMembers
	@Override
	public List<CarMemberDto> getAllMembers() {
		
		return session.selectList("getAllMembers");
		
	}

	//getMember
	@Override
	public CarMemberDto getMember(String num) {
		
		CarMemberDto dto = session.selectOne("getMember", num);
		
		return dto;
	}

	//update
	@Override
	public void updateMember(CarMemberDto dto) {
		
		session.update("updateMember", dto);
		
	}
	
	//delete
	@Override
	public void deleteMember(String num) {
		
		session.delete("deleteMember", num);
		
	}

}
