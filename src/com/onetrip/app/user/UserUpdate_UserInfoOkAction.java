package com.onetrip.app.user;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onetrip.action.Action;
import com.onetrip.action.ActionForward;
import com.onetrip.app.user.dao.UserBean;
import com.onetrip.app.user.dao.UserDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserUpdate_UserInfoOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		ActionForward forward = null;
		UserDao u_dao = new UserDao();
		UserBean u_bean = new UserBean();
		// 사진 정보 , 비밀번호, 패스워드 ,이메일, 전화번호 변경


		String saveFolder = "C:\\web4\\workspace\\onetrip\\WebContent\\app\\mypage\\userPhoto";
		int fileSize = 5 * 1024 * 1024; // 5M
		String id = (String)session.getAttribute("session_id");
		u_bean.setUser_id(id);
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
			u_bean.setUser_name((multi.getParameter("user_name")));
			System.out.println(u_bean.getUser_name());
			u_bean.setUser_pw(u_dao.encrypt(multi.getParameter("user_pw")));
			u_bean.setUser_email(multi.getParameter("user_email"));
			u_bean.setUser_address(multi.getParameter("user_address"));
			u_bean.setUser_age(Integer.parseInt(multi.getParameter("user_age")));
			u_bean.setUser_hp(multi.getParameter("user_hp"));
			  Enumeration files = multi.getFileNames();
		        String str =(String)files.nextElement();
		 
		        String filename = multi.getFilesystemName(str);
			//파일 명 변경
			String photoName=u_dao.renameFile(saveFolder,filename, u_bean.getUser_id());
			if(photoName == null) {
				throw new Exception();
			}else {
				u_bean.setUser_photo(photoName);
			}
			// 유저 포토.jpg로 이름만 저장이 되고 실제로 저장 되는 곳은 temp에 사진이 저장되어 jsp내부에서 사진을 찾는다

			u_dao.update_userInfo(u_bean);

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/app/mypage/mypage.jsp");// not
			return forward;
		} catch (Exception e) {
			System.out.println(e);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('유저정보 갱신 실패. 다시 시도해주세요ㅋㅋ');history.back();");
			out.println("</script>");
			out.close();
		}
		return null;
	}

}
