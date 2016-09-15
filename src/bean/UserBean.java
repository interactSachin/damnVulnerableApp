package bean;

/**
 * @author Sachin
 *
 */
public class UserBean {
private String name;
private String id;
private String email;
private String balance;
private String password;
private long lastLogon;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getBalance() {
	return balance;
}
public void setBalance(String balance) {
	this.balance = balance;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public long getLastLogon() {
	return lastLogon;
}
public void setLastLogon(long lastLogon) {
	this.lastLogon = lastLogon;
}
}
