package com.biz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.email.model.EMSVO;

public interface EMSDao {

	@Select("SELECT * FROM tbl_email WHERE id = #{id}")
	public List<EMSVO> selectById(long id);
	
	@Select("SELECT * FROM tbl_email WHERE id=#{id}")
	public EMSVO findById(long id);
	
	@Select("SELECT * FROM tbl_email")
	public List<EMSVO> selectAll();
	
	@SelectKey(statement=" SELECT SEQ_EMAIL.NEXTVAL FROM DUAL ",
			   keyProperty ="id", before=true,
			   resultType=Long.class)
	@InsertProvider(type=EMSSQL.class, method="ems_insert_sql")
	public int insert(EMSVO eVO);
	
	@UpdateProvider(type=EMSSQL.class, method="ems_update_sql")
	public int update(EMSVO eVO);
	
	@Delete("DELETE FROM tbl_email WHERE id=#{id}")
	public int delete(long id);
	
	
}
