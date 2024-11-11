package com.chen.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.dao.ScoreMapper;
import com.chen.pojo.Score;
import com.chen.untils.PageBean;

@Service
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	private ScoreMapper scoreMapper;
	
	public void setScoreMapper(ScoreMapper scoreMapper) {
		this.scoreMapper = scoreMapper;
	}

	//获取要更新成绩的信息
	@Override
	public Score queryScoreById(Score score) {
	
		return scoreMapper.queryScoreById(score);
	}

	//添加成绩
	@Override
	public int addScoreInfo(Score score) {
		
		return scoreMapper.addScoreInfo(score);
	}

	//更新成绩
	@Override
	public int updateScoreInfo(Score score) {
		
		return scoreMapper.updateScoreInfo(score);
	}

	//删除成绩
	@Override
	public int deleteScoreInfoById(String id) {

		return scoreMapper.deleteScoreInfoById(id);
	}
	
	//查询成绩信息
	@Override
	public PageBean<Score> findByPage(int currentPage, String id) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<Score> pageBean = new PageBean<Score>();
		
		pageBean.setId(id);
        pageBean.setCurrPage(currentPage);//封装当前页数
        
		int pageSize=7;//每页显示数据数
		pageBean.setPageSize(pageSize);
		
		//封装记录总数
		int totalCount = scoreMapper.selectCount(id);
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		map.put("id",id);
		
		//封装每页显示的数据
		List<Score> lists = scoreMapper.findByPage(map);
		System.out.println(lists);
	
		pageBean.setLists(lists);
		
		return pageBean;
	}

}
