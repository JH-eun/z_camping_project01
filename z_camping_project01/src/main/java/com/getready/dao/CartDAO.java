package com.getready.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.getready.dto.CartVO;

import util.DBManager;

public class CartDAO {
	
	private CartDAO() {
		
	}
	
	private static CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
		return instance;
	}
	
	public void insertCart(CartVO cartVO) {
		String sql = "insert into camp_cart(cnum,id,pnum,quantity)" + "values(cart_seq.nextval,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cartVO.getId());
			pstmt.setInt(2, cartVO.getPnum());
			pstmt.setInt(3, cartVO.getQuantity());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}

	public ArrayList<CartVO> listCart(String userId){
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		String sql = "select * from cart_view where id=? order by cnum desc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				CartVO cartVO = new CartVO();
				cartVO.setCnum(rs.getInt(1));
				cartVO.setId(rs.getString(2));
				cartVO.setPnum(rs.getInt(3));
				cartVO.setMname(rs.getString(4));
				cartVO.setPname(rs.getString(5));
				cartVO.setQuantity(rs.getInt(6));
				cartVO.setIndate(rs.getTimestamp(7));
				cartVO.setPrice2(rs.getInt(8));
				cartList.add(cartVO);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return cartList;
	}
	
	public void deleteCart(int cnum) {
		String sql = "delete camp_cart where cnum=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
	
}
