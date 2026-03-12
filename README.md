# damnVulnerableApp

A vulnerable web app with intentional security flaws designed to demonstrate and train developers on common web application vulnerabilities including SQL Injection, Cross-Site Scripting (XSS), and CSRF.

> ⚠️ **WARNING: This app is intentionally vulnerable. Never deploy it on a public server or production environment. Use only in a local/controlled environment.**

---

## Prerequisites

Make sure you have the following installed:
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Java JDK 11](https://www.java.com)
- [Maven](https://maven.apache.org)

On Mac you can install Java and Maven with Homebrew:
```bash
brew install openjdk@11
brew install maven
```

Add Java to your PATH:
```bash
echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

---

## Getting Started

**Step 1: Clone the repository**
```bash
git clone https://github.com/interactSachin/damnVulnerableApp.git
cd damnVulnerableApp
```

**Step 2: Build the WAR file**
```bash
mvn clean package
```

**Step 3: Start Docker Desktop**, then run:
```bash
docker-compose up --build
```

**Step 4: Access the app**
```
http://localhost:8080/HackMe/index.jsp
```

---

## Stopping the App
```bash
docker-compose down
```

To also remove the database volume:
```bash
docker-compose down -v
```

---

## Restarting After First Run

No need to rebuild every time. Just run:
```bash
docker-compose up
```

---

## Application Workflows

**1. Login**
Regular employees and privileged users (CEO/Accounts) have separate login pages with different security checks.

**2. Profile Dashboard**
After login, users land on a role-based dashboard showing their account balance and personal details.

**3. Comment Wall**
Users can send and receive messages with other employees, and can clear their inbox.

**4. Fund Transfers**
Users can transfer money to other employees by specifying a recipient and amount.

**5. Logout**
Ends the session and redirects back to the login page.

---

## Vulnerabilities Included

| Vulnerability | Location |
|---|---|
| SQL Injection | `src/dao/UserDao.java` |
| Cross-Site Scripting (XSS) | `src/dao/CommentDao.java` |
| SQL Injection (second order) | `src/dao/PrivilegedUser.java` |
| Hardcoded Credentials | `src/bean/Provider.java` |
| Plaintext Passwords | Database |

---

## Tech Stack

- Java Servlets / JSP
- Apache Tomcat 9
- MySQL 5.7
- Docker
