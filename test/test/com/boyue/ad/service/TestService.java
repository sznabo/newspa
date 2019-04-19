package test.com.boyue.ad.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.boyue.karaoke.service.VodProgramService;
import com.boyue.spa.domain.Vodprogram;
@RunWith(SpringJUnit4ClassRunner.class)   
@ContextConfiguration(locations = "classpath:applicationContext.xml")  
@TransactionConfiguration(transactionManager="transactionManager") 
public class TestService {
}
