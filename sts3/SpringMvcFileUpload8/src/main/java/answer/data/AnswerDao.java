package answer.data;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Session;

@Repository
public class AnswerDao implements AnswerDaoInter {
	
	@Autowired
	private SqlSession session;

	@Override
	public void insertAnswer(AnswerDto dto) {
		
		session.insert("InsertOfReanswer", dto);
	}

	@Override
	public List<AnswerDto> getAnswerList(int num) {
		
		return session.selectList("SelectNumOfReanswer", num);
	}

	@Override
	public void deleteAnswer(int idx) {
		
		session.delete("DeleteIdxOfReanswer", idx);
	}


}
