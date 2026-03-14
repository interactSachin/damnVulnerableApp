/* damnVulnerableApp - A vulnerable web app for security training
 * Copyright (C) 2024 Sachin Singh
 * Licensed under GNU GPL v3.0 - see LICENSE file for details
 */
package bean;

public interface Provider {
String DRIVER="com.mysql.cj.jdbc.Driver";
String CONNECTION_URL="jdbc:mysql://db:3306/testdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
String USERNAME="root";
String PASSWORD="db123!@#qwe";
}
