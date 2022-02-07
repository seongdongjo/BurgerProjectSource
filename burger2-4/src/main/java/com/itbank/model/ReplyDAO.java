package com.itbank.model;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ReplyDAO {

	@Insert("insert into reply_table values (reply_seq.nextval, #{ board_idx }, #{ writer }, #{ content }, sysdate)")
	int insert(ReplyDTO dto);

	@Select("select * from reply_table where writeDate =(select max(writeDate) from reply_table where board_idx = #{ seq })")
	ReplyDTO getReply(int seq);
}
