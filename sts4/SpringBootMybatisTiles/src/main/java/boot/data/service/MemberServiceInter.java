package boot.data.service;

import java.util.List;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {
	
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSerchId(String id);//id존재유무
	public MemberDto getData(String num);
	public void deleteMember(String num);
	public void updateMember(MemberDto dto);

}
