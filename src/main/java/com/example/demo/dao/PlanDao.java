package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.TravlePlan;

@Mapper
public interface PlanDao {
	
	public TravlePlan getForPrintPlan(int id);

	public List<TravlePlan> getTravlePlans();

	public TravlePlan getTravlePlanById(int id);

	public int getLastInsertId();

}
