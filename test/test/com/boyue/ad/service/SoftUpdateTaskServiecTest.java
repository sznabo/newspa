package test.com.boyue.ad.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.boyue.karaoke.model.Soft;
import com.boyue.karaoke.model.SoftUpdateTask;
import com.boyue.karaoke.service.SoftService;
import com.boyue.karaoke.service.SoftUpdateTaskService;

@RunWith(SpringJUnit4ClassRunner.class)   
@ContextConfiguration(locations = "classpath:applicationContext.xml")  
@TransactionConfiguration(transactionManager="transactionManager") 
public class SoftUpdateTaskServiecTest {

	@Autowired
	private SoftUpdateTaskService service;
	
	@Autowired
	private SoftService service2;
	
	@Test
	public void findById() {
		SoftUpdateTask s = service.findById(1);
		System.out.println(s.getSoftName());
		System.out.println(s.getSoft().getPackageName());
	}
	
	@Test
	public void testFindAll() {
		List<Soft> all = service2.findAll();
		System.out.println(all.size());
	}
}
