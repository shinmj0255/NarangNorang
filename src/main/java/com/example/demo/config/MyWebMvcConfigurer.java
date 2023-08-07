package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.demo.interceptor.BeforeActionInterceptor;
import com.example.demo.interceptor.NeedLoginInterceptor;
import com.example.demo.interceptor.NeedLogoutInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {

	private BeforeActionInterceptor beforeActionInterceptor;
	private NeedLoginInterceptor needLoginInterceptor;
	private NeedLogoutInterceptor needLogoutInterceptor;

	@Autowired
	public MyWebMvcConfigurer(BeforeActionInterceptor beforeActionInterceptor,
			NeedLoginInterceptor needLoginInterceptor,
			NeedLogoutInterceptor needLogoutInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
		this.needLoginInterceptor = needLoginInterceptor;
		this.needLogoutInterceptor = needLogoutInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration ir;
		
		ir = registry.addInterceptor(beforeActionInterceptor);
		ir.addPathPatterns("/**");
		ir.addPathPatterns("/favicon.ico");
		ir.excludePathPatterns("/resource/**");

		ir = registry.addInterceptor(needLoginInterceptor);
		ir.addPathPatterns("/usr/plan/write");
		ir.addPathPatterns("/usr/plan/dowrite");
		ir.addPathPatterns("/usr/plan/list");
		ir.addPathPatterns("/usr/plan/detail");
		ir.addPathPatterns("/usr/member/doLogout");
		ir.addPathPatterns("/usr/member/myPage");
		ir.addPathPatterns("/usr/member/passwordChk");
		ir.addPathPatterns("/usr/member/doPasswordChk");
		ir.addPathPatterns("/usr/member/doModify");
		ir.addPathPatterns("/usr/member/passwordModify");
		ir.addPathPatterns("/usr/member/doPasswordModify");
		ir.addPathPatterns("/usr/reactionPoint/getReactionPoint");
		ir.addPathPatterns("/usr/reactionPoint/doInsertReactionPoint");
		ir.addPathPatterns("/usr/reactionPoint/doDeleteReactionPoint");
		ir.addPathPatterns("/usr/reply/doWrite");
		ir.addPathPatterns("/usr/reply/doModify");
		ir.addPathPatterns("/usr/reply/doDelete");
		ir.addPathPatterns("/usr/reply/getReplyContent");
		
		ir = registry.addInterceptor(needLogoutInterceptor);
		ir.addPathPatterns("/usr/member/doJoin");
		ir.addPathPatterns("/usr/member/login");
		ir.addPathPatterns("/usr/member/doLogin");
	}

}