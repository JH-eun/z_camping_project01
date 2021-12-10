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

	// newItems List
//	public ArrayList<ProductVO> listNewProduct() {
//		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
//		String sql = "select * from new_pro_view";
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				ProductVO product = new ProductVO();
//				product.setPnum(rs.getInt("pnum"));
//				product.setPname(rs.getString("pname"));
//				product.setPrice2(rs.getInt("price2"));
//				product.setImage(rs.getString("image"));
//
//				productList.add(product);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		return productList;
//	}

	// bestItems List
//	public ArrayList<ProductVO> listBestProduct() {
//		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
//		String sql = "select * from best_pro_view";
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				ProductVO product = new ProductVO();
//				product.setPnum(rs.getInt("pnum"));
//				product.setPname(rs.getString("pname"));
//				product.setPrice2(rs.getInt("price2"));
//				product.setImage(rs.getString("image"));
//
//				productList.add(product);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		return productList;
//	}

	// search result by item number
	public ProductVO getProduct(String pnum) {
		ProductVO product = null;
		String sql = "select * from camp_product where pnum=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				product = new ProductVO();

				product.setPnum(rs.getInt("pnum"));
				product.setPname(rs.getString("pname"));
				product.setKind(rs.getString("kind"));
				product.setPrice1(rs.getInt("price1"));
				product.setPrice2(rs.getInt("price2"));
				product.setPrice3(rs.getInt("price3"));
				product.setContent(rs.getString("content"));
				product.setImage(rs.getString("image"));
				product.setPuseyn(rs.getString("puseyn"));
				product.setBestyn(rs.getString("bestyn"));
				product.setIndate(rs.getTimestamp("indate"));
			}

		} catch (Exception e) {

		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return product;
	}

	public ArrayList<ProductVO> listKindProduct(String kind) {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from camp_product where kind=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setPnum(rs.getInt("pnum"));
				product.setPname(rs.getString("pname"));
				product.setPrice2(rs.getInt("price2"));
				product.setImage(rs.getString("image"));
				productList.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;
	}

	/*
	 * 관리자 모드 상품관리
	 */
	public int totalRecord(String product_name) {
		int total_pages = 0;
		String sql = "select count(*) from camp_product where pname like '%'||?||'%'";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet pageset = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			if (product_name.equals("")) {
				pstmt.setString(1, "%");
			} else {
				pstmt.setString(1, product_name);
			}
			pageset = pstmt.executeQuery();

			if (pageset.next()) {
				total_pages = pageset.getInt(1);
				pageset.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return total_pages;
	}
	
	static int view_rows = 15;
	static int counts = 15;
	
	//페이지 이동을 위한 메소드
	public String pageNumber(int tpage, String name) {
		String str = "";
		
		int total_pages = totalRecord(name);
		int page_count = total_pages / counts + 1;
		
		if(total_pages % counts == 0) {
			page_count--;
		}
		if(tpage < 1) {
			tpage = 1;
		}
		
		int start_page = tpage - (tpage % view_rows) + 1;
		int end_page = start_page + (counts-1);
		
		if(end_page > page_count) {
			end_page = page_count;
		}
		if(start_page > view_rows) {
			str += "<a href='GetReadyServlet?command=admin_product_list&tpage=1&key="
					+ name + "'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='GetReadyServlet?command=admin_product_list&tpage="
					+ (start_page -1);
			str += "&key=<%=product_name%>'>&lt;</a>&nbsp;&nbsp;";
		}
		
		for(int i = start_page; i <= end_page; i++) {
			if(i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			}else {
				str += "<a href='GetReadyServlet?command=admin_product_list&tpage="
						+ i + "&key=" + name + "'>[" + i + "]</a>&nbsp;&nbsp";
			}
		}
		
		if(page_count > end_page) {
			str += "<a href='GetReadyServlet?command=admin_product_list&tpage="
					+ (end_page + 1) + "&key=" + name + "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='NonageServlet?command=admin_product_list&tpage="
					+ page_count + "&key=" + name + "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}
	
	public ArrayList<ProductVO> listProduct(int tpage, String product_name){
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		
		String str = "select pnum, indate, pname, price1, price2, puseyn, bestyn " +
				" from camp_product where pname like '%'||?||'%' order by pnum desc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int absolutepage = 1;
		
		try {
			conn = DBManager.getConnection();
			absolutepage = (tpage -1) * counts + 1;
			pstmt = conn.prepareStatement(str, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			if(product_name.equals("")) {
				pstmt.setString(1, "%");
			}else {
				pstmt.setString(1, product_name);
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rs.absolute(absolutepage);
				int count = 0;
				
				while(count < counts) {
					ProductVO product = new ProductVO();
					product.setPnum(rs.getInt(1));
					product.setIndate(rs.getTimestamp(2));
					product.setPname(rs.getString(3));
					product.setPrice1(rs.getInt(4));
					product.setPrice2(rs.getInt(5));
					product.setPuseyn(rs.getString(6));
					product.setBestyn(rs.getString(7));
					productList.add(product);
					if(rs.isLast()) {
						break;
					}
					rs.next();
					count++;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;
	}
	
	public int insertProduct(ProductVO product) {
		int result = 0;
		
		String sql = "insert into camp_product (" + 
				"pnum, kind, pname, price1, price2, price3, content, image) " +
				"values(camp_product_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getKind());
			pstmt.setString(2, product.getPname());
			pstmt.setInt(3, product.getPrice1());
			pstmt.setInt(4, product.getPrice2());
			pstmt.setInt(5, product.getPrice3());
			pstmt.setString(6, product.getContent());
			pstmt.setString(7, product.getImage());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public int updateProduct(ProductVO product) {
		int result = -1;
		String sql = "update camp_product set kind=?, puseyn=?, pname=?" + 
				", price1=?, price2=?, price3=?, content=?, image=?, bestyn=? " +
				"where pnum=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getKind());
			pstmt.setString(2, product.getPuseyn());
			pstmt.setString(3, product.getPname());
			pstmt.setInt(4, product.getPrice1());
			pstmt.setInt(5, product.getPrice2());
			pstmt.setInt(6, product.getPrice3());
			pstmt.setString(7, product.getContent());
			pstmt.setString(8, product.getImage());
			pstmt.setString(9, product.getBestyn());
			pstmt.setInt(10, product.getPnum());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	
}
