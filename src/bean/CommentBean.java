package bean;

/**
 * @author Sachin
 *
 */
public class CommentBean {
private String comment;
private String commentId;
private String senderId;
private String reciever;
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}
public String getCommentId() {
	return commentId;
}
public void setCommentId(String commentId) {
	this.commentId = commentId;
}
public String getUserId() {
	return senderId;
}
public void setUserId(String userId) {
	this.senderId = userId;
}
public String getReciever() {
	return reciever;
}
public void setReciever(String recieverId) {
	this.reciever = recieverId;
}

}
