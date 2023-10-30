package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {
	
	
	@Autowired
	MemberMapperInter mapperInter;

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertMember(dto);
		
	}

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return mapperInter.getAllMembers();
	}

	@Override
	//아이디 존재유무
	public int getSerchId(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getSerchId(id);
	}
	
	public boolean checkAdmin(String id) {
		
		boolean flag = false;
		
		if(id.equals("admin")) {
			flag=true;
		}
		
		return flag;
	}

	@Override
	public MemberDto getData(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public void deleteMember(String num) {
		// TODO Auto-generated method stub
		mapperInter.deleteMember(num);
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateMember(dto);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getName(id);
	}

	@Override
	public int loginPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		
		return mapperInter.loginPassCheck(map);
	}

	@Override
	public MemberDto getDataById(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getDataById(id);
	}

	@Override
	public void updatePhoto(String num, String photo) {
		
		Map<String, String> map = new HashMap<>();
		map.put("num", num);
		map.put("photo", photo);
		
		mapperInter.updatePhoto(map);
	}



	


}
