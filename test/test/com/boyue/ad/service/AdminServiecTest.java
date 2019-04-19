package test.com.boyue.ad.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.boyue.karaoke.model.Admin;
import com.boyue.karaoke.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)   
@ContextConfiguration(locations = "classpath:applicationContext.xml")  
@TransactionConfiguration(transactionManager="transactionManager") 
public class AdminServiecTest {

	@Autowired
	private AdminService adminService;
	
	@Test
	public void testSave() {
		Admin admin = new Admin();
		admin.setLoginName("admin23");
		admin.setPassword("123456");
		admin.setUserName("超级管理员32");
		adminService.save(admin);
	}
	
	@Test
	public void testFind() {
		System.out.println(adminService.findById(1).getLoginName());
	}
}
