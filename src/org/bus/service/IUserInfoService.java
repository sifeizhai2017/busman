package org.bus.service;

import org.bus.entity.User;

import java.util.List;

public interface IUserInfoService {
    public boolean addUser(User user);

    public User queryUserByUname(String uname);

    public List<User> queryAllUsers();

    public boolean updateUserByUname(String uname, User user);

    public boolean deleteUserByUname(String uname);
}
