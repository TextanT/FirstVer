package com.besideYou.textant.main;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.besideYou.textant.dao.BookInfoDao;

@Service
public class MainServiceImpl implements MainService {
	@Resource(name="saveDir")
	String destinationDir;
	@Autowired
	BookInfoDao bookInfoDao;
	
	@Override
	public String home(Model model, HttpSession session) {
		
		File file;
		File[] files;
		
		List<String> fileNames;
		
		fileNames = bookInfoDao.getNewBooks();
		
		/*file = new File(destinationDir);
		files = file.listFiles();
		fileNames = new ArrayList<String>();
		
		for (File lis : files) {
			System.out.println("파일이름 : " + lis.getName());
			fileNames.add(lis.getName());
		}
		*/
		
		model.addAttribute("fileList", fileNames);
		model.addAttribute("id", session.getAttribute("id"));
		
		return "main";
	}
}
