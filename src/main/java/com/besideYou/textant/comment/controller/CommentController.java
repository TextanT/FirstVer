package com.besideYou.textant.comment.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.besideYou.textant.comment.dto.CommentDto;
import com.besideYou.textant.comment.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;

	String view;


	@RequestMapping(value="/scroll.comment", method = RequestMethod.GET)
	public String scroll() {
		
		return "/WEB-INF/views/scroll.jsp";
	}
	@RequestMapping(value="/commentView.comment", method = RequestMethod.GET)
	public String commentView(Model model) {
		return "/WEB-INF/views/commentView.jsp";
	}
	
	@RequestMapping(value="/commentTotalCount.comment")
	@ResponseBody
	public HashMap<String, Integer> commentTotalCount(int bookArticleNum,int page){
		return commentService.commentTotalCount(bookArticleNum);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/commentCount.comment")	
	public HashMap<String, Integer> commentCount(int page, int bookArticleNum){

		return commentService.commentCount(page,bookArticleNum);
	}
	
	@RequestMapping(value="/commentRead.comment")
	@ResponseBody
	public List<CommentDto> commentRead(HttpSession session, int page,int nextPage,int pageListCount,int pageCountBlock,int pageCut,int bookArticleNum,int commentNum,int commentDelete){
		System.out.println("commentRead 사용핬어영");
		int userNum=1;
		return commentService.scrollView(page,nextPage,pageListCount,pageCountBlock,pageCut,bookArticleNum,commentNum,commentDelete,userNum);
	}
	
	@RequestMapping(value="/commentTotalRead.comment")
	@ResponseBody
	public List<CommentDto> commentTotalRead(HttpSession session,int page,int commentTotalCount,int bookArticleNum,int commentNum,int commentDelete,int commentSearchCheak, int commentSearchList,String commentSearch){
		
		int userNum=1;
		return commentService.commentTotalRead(page,commentTotalCount,userNum,bookArticleNum,commentNum,commentDelete,commentSearchCheak,commentSearchList,commentSearch);
	}
	
	@RequestMapping(value="/commentDelete.comment")
	@ResponseBody
	public int commentDelete(int commentNum,int commentGroup,HttpSession session){
		int userNum=1;
		
		return commentService.commentDelete(commentNum,commentGroup);
	}
	
	@RequestMapping(value="/commentWrite.comment")
	@ResponseBody
	public HashMap<String, Integer> scrollWrite(CommentDto commentDto,int page,int commentTo,int commentTop,HttpSession session,int commentCheck) {
		commentDto.setPageGroup(page);
		commentDto.setUserNum(1);
		
		return commentService.scroll(commentDto,commentTo,commentTop);
	}

	@RequestMapping(value="/commentGoodOrBad.comment")
	@ResponseBody
	public HashMap<String, Integer> commentGoodOrBad(HttpSession session, int commentNum,int commentGoodOrBad){
//		String userNum = (String)session.getAttribute("userNum");
		int userNum=1;
		return commentService.commentGoodOrBad(commentNum,commentGoodOrBad,userNum);
	}
	
	@RequestMapping(value="/reportComment.comment")
	@ResponseBody
	public int reportComment(HttpSession session, int commentNum){
//		String userNum = (String)session.getAttribute("userNum");
		int userNum=1;
		return commentService.reportComment(commentNum,userNum);
	}
	
}
