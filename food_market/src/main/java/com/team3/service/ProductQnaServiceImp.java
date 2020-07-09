package com.team3.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.dao.ProductQnaDAO;
import com.team3.page.PageCriteria;
import com.team3.vo.ProductQnaVO;

@Service
public class ProductQnaServiceImp implements ProductQnaService {

	@Inject
	private ProductQnaDAO ProductQnaDAO;
	
	@Override
	public void qnainsert(ProductQnaVO qvo) throws Exception {
		
		
		int maxqna_num = ProductQnaDAO.maxnum(qvo);
		qvo.setQna_re_ref(maxqna_num);
		
		
		ProductQnaDAO.qnainsert(qvo);
		
	}
	
	
//	@Override
//	public List<ProductQnaVO> list(ProductQnaVO qvo) throws Exception {
//		
//		return ProductQnaDAO.list(qvo);
//	}


	@Override
	public int getBoardReRef(ProductQnaVO qvo) throws Exception {
		
		return ProductQnaDAO.getBoardReRef(qvo);
	}


	@Override
	public int maxnum(ProductQnaVO qvo) throws Exception {
		
		return ProductQnaDAO.maxnum(qvo);
	}


	@Override
	public void qnareplyupdate(ProductQnaVO qvo) throws Exception {
		
		ProductQnaDAO.qnareplyupdate(qvo);
	}


	@Override
	public void qnareplywrite(ProductQnaVO qvo) throws Exception {
		
		int maxqna_num = ProductQnaDAO.maxnum(qvo);
		qvo.setQna_re_ref(maxqna_num);
		
		ProductQnaDAO.qnareplywrite(qvo);
	}


	@Override
	public ProductQnaVO getBoardReplyInfo(int qna_num) throws Exception {
		
		return ProductQnaDAO.getBoardReplyInfo(qna_num);
	}


	@Override
	public List<ProductQnaVO> list(Map<String,Object> map) throws Exception {
		
		return ProductQnaDAO.list(map);
	}


	@Override
	public int countData(PageCriteria pCria) throws Exception {
		
		return ProductQnaDAO.countData(pCria);
	}





	


//	@Override
//	public ProductQnaVO read(int qna_num) throws Exception {
//		
//		return ProductQnaDAO.read(qna_num);
//	}

	

}

