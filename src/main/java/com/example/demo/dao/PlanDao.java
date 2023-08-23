package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.TravlePlan;

@Mapper
public interface PlanDao {
	
	public Object makeTravlePlan(int loginedMemberId, String startDate, String endDate, int city, String state);

	public TravlePlan getForPrintPlan(int id);

	public List<TravlePlan> getTravlePlans(int boardId, String searchKeyword, String searchKeywordType, int limitStart ,int itemsInAPage);

	public TravlePlan getTravlePlanById(int id);

	public int getLastInsertId();

	public int getPlansCnt(int boardId, String searchKeyword, String searchKeywordType);

	public void increaseHit(int id);

}
