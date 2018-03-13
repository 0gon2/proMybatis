package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import guestbook.ListVO;
import guestbook.MessageDAO;

public class GetMessageListService {
	private static GetMessageListService instance = new GetMessageListService();

	public static GetMessageListService getInstance() {
		return instance;
	}

	private GetMessageListService() {
	}

	private static final int MESSAGE_COUNT_PER_PAGE = 5;

	public MessageListView getMessageList(int pageNumber,String memberid) {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			MessageDAO messageDao = MessageDAO.getInstance();

			int messageTotalCount = messageDao.selectCount(memberid);

			List<ListVO> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			if (messageTotalCount > 0) {
				firstRow =
						(pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				messageList =
						messageDao.selectList(memberid,firstRow, endRow);
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			return new MessageListView(messageList,
					messageTotalCount, currentPageNumber,
					MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			if(conn!=null) {
				try {
				conn.rollback();}catch (SQLException e) {
				}
			}
		}
	}
}