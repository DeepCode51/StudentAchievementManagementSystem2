package com.chen.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.chen.pojo.Score;

public interface ScoreMapper {
	
	// 获取要更新成绩的信息
	public Score queryScoreById(Score score);

	// 查询成绩
	List<Score> findByPage(HashMap<String,Object> map);

	// 添加成绩
	public int addScoreInfo(Score score);

	// 更新成绩
	public int updateScoreInfo(Score score);

	// 删除成绩
	public int deleteScoreInfoById(String id);
	
	//获取总条数
	public int selectCount(@Param("id")String id);

}
