package com.soodagram.soodagram.search.domain;

public class SearchVO {
	
	String keyword;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchVO [keyword=" + keyword + "]";
	}
	
	
}
