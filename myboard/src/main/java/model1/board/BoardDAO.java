package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class BoardDAO extends DBConnPool {
	public BoardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM board";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수 구하다가 예외!!!!!!!!!!!!!!!!!!!!!!!!!!!!!발생~");
			e.printStackTrace();
		}

		return totalCount;
	}

	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<>();

		String query = "SELECT * FROM board";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
		}
		query += " ORDER BY NUM DESC";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("예외조회게스글");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public void updateVisitCount(String num) {
		String query = "UPDATE board SET "
					+ " visitcount=visitcount+1 "
					+ " WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("조회수 증가 에러");
			e.printStackTrace();
		}
	}

	public int insertWrite(BoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO board" + " (num, title, content, id, visitcount)"
					+ " VALUES (seq_board_num.next.val, ?, ?, ?, 0)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외게시물입력 ");
			e.printStackTrace();
		}
		return result;
	}

	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();

		String query = "SELECT B.*, M.name " + " FROM member M INNER JOIN board B " + " ON M.id=B.id " + " WHERE num=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("게시물상세보기예외에러");
			e.printStackTrace();
		}

		return dto;
	}

	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			
			String query = "UPDATE board SET "
						+ " title=?, content=? "
						+ " WHERE num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			rs = psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("수정 중 예외");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "DELETE FROM board WHERE num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("삭제 ㅇ[ㅔ러.");
			e.printStackTrace();
		}
		
		return result;
	}
}