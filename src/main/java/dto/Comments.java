package dto;

import java.time.LocalDateTime;

public class Comments {
	private int num;
	private String title;
	private String content;
	private  LocalDateTime regtime;
	private int hits;
	private int memberno;
	
	public Comments() {}
	
//	public Board(String writer, String title, String content) {
//		this(0, writer, title, content, "", 0);
////		this.writer = writer;
////		this.title = title;
////		this.content = content;
//	}
//
//	public Board(int num, String writer, String title, String content) {
//		this(num, writer, title, content, "", 0);
//	}
	
	public Comments(int num, String title, String content, LocalDateTime regtime, int hits, int memberno) {
	    this.num = num;
	    this.title = title;
	    this.content = content;
	    this.regtime = regtime;
	    this.hits = hits;
	    this.memberno = memberno;
	}
	
	


	public Comments(int num, String title, String content, LocalDateTime regtime, int hits) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.regtime = regtime;
		this.hits = hits;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}


	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getRegtime() {
		return regtime;
	}

	public void setRegtime(LocalDateTime regtime) {
	    this.regtime = regtime;
	}


	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", writer="  + ", title=" + title + ", content=" + content + ", regtime="
				+ regtime + ", hits=" + hits + "memberno=" +memberno+"]";
	}
	
	
	
}