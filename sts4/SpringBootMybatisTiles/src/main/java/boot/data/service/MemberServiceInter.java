package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {
	
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSerchId(String id);//id존재유무
	public MemberDto getData(String num);
	public void deleteMember(String num);
	public void updateMember(MemberDto dto);
	public String getName(String id);
	public int loginPassCheck(String id, String pass);
	public MemberDto getDataById(String id);
	public void updatePhoto(String num, String photo);
}
