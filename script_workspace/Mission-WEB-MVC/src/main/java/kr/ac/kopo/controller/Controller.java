package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Controller {
	
	String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
