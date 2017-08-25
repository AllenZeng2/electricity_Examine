package com.dlxj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlxj.dao.PoleDao;
import com.dlxj.entity.Pole;
import com.dlxj.service.PoleService;

@Service
public class PoleServiceImpl implements PoleService{

	@Autowired
	private PoleDao pd;

	public PoleDao getPd() {
		return pd;
	}

	public void setPd(PoleDao pd) {
		this.pd = pd;
	}

	@Override
	public int addPole(Pole p) {
		// TODO Auto-generated method stub
		System.out.println("service²ãµÄpole"+p.toString());
		return pd.addPole(p);
	}
	
	
	
	
	
	
	
	
}
