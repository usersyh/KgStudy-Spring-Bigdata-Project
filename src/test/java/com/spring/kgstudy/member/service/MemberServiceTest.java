package com.spring.kgstudy.member.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class MemberServiceTest {

	@Autowired
	MemberService service;
	
	@Test
	void testR() {
		
		 RConnection r;
		try {
			r = new RConnection();
	
		 REXP x = null;

		 
//		 x=r.eval("source('D:/rfolder/kk.R')");
		 
		 x = r.eval("ls()");
		
		 for(String s : x.asStrings()) {
			 
			 System.out.println(s+"");
		 }
		 

		
		 r.voidEval("ageGraph()");
//		 x = r.eval("ss(1,6)");

//		
		 r.eval("makeGraph()");
//		 System.out.println(x.asNativeJavaObject());
//		
		 
		 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}
	
//	@Test
//	void adminInsertTest() {
//
//	
//		MemberVO admin = new MemberVO("admin", "admin", "관리자", "admin@kgstudy.com","010-4545-4444","M",new Date(),"admin");
//		
//
//		service.insertUser(admin);
//	
//	}
//	
	
	/*
	 * @Test void path() {
	 * 
	 * String rootPath = System.getProperty("user.dir").replace("\\", "/");
	 * 
	 * 
	 * System.out.println(rootPath); URL r = this.getClass().getResource("");
	 * 
	 * String path = r.getPath();
	 * 
	 * System.out.println(path);
	 * 
	 * 
	 * }
	 */
	

	
	
	
//	@Test
//	void InsertMemberTest() {
//		
//		LocalDate now = LocalDate.now();
//		
//		LocalDate start = now.minusYears(90);
//		
//		
//		for(int i=1; i<=200; i++) {
//			
//			 Random random = new Random();
//			 Long ranDay = (long) (random.nextInt((int) (now.toEpochDay() -start.toEpochDay()+1)) + start.toEpochDay());
//				Date birthday = 	Date.from(LocalDate.ofEpochDay(ranDay).atStartOfDay(ZoneId.systemDefault()).toInstant());
//				
//			MemberVO member = new MemberVO("user"+i, "user"+i, "유저"+i, "user"+i+"@kgstudy.com","010-4545-4444","M",new Date(),"admin");
//			
//			String userName = "user"+i;
//		
//	
//
//			String email = userName+"@kgstudy.com";
//			String tel = "010-4545-4444";
//			
//			
//			String gender="F";
//			if(i%2==0) {
//				gender="M";
//			}
//					
//			
//			member.setUser_name(userName);
//			member.setUser_pw(userName);
//			member.setUser_grant("user");
//			member.setUser_gender(gender);
//			member.setUser_tel(tel);
//			member.setUser_email(email);
//			member.setUser_birthday(birthday);
//			
//
//			service.insertUser(member);
//			
//		}
//
//	
//	
//	
//	}

}
