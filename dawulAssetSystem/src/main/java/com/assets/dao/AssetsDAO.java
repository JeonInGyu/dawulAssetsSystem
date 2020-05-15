package com.assets.dao;

import java.util.List;
import java.util.Map;

import com.assets.domain.AssetsPcVO;

public interface AssetsDAO {
	// 게시물 총 갯수
	public int getPcTotalcount(int asideCateCode) throws Exception;
	public List<AssetsPcVO> pcListPage(int displayPost, int postNum, int asideCateCode) throws Exception;
	public List<AssetsPcVO> getPcMainCateData() throws Exception;
	public List<AssetsPcVO> getPcAreaCateData() throws Exception;
	public List<AssetsPcVO> getPcSubCateData() throws Exception;
	public List<AssetsPcVO> getPcDetailCount(int asideCateCode, String searchWord) throws Exception;
	public List<AssetsPcVO> getpcDetail(String pcCode, int asideCateCode) throws Exception;
	
}
