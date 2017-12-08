package com.besideYou.textant.manager.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.besideYou.textant.common.dto.RecommendedBookDto;

public interface ManagerService {
	void managerMain(Model model);
	void managerRecommendBook(Model model, int pageNum, HttpServletRequest req);
	void managerReportBook(Model model, int pageNum, HttpServletRequest req);
	void managingRecommendContent(int num, Model model);
	void recommendWrite(RecommendedBookDto recommendedBookDto, HttpSession session);
	
}
