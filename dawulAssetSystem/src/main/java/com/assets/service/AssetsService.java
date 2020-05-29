package com.assets.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.assets.domain.AssetsPcVO;

public interface AssetsService {
	public int getPcTotalcount(int asideCateCode) throws Exception;
	public int getPcSearchcount(int asideCateCode, String searchWord) throws Exception;
	public List<AssetsPcVO> pcListPage(int displayPost, int postNum, int asideCateCode, String searchWord) throws Exception;
	public List<AssetsPcVO> getPcMainCateData() throws Exception;
	public List<AssetsPcVO> getPcAreaCateData() throws Exception;
	public List<AssetsPcVO> getPcSubCateData() throws Exception;
	public List<AssetsPcVO> getPcDetailCount(int asideCateCode, String searchWord) throws Exception;
	public List<AssetsPcVO> getpcDetail(String pcCode, int asideCateCode) throws Exception;
	public void getPcDelete(String pcCode) throws Exception;
	public void getPcMultiDelete(String pcCode) throws Exception;
	
	public void postPcInsert(AssetsPcVO vo) throws Exception;
	public void postPcRegistInsert(AssetsPcVO vo) throws Exception;
	public List<String> getPcCodeList() throws Exception;
}
