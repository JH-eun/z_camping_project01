package com.getready.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.getready.dto.AddressVO;

import util.DBManager;

public class AddressDAO {
	private AddressDAO() {
	}
	
	private static AddressDAO instance = new AddressDAO();
	
	public static AddressDAO getInstance() {
		return instance;
	}
	
	public ArrayList<AddressVO> selectAddressByGil(String gil){
		ArrayList<AddressVO> list = new ArrayList<AddressVO>();
		
		String sql = "select * from camp_address where gil like '%'||?||'%";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gil);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AddressVO addressVO = new AddressVO();
				addressVO.setPostar_code(rs.getString("postal_code"));
				addressVO.setSido(rs.getString("sido"));
				addressVO.setGugun(rs.getString("gugun"));
				addressVO.setGil(rs.getString("gil"));
				addressVO.setRo(rs.getString("ro"));
				
				list.add(addressVO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
