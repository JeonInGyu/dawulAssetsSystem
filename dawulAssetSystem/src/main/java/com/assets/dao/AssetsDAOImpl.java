package com.assets.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.assets.domain.AssetsPcVO;

@Service
public class AssetsDAOImpl implements AssetsDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.assets.mappers.assets";
	
	@Override
	public int getPcTotalcount(int asideCateCode) throws Exception {
		// TODO Auto-generated method stub
		
		return sql.selectOne(namespace + ".pcTotalCount", asideCateCode); 
	}

	@Override
	public List<AssetsPcVO> pcListPage(int displayPost, int postNum, int asideCateCode, String searchWord) throws Exception {
		// TODO Auto-generated method stub
		 HashMap<String, Object> data = new HashMap<String, Object>();
		  
		 data.put("displayPost", displayPost);
		 data.put("postNum", postNum);
		 data.put("asideCateCode", asideCateCode);
		 data.put("searchWord", searchWord); 
		 
		 return sql.selectList(namespace + ".pcListPage", data);
	}

	@Override
	public List<AssetsPcVO> getPcMainCateData() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".pcMainCate");
	}

	@Override
	public List<AssetsPcVO> getPcDetailCount(int asideCateCode, String searchWord) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> data = new HashMap<String, Object>();
		  
		data.put("asideCateCode", asideCateCode);
		data.put("searchWord", searchWord);
		
		return sql.selectList(namespace + ".PcDetailCount",  data);
	}

	@Override
	public List<AssetsPcVO> getpcDetail(String pcCode, int asideCateCode) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("pcCode", pcCode);
		data.put("asideCateCode", asideCateCode);
		
		return sql.selectList(namespace + ".pcDetail", data);
	}

	@Override
	public List<AssetsPcVO> getPcAreaCateData() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".pcAreaCate");
	}

	@Override
	public List<AssetsPcVO> getPcSubCateData() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".pcSubCate");
	}

	@Override
	public int getPcSearchcount(int asideCateCode, String searchWord) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> data = new HashMap<String, Object>();
		  
		 data.put("asideCateCode", asideCateCode);
		 data.put("searchWord", searchWord);
		
		return sql.selectOne(namespace + ".pcSearchCount", data); 
	}

	@Override
	public void getPcDelete(String pcCode) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".pcDelete", pcCode);
	}

	@Override
	public void postPcInsert(AssetsPcVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		sql.insert(namespace + ".pcInsert", vo);
	}

	@Override
	public List<String> getPcCodeList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".pcCodeList");
	}

	@Override
	public void postPcRegistInsert(AssetsPcVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".pcRegistInsert", vo);
	}

	@Override
	public void getPcMultiDelete(String pcCode) throws Exception {
		// TODO Auto-generated method stub
		
		sql.delete(namespace + ".pcMultiDelete", pcCode);
	}

}
