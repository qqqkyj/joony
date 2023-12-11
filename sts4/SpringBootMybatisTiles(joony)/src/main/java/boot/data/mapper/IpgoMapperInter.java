package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.IpgoDto;

@Mapper
public interface IpgoMapperInter {
	
	//sql의 id
	public int getTotalCount();
	
	public void insertIpgo(IpgoDto dto);
	
	public List<IpgoDto> getAllIpgos();
	

}
