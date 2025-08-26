package mes.service.fr;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.fr.FileReferenceVo;
import mes.persistence.fr.FileReferenceDAO;

@Service
public class FileReferenceServiceImpl implements FileReferenceService {

	@Inject
	private FileReferenceDAO dao;
	
	// 목록조회
	@Override
	public List<FileReferenceVo> list(FileReferenceVo fileReferenceVo) throws Exception {
		return dao.list(fileReferenceVo);
	}
	
	// 상세조회
	@Override
	public FileReferenceVo read(FileReferenceVo fileReferenceVo) throws Exception {
		return dao.read(fileReferenceVo);
	}
	
	// 등록
	@Override
	public String add(FileReferenceVo fileReferenceVo) throws Exception {
    	return dao.add(fileReferenceVo);
	}
	
	// 수정
	@Override
	public void edit(FileReferenceVo fileReferenceVo) throws Exception {
		dao.edit(fileReferenceVo);
	}
	
	// 삭제
	@Override
	public void remove(FileReferenceVo fileReferenceVo) throws Exception {
		dao.remove(fileReferenceVo);
	}
}
