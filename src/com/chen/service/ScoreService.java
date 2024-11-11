package com.chen.service;

import com.chen.pojo.Score;
import com.chen.untils.PageBean;

public interface ScoreService {
	
	public Score queryScoreById(Score score);

	public PageBean<Score> findByPage(int currentPage,String id);

	public int addScoreInfo(Score score);

	public int updateScoreInfo(Score score);

	public int deleteScoreInfoById(String id);

}
