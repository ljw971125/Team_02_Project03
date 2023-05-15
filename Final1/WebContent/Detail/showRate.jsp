<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reviewPage.*"%>
<%@ page import="java.util.*" %>


<%!
public String getStars(float rate) {
    int numStars;
    if (rate <1){
    	numStars = 0;
    }
    else if (rate < 2) {
        numStars = 1;
    } else if (rate < 3) {
        numStars = 2;
    } else if (rate < 4) {
        numStars = 3;
    } else if (rate < 5) {
        numStars = 4;
    } else {
        numStars = 5;
    }
    
    String stars = "";
    if(numStars==0){
    	stars += "☆";
    }
    else{
	    for (int i = 0; i < numStars; i++) {
	        stars += "★";
	    }
    }
    return stars;
}
%>
</head>
</html>