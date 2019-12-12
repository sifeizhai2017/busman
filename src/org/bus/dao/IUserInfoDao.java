package org.bus.dao;

import org.bus.entity.User;

import java.util.List;

public interface IUserInfoDao {
//    增加用户
    public boolean addUser(User user);

//    判断用户是否已经存在
    public boolean isExist(String uname);

//    根据用户名查询用户
    public User queryUserByUname(String uname);

//    查询所有用户
    public List<User> queryAllUsers();

//    更新用户数据
    public boolean updateUserByUname(String uname, User user);

//    删除用户
    public boolean deleteUserByUname(String uname);
}
