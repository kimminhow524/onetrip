<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.onetrip.app.com_apply.dao.Com_Apply_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	Com_Apply_DAO dao = new Com_Apply_DAO();
	List<HashMap<String, String>> myAcomList = dao.getMemberAcomList((String) session.getAttribute("session_id"));
// 	List<HashMap<String, String>> myAcomList = dao.getMemberAcomList("test2");
	HashMap<String, Object> map = new HashMap<String, Object>();
	if (myAcomList.isEmpty()) {
		out.println("null");
	} else {
		map.put("myAcomList", myAcomList);
		JSONObject jsonObject = new JSONObject();
		jsonObject.putAll(map);
		out.println(jsonObject);
	}
%>

