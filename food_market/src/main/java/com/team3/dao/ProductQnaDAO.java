package com.team3.dao;

import java.util.List;
import java.util.Map;

import com.team3.page.PageCriteria;
import com.team3.vo.ProductQnaVO;

public interface ProductQnaDAO {

	 public void qnainsert(ProductQnaVO qvo)throws Exception;
	
//	 public List<ProductQnaVO> list(ProductQnaVO qvo)throws Exception;
	 
	 public int getBoardReRef(ProductQnaVO qvo) throws Exception;
	 
	 public int maxnum(ProductQnaVO qvo)throws Exception;
	 
//	 public ProductQnaVO read(int qna_num)throws Exception;
	 
	 public ProductQnaVO getBoardReplyInfo(int qna_num)throws Exception;
	 
	 public void qnareplyupdate(ProductQnaVO qvo)throws Exception;
	 
	 public void qnareplywrite(ProductQnaVO qvo)throws Exception;

	 public List<ProductQnaVO> list(Map<String,Object> map)throws Exception;
		
	 public int countData(PageCriteria pCria)throws Exception;
	 
}

