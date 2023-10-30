package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {
	
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSerchId(String id);//id존재유무
	public MemberDto getData(String num);
	public void deleteMember(String num);
	public void updateMember(MemberDto dto);
	public String getName(String id);
	public int loginPassCheck(Map<String, String> map);
	public MemberDto getDataById(String id);
	public void updatePhoto(Map<String, String> map);
}
