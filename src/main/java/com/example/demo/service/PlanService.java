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
	
	public TravlePlan getForPrintPlan(int id) {
		return planDao.getForPrintPlan(id);
	}

	public List<TravlePlan> getTravlePlans() {
		return planDao.getTravlePlans();
	}

	public TravlePlan getTravlePlanById(int id) {
		return planDao.getTravlePlanById(id);
	}

	public int getLastInsertId() {
		return planDao.getLastInsertId();
	}

}
