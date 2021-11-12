package com.getready.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.getready.dto.ProductVO;

import util.DBManager;

public class ProductDAO {
	
	private ProductDAO() {
	}

	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	//newItems List
	public ArrayList<ProductVO> listNewProduct(){
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from new_pro_view";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setPnum(rs.getInt("pnum"));
				product.setPname(rs.getString("pname"));
				product.setPrice2(rs.getInt("price2"));
				product.setImage(rs.getString("image"));
				
				productList.add(product);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;
	}
	
	//bestItems List
	public ArrayList<ProductVO> listBestProduct(){
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from best_pro_view";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setPnum(rs.getInt("pnum"));
				product.setPname(rs.getString("pname"));
				product.setPrice2(rs.getInt("price2"));
				product.setImage(rs.getString("image"));
				
				productList.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;
	}
	
	//search result by item number
	public ProductVO getProduct(String pnum) {
		ProductVO product = null;
		String sql = "select * from product where pnum=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new ProductVO();
				
				product.setPnum(rs.getInt("pnum"));
				product.setPname(rs.getString("pname"));
				product.setKind(rs.getString("kind"));
				product.setPrice1(rs.getInt("price1"));
				product.setPrice1(rs.getInt("price2"));
				product.setPrice1(rs.getInt("price3"));
				product.setContent(rs.getString("content"));
				product.setImage(rs.getString("image"));
				product.setPuseyn(rs.getString("puseyn"));
				product.setBestyn(rs.getString("bestyn"));
				product.setIndate(rs.getTimestamp("indate"));
			}
			
		}catch(Exception e) {
			
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return product;
	}
	
	public ArrayList<ProductVO> listKindProduct(String kind){
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from product where kink=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setPnum(rs.getInt("pnum"));
				product.setPname(rs.getString("pname"));
				product.setPrice2(rs.getInt("price2"));
				product.setImage(rs.getString("image"));
				productList.add(product);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;
	}
}
