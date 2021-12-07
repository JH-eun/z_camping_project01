package com.getready.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.getready.dto.CartVO;
import com.getready.dto.OrderVO;

import util.DBManager;

public class OrderDAO {

	private OrderDAO() {

	}

	private static OrderDAO instance = new OrderDAO();

	public static OrderDAO getInstance() {
		return instance;
	}

	public int insertOrder(ArrayList<CartVO> cartList, String id) {
		int maxOnum = 1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		try {

			conn = DBManager.getConnection();
			String selectMaxOnum = "select max(onum) from camp_orders";
			pstmt = conn.prepareStatement(selectMaxOnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxOnum += rs.getInt(1) ;
			}
			pstmt.close();

			String insertOrder = "insert into camp_orders(onum, id) values(" + "camp_orders_seq.nextval, ?)";
			pstmt = conn.prepareStatement(insertOrder);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

			for (CartVO cartVO : cartList) {
				insertOrderDetail(cartVO, maxOnum);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return maxOnum;
	}

	public void insertOrderDetail(CartVO cartVO, int maxOnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();

			String insertOrderDetail = "insert into camp_order_detail(odnum, onum, "
					+ "pnum, quantity) values(camp_order_detail_seq.nextval, ?,?,?)";

			pstmt = conn.prepareStatement(insertOrderDetail);
			//pstmt.setInt(1, maxOnum);
			pstmt.setInt(1, maxOnum);
			pstmt.setInt(2, cartVO.getPnum());
			pstmt.setInt(3, cartVO.getQuantity());
			pstmt.executeUpdate();
			pstmt.close();

			String updateCartResult = "update camp_cart set result='2' where cnum=?";
			pstmt = conn.prepareStatement(updateCartResult);
			pstmt.setInt(1, cartVO.getCnum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public ArrayList<OrderVO> listOrderById(String id, String result, int onum) {
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
//		String sql = "select * from order_view where id=? and result like '%||?||%' and onum=?";

		String sql = "select * from order_view where id=? "
				+ "and result like '%'||?||'%' and onum=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, result);
			pstmt.setInt(3, onum);
			rs = pstmt.executeQuery();

//			while (rs.next()) {
//				OrderVO orderVO = new OrderVO();
//				orderVO.setOdnum(rs.getInt("odnum"));
//				orderVO.setOnum(rs.getInt("onum"));
//				orderVO.setId(rs.getString("id"));
//				orderVO.setIndate(rs.getTimestamp("indate"));
//				orderVO.setMname(rs.getString("name"));
//				orderVO.setPostal_code(rs.getString("postal_code"));
//				orderVO.setAddress(rs.getString("address"));
//				orderVO.setPhone(rs.getString("phone"));
//				orderVO.setPnum(rs.getInt("pnum"));
//				orderVO.setQuantity(rs.getInt("quantity"));
//				orderVO.setPname(rs.getString("pname"));
//				orderVO.setPrice2(rs.getInt("price2"));
//				orderVO.setResult(rs.getString("result"));
//				orderList.add(orderVO);
//			}
			while (rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setOdnum(rs.getInt(1));
				orderVO.setOnum(rs.getInt(2));
				orderVO.setId(rs.getString(3));
				orderVO.setIndate(rs.getTimestamp(4));
				orderVO.setMname(rs.getString(5));
				orderVO.setPostal_code(rs.getString(6));
				orderVO.setAddress(rs.getString(7));
				orderVO.setPhone(rs.getString(8));
				orderVO.setPnum(rs.getInt(9));
				orderVO.setPname(rs.getString(10));
				orderVO.setQuantity(rs.getInt(11));
				orderVO.setPrice2(rs.getInt(12));
				orderVO.setResult(rs.getString(13));
				orderList.add(orderVO);
//				System.out.println(orderVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return orderList;
	}

	public ArrayList<Integer> selectNumOrdering(String id) {
		ArrayList<Integer> onumList = new ArrayList<Integer>();
//		String sql = "select distinct onum from order_view where id=? and result='1' order by onum desc";

		String sql = "select distinct onum from order_view "
				+ "where id=? and result='1' order by onum desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				onumList.add(rs.getInt(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return onumList;
	}

	/*
	 * 관리자 모드 주문관리
	 */
	public ArrayList<OrderVO> listOrder(String member_name) {
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		String sql = "select * from order_view where name like '%'||?||'%'" + "order by result, onum desc";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			if (member_name == "") {
				pstmt.setString(1, "%");
			} else {
				pstmt.setString(1, member_name);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setOdnum(rs.getInt("odnum"));
				orderVO.setOnum(rs.getInt("onum"));
				orderVO.setId(rs.getString("id"));
				orderVO.setIndate(rs.getTimestamp("indate"));
				orderVO.setMname(rs.getString("name"));
				orderVO.setPostal_code(rs.getString("postal_code"));
				orderVO.setAddress(rs.getString("address"));
				orderVO.setPhone(rs.getString("phone"));
				orderVO.setPnum(rs.getInt("pnum"));
				orderVO.setPname(rs.getString("pname"));
				orderVO.setQuantity(rs.getInt("quantity"));
				orderVO.setPrice2(rs.getInt("price2"));
				orderVO.setResult(rs.getString("result"));
				orderList.add(orderVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return orderList;
	}

	public void updateOrderResult(String onum) {
		String sql = "update camp_order_detail set result='2' where odnum=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, onum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

}
