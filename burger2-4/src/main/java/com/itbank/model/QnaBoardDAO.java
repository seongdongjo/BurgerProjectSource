package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface QnaBoardDAO {

	int qnaInsert(QnaBoardDTO dto);

	@Select("select * from qnaboard_table")
	List<QnaBoardDTO> qnaList();

	@Select("select * from qnaboard_table "
			+ "where result = 'n' "
			+ "order by regdate desc "
			+ "offset ${ offset } rows "
			+ "fetch first 10 rows only")
	List<QnaBoardDTO> qnaCheck(int offset);

	@Update("update qnaboard_table set result = 'y' where qna_seq = #{ seq }")
	int resultUpdate(int seq);

	int qnaCount(String result);

	List<HashMap<String, Object>> qnaList2(HashMap<String, Object> map);

	@Select("select * from qnaboard_table where qna_seq = #{ seq }")
	QnaBoardDTO getQna(int seq);

	@Select("select count(*) count from qnaboard_table  where result = 'n'")
	int qnaCnt();

	int userCount(String writer);

	List<QnaBoardDTO> userQnaList(HashMap<String, Object> map);

}
