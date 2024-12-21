package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAOImpl implements BoardDAO {

	@Override
	public List<BoardVO> selectAll() throws Exception {
		
		List<BoardVO> boardList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer ");
		sql.append("     , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("  from t_board ");
		sql.append(" order by no desc ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO(no, title, writer, regDate);
				boardList.add(board);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}

	@Override
	public void insert(BoardVO board) throws Exception {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board(no, title, writer, content) ");
		sql.append(" values(seq_t_board_no.nextval, ?, ?, ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();	
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2,  board.getWriter());
			pstmt.setString(3, board.getContent());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			
		}
		
	}

	@Override
	public BoardVO selectByNo(int boardNo) throws Exception {
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt");
		sql.append(", to_char(reg_date, 'yyyy-mm-dd') reg_date ");
		sql.append(" from t_board ");
		sql.append(" where no = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setInt(1,  boardNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO(no, title, writer, content, viewCnt, regDate);
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public void deleteByNo(int boardNo) throws Exception {
		StringBuilder sql = new  StringBuilder();
		sql.append("delete t_board ");
		sql.append("  where no = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			
				pstmt.setInt(1, boardNo);
				
				int cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void update(BoardVO board) throws Exception {
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board ");
		sql.append("   set title = ?, writer = ?, content = ? ");
		sql.append("   where no = ?");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getWriter());
				pstmt.setString(3, board.getContent());
				pstmt.setInt(4, board.getNo());
				
				int cnt = pstmt.executeUpdate();
				
				if (cnt > 0) {
					System.out.println("변경이될까여");
				}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
