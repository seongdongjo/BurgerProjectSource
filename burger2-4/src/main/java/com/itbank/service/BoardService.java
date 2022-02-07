package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.NoticeDAO;
import com.itbank.model.NoticeDTO;
import com.itbank.model.QnaBoardDAO;
import com.itbank.model.QnaBoardDTO;
import com.itbank.model.ReplyDAO;
import com.itbank.model.ReplyDTO;

@Service
public class BoardService {

	@Autowired private NoticeDAO dao;
	@Autowired private QnaBoardDAO qdao;
	@Autowired private ReplyDAO rdao;
	
	
	public List<HashMap<String, Object>> getNotice(int offset) {
		return dao.selectNotice(offset);
	}

	public NoticeDTO getNews(int seq) {
		
		return dao.selectNews(seq);
	}

//	public int cntUpdate(int seq) {
//		return dao.cntUpdate(seq);
//	}

	public int cntUpdate(HashMap<String, Object> map) {
		return dao.cntUpdate(map);
	}

	public int qnaInsert(QnaBoardDTO dto) {
		return qdao.qnaInsert(dto);
	}

	public List<QnaBoardDTO> qnaList() {
		return qdao.qnaList();
	}

	// 미답변 QnA 가져오기
	public List<QnaBoardDTO> qnaCheck(int offset) {
		return qdao.qnaCheck(offset);
	}

	public int replyInsert(ReplyDTO dto) {
		return rdao.insert(dto);
	}

	public int qnaResult(int seq) {
		return qdao.resultUpdate(seq);
	}

	public int qnaCount(String result) {
		
		return qdao.qnaCount(result);
	}

	public List<HashMap<String, Object>> qnaList2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return qdao.qnaList2(map);
	}

	// 가장 최근 댓글 가져오기
	public ReplyDTO getReply(int seq) {
		
		return rdao.getReply(seq);
	}

	// QnA 가져오기
	public QnaBoardDTO getQna(int seq) {
		return qdao.getQna(seq);
	}

	// 미 답변 댓글 총 개수
	public int qnaCheckCnt() {	
		return qdao.qnaCnt();
	}

	// 회원 댓글만 보기 카운트
	public int userCount(String writer) {
		
		return qdao.userCount(writer);
	}

	// 회원 댓글만 보기
	public List<QnaBoardDTO> userQnaList(HashMap<String, Object> map) {
		return qdao.userQnaList(map);
	}

	

}
