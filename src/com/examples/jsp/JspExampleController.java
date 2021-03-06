package com.examples.jsp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.examples.common.Person;

@RestController
public class JspExampleController {

	@RequestMapping(value = "/jsp/syntax", method = RequestMethod.GET)
	public ModelAndView loadJspExample() throws Exception {
		return new ModelAndView("jsp/syntax");
	}

	@RequestMapping(value = "/jsp/jstl/core", method = RequestMethod.GET)
	public ModelAndView loadJstlCoreExample() throws Exception {
		ModelAndView mav = new ModelAndView("jstlCore");

		Person p1 = new Person("bob", "dylan");
		Person p2 = new Person("bob", "marley");
		Person p3 = new Person("bob", "dole");

		List<Person> bobs = new ArrayList<Person>();
		bobs.add(p1);
		bobs.add(p2);
		bobs.add(p3);

		mav.addObject("bobs", bobs);
		mav.addObject("person1", new Person("Ted", "Jackson"));
		mav.addObject("person2", new Person());

		return mav;
	}

	@RequestMapping(value = "/jsp/jstl/sql", method = RequestMethod.GET)
	public ModelAndView loadNavHeader() throws Exception {

		@SuppressWarnings("deprecation")
		Date anotherDate = new Date("2016/1/1");
		LocalDateTime timePoint = LocalDateTime.now();
		ModelAndView mav = new ModelAndView("jstl/sql");
		mav.addObject("anotherDate", anotherDate);
		mav.addObject("doesnWork", timePoint);
		return mav;
	}

	@RequestMapping(value = "/simpleTestPage", method = RequestMethod.GET)
	public ModelAndView loadSimpleTestPage() throws Exception {
		return new ModelAndView("simpleTestPage");
	}

}
