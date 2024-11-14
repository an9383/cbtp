package mes.service.fr;

import java.util.List;

import mes.domain.fr.FileReferenceVo;

public interface FileReferenceService {

	// 목록조회
	public List<FileReferenceVo> list(FileReferenceVo fileReferenceVo) throws Exception;
	
	// 상세조회
	public FileReferenceVo read(FileReferenceVo fileReferenceVo) throws Exception;
	
	// 등록
	public String add(FileReferenceVo fileReferenceVo) throws Exception;
	
	// 수정
	public void edit(FileReferenceVo fileReferenceVo) throws Exception;
	
	// 삭제
	public void remove(FileReferenceVo fileReferenceVo) throws Exception;
}
