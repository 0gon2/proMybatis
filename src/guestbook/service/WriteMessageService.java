package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.MessageDAO;
import guestbook.MessageVO;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();

	public static WriteMessageService getInstance() {
		return instance;
	}

	private WriteMessageService() {
	}

	public void write(MessageVO message) {
		Connection conn = null;
		try {
			MessageDAO messageDao = MessageDAO.getInstance();
			messageDao.insert(message);
		} catch (SQLException e) {
			throw new ServiceException(
					"메시지 등록 실패: " + e.getMessage(), e);
		} finally {
			if(conn!=null) {
				try {
				conn.rollback();}catch (SQLException e) {
				}
			}
		}
	}

}