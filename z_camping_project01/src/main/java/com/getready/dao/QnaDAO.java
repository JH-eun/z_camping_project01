package com.getready.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.getready.dto.QnaVO;

import util.DBManager;

public class QnaDAO {
	
	private QnaDAO() {
	}
	
	private static QnaDAO instance = new QnaDAO();
	
	public static QnaDAO getInstance() {
		return instance;
	}
	
	public ArrayList<QnaVO> listQna(String id){
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		String sql = "select * from qna where id=? order by qnanum desc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaVO qnaVO = new QnaVO();
				qnaVO.setQnanum(rs.getInt("qnanum"));
				qnaVO.setSubject(rs.getString("subject"));
				qnaVO.setContent(rs.getString("content"));
				qnaVO.setId(rs.getString("id"));
				qnaVO.setIndate(rs.getTimestamp("indate"));
				qnaVO.setReply(rs.getString("reply"));
				qnaVO.setRep(rs.getString("rep"));
				qnaList.add(qnaVO);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qnaList;
	}
	
	public QnaVO getQna(int num) {
		QnaVO qnaVO = null;
		String sql = "select * from qna where qnaum=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qnaVO = new QnaVO();
				qnaVO.setQnanum(num);
				qnaVO.setSubject(rs.getString("subject"));
				qnaVO.setContent(rs.getString("content"));
				qnaVO.setId(rs.getString("id"));
				qnaVO.setIndate(rs.getTimestamp("indate"));
				qnaVO.setReply(rs.getString("reply"));
				qnaVO.setRep(rs.getString("rep"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qnaVO;
	}
	
	public void insertqna(QnaVO qnaVO, String session_id) {
		String sql = "insert into qna(qnanum, subject, content, id) values(qna_seq.nextval,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qnaVO.getSubject());
			pstmt.setString(2, qnaVO.getContent());
			pstmt.setString(3, session_id);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
	
}
