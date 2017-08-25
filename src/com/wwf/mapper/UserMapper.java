package com.wwf.mapper;

import java.util.List;

import com.wwf.pojo.MultiQuery;
import com.wwf.pojo.User;
import com.wwf.pojo.UserLogin;

public interface UserMapper {
	List<User> selectByUserLogin(UserLogin userLogin);
	
	List<User> selectByMultiQuery(MultiQuery mqw);
	
	int insert(User user);

	List<User> selectAll();
	
	int deleteByPrimaryKey(Integer id);
	
	User selectByPrimaryKey(Integer id);

	int updateByPrimaryKey(User record);

	int updateByUsernameAndPassword(User record);

}