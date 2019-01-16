/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rezoana.show_room.dao;

import com.rezoana.show_room.model.Showroom;
import org.springframework.stereotype.Service;

/**
 *
 * @author Rezwana
 */
@Service
public interface ShowroomService {

    public String insertShowroom(Showroom sr);

    public String updateShowroom(Showroom sr);

    public String deleteShowroom(String id);

    public String viewShowroom();

    public Showroom viewOneShowroom(String id);

}
