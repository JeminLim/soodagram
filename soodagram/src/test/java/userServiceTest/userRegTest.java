package userServiceTest;

import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;
import static org.mockito.Matchers.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.context.ContextConfiguration;

import com.soodagram.soodagram.user.repository.UserDAO;
import com.soodagram.soodagram.user.service.UserService;
import com.soodagram.soodagram.user.service.UserServiceImpl;

import junit.framework.Assert;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/root-context.xml"})
public class userRegTest {

	private UserService userService;
	
	@Mock
	private UserDAO userDAO;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		userService = new UserServiceImpl(userDAO);
	}
	
	@Test
	public void test_duplicateId_Expect_return_1() throws Exception {		
		
		//given
		//기존 존재하는 Id = soosooda
		given(userDAO.duplicateId("soosooda")).willReturn(1);
		
		//when
		int result = userService.duplicateId("soosooda");
		
		//then
		verify(userDAO).duplicateId(anyString());
		Assert.assertEquals(result, 1);
	}
	
	@Test
	public void test_duplicateEmail_Expect_return_1() throws Exception {
		//given
		//기존 존재하는 이메일 = sooda01@mail.com
		given(userDAO.duplicateEmail("sooda01@mail.com")).willReturn(1);
		
		//when
		int result = userService.duplicateEmail("sooda01@mail.com");
		
		//then
		verify(userDAO).duplicateEmail(anyString());
		Assert.assertEquals(result, 1);
	}
	
	
	
}
