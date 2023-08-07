package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.PlanService;
import com.example.demo.util.Util;
import com.example.demo.vo.Rq;
import com.example.demo.vo.TravlePlan;

@Controller
public class UsrPlanController {
	
	private PlanService planService;
	private Rq rq;
	
	@Autowired
	public UsrPlanController(PlanService planService, Rq rq) {
		this.planService = planService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/plan/write")
	public String write() {
		return "usr/plan/write";
	}
	
	@RequestMapping("/usr/plan/doWrite")
	@ResponseBody
	public String doWrite(String title) {
		
		if (Util.empty(title)) {
			return Util.jsHistoryBack("제목을 입력해주세요");
		}
		
		int id = planService.getLastInsertId();
		
		return "";
	}

	@RequestMapping("/usr/plan/list")
	public String showList(int id) {
		
		List<TravlePlan> travlePlans = planService.getTravlePlans();
		
		return "usr/plan/list";
	}
	
	@RequestMapping("/usr/plan/detail")
	public String showDetail(int id) {
		
		TravlePlan travleplan = planService.getForPrintPlan(id);
		
		return "usr/plan/detail";
	}

}
