package com.assets.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.assets.dao.AssetsDAO;
import com.assets.domain.AssetsPcVO;

@Service
public class AssetsServiceImpl implements AssetsService {

	@Inject
	private AssetsDAO dao;
	
	@Override
	public int getPcTotalcount(int asideCateCode) throws Exception {
		// TODO Auto-generated method stub
		 return dao.getPcTotalcount(asideCateCode);
	}

	@Override
	public List<AssetsPcVO> pcListPage(int displayPost, int postNum, int asideCateCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.pcListPage(displayPost, postNum, asideCateCode);
	}

	@Override
	public List<AssetsPcVO> getPcMainCateData() throws Exception {
		// TODO Auto-generated method stub
		return dao.getPcMainCateData();
	}

	@Override
	public List<AssetsPcVO> getPcDetailCount(int asideCateCode, String searchWord) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPcDetailCount(asideCateCode, searchWord);
	}

	@Override
	public List<AssetsPcVO> getpcDetail(String pcCode, int asideCateCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.getpcDetail(pcCode, asideCateCode);
	}

	@Override
	public List<AssetsPcVO> getPcAreaCateData() throws Exception {
		// TODO Auto-generated method stub
		return dao.getPcAreaCateData();
	}

	@Override
	public List<AssetsPcVO> getPcSubCateData() throws Exception {
		// TODO Auto-generated method stub
		return dao.getPcSubCateData();
	}

}
