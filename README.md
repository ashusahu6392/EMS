# Employee Management System (EMS)

A simple web-based Employee Management System built with Java Servlets, JSP, Hibernate (JPA), and MySQL. It provides basic CRUD functionality to manage employee records — add, view, update and delete employees — and is packaged as a Maven web application deployable to Apache Tomcat.

---

## Table of Contents

* [Demo](#demo)
* [Features](#features)
* [Tech Stack](#tech-stack)
* [Prerequisites](#prerequisites)
* [Project Structure (overview)](#project-structure-overview)
* [Database Setup](#database-setup)
* [Configuration](#configuration)
* [Build & Run](#build--run)
* [Servlets / URL mapping](#servlets--url-mapping)
* [Usage](#usage)
* [Testing](#testing)
* [Troubleshooting](#troubleshooting)
* [Contributing](#contributing)
* [License](#license)
* [Credits / Acknowledgements](#credits--acknowledgements)

---

## Demo

*(Add screenshots or GIFs here — place images in the `docs/` or `assets/` folder and reference them.)*

---

## Features

* Add new employee records (first name, last name, email, phone, etc.)
* List all employees with pagination/sorting (if implemented)
* Update employee details
* Delete employee by `emp_id`
* Basic validation on input fields
* Uses Hibernate for ORM and MySQL as the database

---

## Tech Stack

* Java (Servlet API / Jakarta Servlet)
* JSP (JavaServer Pages)
* Hibernate (JPA) for ORM
* MySQL (or MariaDB) for persistent storage
* Maven for build management
* Apache Tomcat as the servlet container
* Bootstrap for UI styling

---

## Prerequisites

* JDK 11+ installed and `JAVA_HOME` configured
* Maven 3.6+
* MySQL Server (or MariaDB)
* Apache Tomcat 9/10 (matching Servlet API used)

---

## Project Structure (overview)

```
ems-project/
├─ src/main/java/           # Servlets, utils, entity classes
│  ├─ com.app.entity/       # Employee entity
│  ├─ com.app.servlet/      # Servlets (Create, Read, Update, Delete)
│  └─ com.app.util/         # HibernateUtil, DB helpers
├─ src/main/webapp/         # JSPs, static assets
│  ├─ WEB-INF/
│  │  └─ web.xml            # servlet mappings (if using web.xml)
│  ├─ assets/               # css, js, images
│  └─ *.jsp                 # HomePage.jsp, view.jsp, update.jsp, etc.
├─ pom.xml                  # Maven configuration
└─ README.md
```

---

## Database Setup

Create the database and the `employees` table. Example SQL for MySQL:

```sql
CREATE DATABASE ems_db;
USE ems_db;

CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  fname VARCHAR(100) NOT NULL,
  lname VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE,
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Adjust columns to match your `Employee` entity fields.

---

## Configuration

### Hibernate (example `hibernate.cfg.xml`)

```xml
<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE hibernate-configuration PUBLIC
        "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
        "http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
  <session-factory>
    <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
    <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/ems_db?useSSL=false&amp;serverTimezone=UTC</property>
    <property name="hibernate.connection.username">root</property>
    <property name="hibernate.connection.password">your_password</property>
    <property name="hibernate.dialect">org.hibernate.dialect.MySQL8Dialect</property>

    <!-- show sql during development -->
    <property name="hibernate.show_sql">true</property>
    <property name="hibernate.hbm2ddl.auto">validate</property> <!-- use 'update' or 'create' only in dev -->

    <!-- Mapping class -->
    <mapping class="com.app.entity.Employee" />
  </session-factory>
</hibernate-configuration>
```

**Important:** Replace `your_password` with your DB password and update the JDBC URL if needed.

---

## Build & Run

### 1. Build the project

```bash
mvn clean package
```

This produces a WAR file under `target/` (for example `ems.war`).

### 2. Deploy to Tomcat

* Copy the WAR file to Tomcat's `webapps/` directory and start Tomcat.
* Or deploy via Tomcat Manager UI.

### 3. Access the app

Open in browser: `http://localhost:8080/<context-path>/` (replace `<context-path>` with your WAR name or configured context)

---

## Servlets / URL mapping

If you're using `web.xml` (you said you prefer no annotations), include mappings like this:

```xml
<web-app ...>
  <servlet>
    <servlet-name>FirstServlet</servlet-name>
    <servlet-class>com.app.FirstServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>FirstServlet</servlet-name>
    <url-pattern>/FirstServlet</url-pattern>
  </servlet-mapping>

  <servlet>
    <servlet-name>ListEmployees</servlet-name>
    <servlet-class>com.app.ListEmployeesServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>ListEmployees</servlet-name>
    <url-pattern>/ListEmployees</url-pattern>
  </servlet-mapping>

  <servlet>
    <servlet-name>DeleteServlet</servlet-name>
    <servlet-class>com.app.DeleteServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>DeleteServlet</servlet-name>
    <url-pattern>/DeleteServlet</url-pattern>
  </servlet-mapping>

  <!-- Add other mappings (UpdateServlet, ShowEmployee, etc.) -->
</web-app>
```

Replace class names and URL patterns with the ones used in your project.

---

## Usage

* **Add Employee:** Navigate to `AddEmployee.jsp` or use the "Add" form on the home page.
* **List Employees:** `ListEmployees` servlet / `view.jsp` shows all employees.
* **Update Employee:** Click "Edit" next to a record or submit the update form to `UpdateServlet`.
* **Delete Employee:** Submit `emp_id` to `DeleteServlet` to remove a record. The UI can show a success message on the right side of the page as feedback.

*(Include example screenshots and sample requests if you like.)*

---

## Testing

* Manual testing through the UI (forms, edit, delete)
* Unit tests: consider adding JUnit tests for utility classes and DAO methods
* Integration tests: test Hibernate interactions against a test database

---

## Troubleshooting

* `ClassNotFoundException: com.mysql.cj.jdbc.Driver` — add MySQL JDBC driver dependency in `pom.xml`.
* `Connection refused` — check MySQL is running and the JDBC URL/credentials are correct.
* `HTTP 404` on servlet — confirm `web.xml` mappings and WAR context path.

---

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "Add some feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a pull request

Please follow coding conventions and include helpful commit messages.

---

## License

This project is released under the MIT License. See `LICENSE` file for details.

---

## Credits / Acknowledgements

* Built using examples and docs for Java Servlets, JSP, and Hibernate
* UI uses Bootstrap (link to CDN can be found in JSP header)

---

## Contact

If you have questions or want to report issues, open a GitHub issue or contact: `your-email@example.com` (replace with your email).

---

*Happy coding!*
