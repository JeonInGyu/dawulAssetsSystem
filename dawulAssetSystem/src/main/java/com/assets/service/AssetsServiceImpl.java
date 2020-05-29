package com.assets.service;

import java.util.ArrayList;
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
	public List<AssetsPcVO> pcListPage(int displayPost, int postNum, int asideCateCode, String searchWord) throws Exception {
		// TODO Auto-generated method stub
		return dao.pcListPage(displayPost, postNum, asideCateCode, searchWord);
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

	@Override
	public int getPcSearchcount(int asideCateCode, String searchWord) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPcSearchcount(asideCateCode, searchWord);
	}

	@Override
	public void getPcDelete(String pcCode) throws Exception {
		// TODO Auto-generated method stub
		dao.getPcDelete(pcCode);
	}

	@Override
	public void postPcInsert(AssetsPcVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.postPcInsert(vo);
	}

	@Override
	public List<String> getPcCodeList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getPcCodeList();
	}

	@Override
	public void postPcRegistInsert(AssetsPcVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.postPcRegistInsert(vo);
	}

	@Override
	public void getPcMultiDelete(String pcCode) throws Exception {
		// TODO Auto-generated method stub
		dao.getPcMultiDelete(pcCode);
	}

}
