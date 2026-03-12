# damnVulnerableApp

A vulnerable web app with intentional security flaws designed to demonstrate and train developers on common web application vulnerabilities including SQL Injection, Cross-Site Scripting (XSS), and CSRF.

> ⚠️ **WARNING: This app is intentionally vulnerable. Never deploy it on a public server or production environment. Use only in a local/controlled environment.**

---

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Java JDK 11](https://www.java.com)
- [Maven](https://maven.apache.org)
- [Git](https://git-scm.com)

---

## Setup Instructions

### Mac

**Install dependencies:**
```bash
brew install openjdk@11 maven git
echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Verify:**
```bash
java -version
mvn -version
git --version
```

---

### Windows

**Install dependencies:**
```bash
winget install Git.Git
winget install Apache.Maven
winget install Microsoft.OpenJDK.11
```

**Add Maven and Java to PATH:**
1. Open **Start → Search "Environment Variables"**
2. Click **Environment Variables**
3. Under **System Variables** find **Path** and click **Edit**
4. Add the following:
   - `C:\Program Files\Maven\bin`
   - `C:\Program Files\Microsoft\jdk-11\bin`
5. Click **OK** and restart your terminal

**Verify:**
```cmd
java -version
mvn -version
git --version
```

---

### Linux (Ubuntu/Debian)

**Install dependencies:**
```bash
sudo apt update
sudo apt install -y git maven openjdk-11-jdk
```

**Verify:**
```bash
java -version
mvn -version
git --version
```

---

### Linux (Fedora/RHEL)

**Install dependencies:**
```bash
sudo dnf install -y git maven java-11-openjdk
```

**Verify:**
```bash
java -version
mvn -version
git --version
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
