package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.PlanDao;
import com.example.demo.vo.TravlePlan;

@Service
public class PlanService {
	
	private PlanDao planDao;
	
	@Autowired
	PlanService(PlanDao planDao) {
		this.planDao = planDao;
	}

	public void makeTravlePlan(int loginedMemberId, String startDate, int city) {
		planDao.makeTravlePlan(loginedMemberId, startDate, city);
	}

	public TravlePlan getForPrintPlan(int id) {
		return planDao.getForPrintPlan(id);
	}

	public List<TravlePlan> getTravlePlans(int boardId, String searchKeyword, String searchKeywordType, int itemsInAPage,int page) {
		
		int limitStart = (page - 1) * itemsInAPage;
		
		return planDao.getTravlePlans(boardId, searchKeyword, searchKeywordType, limitStart, itemsInAPage);
	}

	public TravlePlan getTravlePlanById(int id) {
		return planDao.getTravlePlanById(id);
	}

	public int getLastInsertId() {
		return planDao.getLastInsertId();
	}

	public int getPlansCnt(int boardId, String searchKeyword, String searchKeywordType) {
		return planDao.getPlansCnt(boardId, searchKeyword, searchKeywordType);
	}

	public void increaseHit(int id) {
		planDao.increaseHit(id);
	}


		
	

}
