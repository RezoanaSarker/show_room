/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.User;
import com.rezoana.show_room.model.UserRole;
import org.springframework.stereotype.Service;

/**
 *
 * @author User
 */
@Service
public interface Userservice {
    public String acceptUser(User u);

    public String insertUser(User u);

    public String updateUser(User u);

    public String deleteUser(User u);

    public String viewUsers(User u);

    public User viewUser(String s);
}
