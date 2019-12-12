package org.bus.service.impl;

import org.bus.dao.IUserInfoDao;
import org.bus.dao.impl.UserInfoDaoImpl;
import org.bus.entity.User;
import org.bus.service.IUserInfoService;

import java.util.List;

//业务逻辑层：逻辑性的增删改查（增：查+增），对dao层进行的组装
public class UserInfoServiceImpl implements IUserInfoService {
    IUserInfoDao userInfoDao = new UserInfoDaoImpl();

    @Override
    public boolean addUser(User user) {
        if (!userInfoDao.isExist(user.getUname())) {
            userInfoDao.addUser(user);
            return true;
        } else {
            System.out.println("此人已经存在");
            return false;
        }
    }

    @Override
    public User queryUserByUname(String uname) {
        return userInfoDao.queryUserByUname(uname);
    }

    @Override
    public List<User> queryAllUsers() {
        return userInfoDao.queryAllUsers();
    }

    @Override
    public boolean updateUserByUname(String uname, User user) {
        if (userInfoDao.isExist(uname)) {
            return userInfoDao.updateUserByUname(uname, user);
        } else {
            return false;
        }
    }

    @Override
    public boolean deleteUserByUname(String uname) {
        return userInfoDao.deleteUserByUname(uname);
    }
}
