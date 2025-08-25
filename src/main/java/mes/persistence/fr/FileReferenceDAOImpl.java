package mes.persistence.fr;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.fr.FileReferenceVo;

@Repository
public class FileReferenceDAOImpl implements FileReferenceDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.fr.fileReferenceMapper";
	
	// 목록조회
	@Override
	public List<FileReferenceVo> list(FileReferenceVo fileReferenceVo) throws Exception {
		return session.selectList(namespace+".list", fileReferenceVo);
	}
	
	// 상세조회
	@Override
	public FileReferenceVo read(FileReferenceVo fileReferenceVo) throws Exception {
		return session.selectOne(namespace+".read", fileReferenceVo);
	}
	
	// 등록
	@Override
	public String add(FileReferenceVo fileReferenceVo) throws Exception {
		session.insert(namespace + ".add", fileReferenceVo);
		String idx = fileReferenceVo.getIdx();
    	return idx;
	}
	
	// 수정
	@Override
	public void edit(FileReferenceVo fileReferenceVo) throws Exception {
		session.update(namespace+".edit", fileReferenceVo);
	}
	
	// 삭제
	@Override
	public void remove(FileReferenceVo fileReferenceVo) throws Exception {
		session.delete(namespace+".remove", fileReferenceVo);
	}
}