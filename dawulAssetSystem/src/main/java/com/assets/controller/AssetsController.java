package com.assets.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assets.domain.AssetsPcVO;
import com.assets.domain.LoginVO;
import com.assets.service.AssetsService;
import com.assets.service.LoginService;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
@RequestMapping(value = {"/assets/*","/login/*"})
public class AssetsController {
	
	 @Inject
	 private LoginService loginServce;
	 @Inject
	 private AssetsService assetsService;
	 
	 // 로그인
	 @RequestMapping(value = "/main", method = RequestMethod.POST)
	 public String login(LoginVO vo, Model model, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession(); 
		 
		LoginVO login = loginServce.login(vo);
		
		session.setMaxInactiveInterval(0);
		
		if(login == null) {
			session.setAttribute("msg", 1);
			  
			return "/assets/popup";
		 } else {
			session.setAttribute("admin", login);
			  
			model.addAttribute("authorityCode", login.getAuthority_Code());
			return "/assets/main";
		 }
	 }
	 
	 // 로그아웃
	 @RequestMapping(value = "/logout", method = RequestMethod.GET)
	 public String logout(HttpSession session) throws Exception {
		  session.invalidate();
		    
		  return "/";
	 }
	 
	 // PC 리스트
	 @RequestMapping(value = "/pcInsertList", method = RequestMethod.GET)
	 public String getPcInsertList(Model model) throws Exception {
		 /** 메인 카테고리 정보(업무용, 보조용...)  **/
		 List<AssetsPcVO> pcMainCateList = assetsService.getPcMainCateData();
		 model.addAttribute("pcMainCateList", pcMainCateList);
		 /** // 메인 카테고리 정보 **/
		 
		 /** 군 정보(업무망, 서비스망, 백업망)  **/
		 List<AssetsPcVO> pcAreaCateList = assetsService.getPcAreaCateData();
		 model.addAttribute("pcAreaCateList", pcAreaCateList);
		 /** // 군 정보 **/
		 
		 /** 종류 정보(데스크탑, 노트북...)  **/
		 List<AssetsPcVO> pcSubCateList = assetsService.getPcSubCateData();
		 model.addAttribute("pcSubCateList", pcSubCateList);
		 /** // 종류 정보 **/ 
		 
		return "/assets/authAssets/assetsPc/pcInsert";
	 }
	 
	// PC 리스트
	 @RequestMapping(value = "/pcInsertList", method = RequestMethod.POST)
	 public String postPcInsert(Model model, AssetsPcVO vo) throws Exception {
		 List<String> pcCodeList = assetsService.getPcCodeList();
		 
		 boolean dFlag = false;
         String emptyCode = "";
         for(int i = 6001; i < 6999; i++){
        	 for(int j = 0; j < pcCodeList.size(); j++){
        		 String eCode = pcCodeList.get(j);
        		 String ii = Integer.toString(i);
        		 if(eCode.equals(ii)){
        			 dFlag = true;
        		 }
        	 }
        	 if(dFlag == false){
        		 String ii = Integer.toString(i);
        		 emptyCode = ii;
        		 break;
        	 }else{
        		 dFlag = false;
        	 }
         }
		vo.setPc_code(emptyCode);
		vo.setDisposal_Data("");
		vo.setReal_Count(1);
		vo.setReal_Count_Flag("F");
		vo.setUser_Name("-");
		vo.setUser_Dept("-");
		vo.setUser_Mac("-");
		
		//assetsService.postPcInsert(vo);
		
		vo.setRental_Flag("F");
		vo.setRegist_Flag("F");
		String fullText = emptyCode + "|" + vo.getAssets_Code() + "|" + vo.getAssets_kinds() + "|" + vo.getCpu() + "|" + vo.getMemory() + "|" + vo.getMainBoard() + "|" + vo.getVideoCard() + "|" + vo.getHardDisk() + "|" + vo.getDiskVolume() + "|" + vo.getPurchase_Space() + "|" + vo.getPurchase_Data() + "|" + vo.getDisposal_Data() + "|" + vo.getMemo() + "|" + vo.getModel_Name(); 
		vo.setFull_text(fullText);
		vo.setUse_full_text("");
		//assetsService.postPcRegistInsert(vo); 
		
	    model.addAttribute("pageNo", 1);
	    model.addAttribute("asideCateCode", 1);
	    model.addAttribute("searchWord", ""); 
	    
		 return "redirect:/assets/pcList";
	 }
	 
	 // PC 리스트
	 @RequestMapping(value = "/pcList", method = RequestMethod.GET)
	 public String getPcList(
			 					      @RequestParam("pageNo") int pageNo, 
			 						  @RequestParam("asideCateCode") int asideCateCode, 
			 						  @RequestParam("searchWord") String searchWord, 
			 						  Model model, 
			 						  HttpServletRequest req
			 						 ) throws Exception {
		 /*
		 * HttpSession session = req.getSession(true); 
		 *  LoginVO adminInfo = (LoginVO) session.getAttribute("admin"); 
		 * model.addAttribute("admin", adminInfo.getId());
		 * model.addAttribute("Authority_Code", adminInfo.getAuthority_Code());
		 */	    
		 
	     String assetsTitle = "PC";
	     model.addAttribute("assetsTitle", assetsTitle);
	     
	     model.addAttribute("pageNo", pageNo);
	     model.addAttribute("asideCateCode", asideCateCode);
	     model.addAttribute("searchWord", searchWord);
	     
		 /** 메인 카테고리 정보(업무용, 보조용...)  **/
		 List<AssetsPcVO> pcMainCateList = assetsService.getPcMainCateData();
		 model.addAttribute("pcMainCateList", pcMainCateList);
		 /** // 메인 카테고리 정보 **/
	     
	     /** 페이징 **/
	     int pcTotalCount = assetsService.getPcTotalcount(asideCateCode); // PC데이터 전체 개수
		 paging(model, pageNo, pcTotalCount, assetsTitle, asideCateCode, searchWord); // 페이징
		 /** //페이징 **/
		 
		 /** PC 상세정보(사용중, 미사용중, 데스크탑, 노트북 개수...)  **/
		 List<AssetsPcVO> pcDetailList = assetsService.getPcDetailCount(asideCateCode, searchWord);
		 model.addAttribute("pcSideCount", pcDetailList); 
		 /** // PC 상세정보  **/
		 
		 return "/assets/authAssets/assetsPc/pc";
	 }
	 
	 	// PC 리스트
		 @RequestMapping(value = "/pcSearchList", method = RequestMethod.GET)
		 public String getPcSearchList(@RequestParam("asideCateCode") int asideCateCode, @RequestParam("searchWord") String searchWord, @RequestParam("pageNo") int pageNo, Model model, HttpServletRequest req) throws Exception {
		
//		     HttpSession session = req.getSession(true);
//			
//			 LoginVO adminInfo = (LoginVO) session.getAttribute("admin");
//			 model.addAttribute("admin", adminInfo.getId());
//			 model.addAttribute("Authority_Code", adminInfo.getAuthority_Code());
		     
		     String assetsTitle = "PC";
		     model.addAttribute("assetsTitle", assetsTitle);
		     
		     model.addAttribute("searchWord", searchWord);
		     
		     
			 /** 메인 카테고리 정보(업무용, 보조용...)  **/
			 List<AssetsPcVO> pcMainCateList = assetsService.getPcMainCateData();
			 model.addAttribute("pcMainCateList", pcMainCateList);
			 /** // 메인 카테고리 정보 **/
		     
		     /** 페이징 **/
		     model.addAttribute("asideCateCode", asideCateCode);
		     model.addAttribute("pageNo", pageNo);
		     
		     if(searchWord == ""){
		    	int pcTotalCount = assetsService.getPcTotalcount(asideCateCode); // PC데이터 전체 개수
			 	paging(model, pageNo, pcTotalCount, assetsTitle, asideCateCode, searchWord); // 페이징
		     }else {
		    	 int pcSearchCount = assetsService.getPcSearchcount(asideCateCode, searchWord); // PC데이터 전체 개수
				 paging(model, pageNo, pcSearchCount, assetsTitle, asideCateCode, searchWord); // 페이징
		     }
			 /** //페이징 **/
			 
			 /** PC 상세정보(사용중, 미사용중, 데스크탑, 노트북 개수...)  **/
			 List<AssetsPcVO> pcDetailList = assetsService.getPcDetailCount(asideCateCode, searchWord);
			 model.addAttribute("pcSideCount", pcDetailList); 
			 /** // PC 상세정보  **/
			 
			 return "/assets/authAssets/assetsPc/pc";
		 }
	 
	 
	 // PC 상세보기
	 @RequestMapping(value = "/pcDetail", method = RequestMethod.GET)
	 public String getPcDetail(@RequestParam("asideCateCode") int asideCateCode, @RequestParam("pcCode") String pcCode, Model model, HttpServletRequest req) throws Exception {
		 String assetsTitle = "PC";
	     model.addAttribute("assetsTitle", assetsTitle);
	     
		 /** 메인 카테고리 정보(업무용, 보조용...)  **/
		 List<AssetsPcVO> pcMainCateList = assetsService.getPcMainCateData();
		 model.addAttribute("pcMainCateList", pcMainCateList);
		 /** // 메인 카테고리 정보 **/
		 
		 /** 군 정보(업무망, 서비스망, 백업망)  **/
		 List<AssetsPcVO> pcAreaCateList = assetsService.getPcAreaCateData();
		 model.addAttribute("pcAreaCateList", pcAreaCateList);
		 /** // 군 정보 **/
		 
		 /** 종류 정보(데스크탑, 노트북...)  **/
		 List<AssetsPcVO> pcSubCateList = assetsService.getPcSubCateData();
		 model.addAttribute("pcSubCateList", pcSubCateList);
		 /** // 종류 정보 **/
		 
		 model.addAttribute("pcCode", pcCode);
		 model.addAttribute("asideCateCode", asideCateCode);
		 
		 List<AssetsPcVO> pcDetailList = assetsService.getpcDetail(pcCode, asideCateCode);
		 model.addAttribute("pcDetailList", pcDetailList);
		 
		 return "/assets/authAssets/assetsPc/pcDetail";
	 }
	 
	 // PC 상세보기
	 @RequestMapping(value = "/pcDelete", method = RequestMethod.GET)
	 public String getPcDelete(@RequestParam("asideCateCode") int asideCateCode, @RequestParam("pcCode") String pcCode, Model model, HttpServletRequest req) throws Exception {
		 String assetsTitle = "PC";
	     model.addAttribute("assetsTitle", assetsTitle);
	     
	     model.addAttribute("searchWord", "");
	     
	     assetsService.getPcDelete(pcCode);
	     
		 /** 메인 카테고리 정보(업무용, 보조용...)  **/
		 List<AssetsPcVO> pcMainCateList = assetsService.getPcMainCateData();
		 model.addAttribute("pcMainCateList", pcMainCateList);
		 /** // 메인 카테고리 정보 **/
	     
	     /** 페이징 **/
	     model.addAttribute("asideCateCode", asideCateCode);
	     model.addAttribute("pageNo", 1);
		 
	     int pcTotalCount = assetsService.getPcTotalcount(asideCateCode); // PC데이터 전체 개수
	 	paging(model, 1, pcTotalCount, assetsTitle, asideCateCode, ""); // 페이징
	     
		 /** PC 상세정보(사용중, 미사용중, 데스크탑, 노트북 개수...)  **/
		 List<AssetsPcVO> pcDetailList = assetsService.getPcDetailCount(asideCateCode, "");
		 model.addAttribute("pcSideCount", pcDetailList); 
		 /** // PC 상세정보  **/
		 
		return "/assets/authAssets/assetsPc/pc";
	 }
	 
	 
	// PC 상세보기
	@RequestMapping(value = "/pcMultiDelete", method = RequestMethod.POST)
	public String postPcMultiDelete(@RequestParam("pcCheckBox") String[] pcCodeArr, Model model) throws Exception {
		for(String code : pcCodeArr){
			assetsService.getPcDelete(code);
		}
		
	    model.addAttribute("pageNo", 1);
	    model.addAttribute("asideCateCode", 1);
	    model.addAttribute("searchWord", ""); 
	    
	    return "redirect:/assets/pcList";
	}
	 
		
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	private void paging(Model model, int num, int count, String assetsTitle, int asideCateCode, String searchWord) throws Exception {
		// 한 페이지에 출력할 게시물 갯수
		int postNum = 10;
		 
		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int)Math.ceil((double)count/postNum);
		 
		// 출력할 게시물
		int displayPost = (num - 1) * postNum;
		 
		// 한번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 5;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
		
		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		
		// 마지막 번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
 		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음 
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		if(assetsTitle == "PC") {
			
			List<AssetsPcVO> pcList = assetsService.pcListPage(displayPost, postNum, asideCateCode, searchWord);
			
			model.addAttribute("pcList", pcList);   
			model.addAttribute("pageNum", pageNum);
		}
	}
	 
}
