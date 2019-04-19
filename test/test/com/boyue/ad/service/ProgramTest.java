package test.com.boyue.ad.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)   
@ContextConfiguration(locations = "classpath:applicationContext.xml")  
@TransactionConfiguration(transactionManager="transactionManager") 
public class ProgramTest {

	
	@Test
	public void testSaveProgramContent() {
	}
	
	@Test
	public void testFindWithDetail() {
	}
}
