package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BoardService;
import com.example.demo.service.PlanService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Util;
import com.example.demo.vo.Board;
import com.example.demo.vo.Reply;
import com.example.demo.vo.Rq;
import com.example.demo.vo.TravlePlan;

@Controller
public class UsrPlanController {
	
	private PlanService planService;
	private BoardService boardService;
	private ReplyService replyService;
	private Rq rq;
	
	@Autowired
	public UsrPlanController(PlanService planService, BoardService boardService, ReplyService replyService, Rq rq) {
		this.planService = planService;
		this.boardService = boardService;
		this.replyService = replyService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/plan/plan")
	public String plan() {
		return "usr/plan/plan";
	}
	
	@RequestMapping("/usr/plan/doplan")
	@ResponseBody
	public String doPlan(String title, String startDate, String endDate, int city, String state) {
		
		planService.makeTravlePlan(rq.getLoginedMemberId(), startDate, endDate, city, state);
		
		return "";
	}

	@RequestMapping("/usr/plan/list")
	public String showList(Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "title") String searchKeywordType) {
		
		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다");
		}

		Board board = boardService.getBoardById(boardId);

		if (board == null) {
			return rq.jsReturnOnView("존재하지 않는 게시판입니다");
		}

		int plansCnt = planService.getPlansCnt(boardId, searchKeyword, searchKeywordType);

		int itemsInAPage = 10;
		
		int pagesCnt = (int) Math.ceil((double) plansCnt / itemsInAPage);

		List<TravlePlan> travlePlans = planService.getTravlePlans(boardId, searchKeyword, searchKeywordType, itemsInAPage, page);
		
		model.addAttribute("travlePlans", travlePlans);
		model.addAttribute("plansCnt", plansCnt);
		model.addAttribute("board", board);
		model.addAttribute("pagesCnt", pagesCnt);
		model.addAttribute("page", page);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchKeywordType", searchKeywordType);

		return "usr/plan/list";
	}

	@RequestMapping("/usr/plan/detail")
	public String showDetail(HttpServletRequest req, HttpServletResponse resp, Model model, int id) {

		Cookie oldCookie = null;
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("hit")) {
					oldCookie = cookie;
				}
			}
		}
		
		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + id + "]")) {
				planService.increaseHit(id);
				oldCookie.setValue(oldCookie.getValue() + "_[" + id + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(30 * 60);
				resp.addCookie(oldCookie);
			}
		} else {
			planService.increaseHit(id);
			Cookie newCookie = new Cookie("VCnt", "[" + id + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(30 * 60);
			resp.addCookie(newCookie);
		}
		
		TravlePlan travlePlan = planService.getForPrintPlan(id);
		
		List<Reply> replies = replyService.getReplies("travlePlan", id);

		model.addAttribute("travlePlan", travlePlan);
		model.addAttribute("replies", replies);

		return "usr/plan/detail";
	}

}
