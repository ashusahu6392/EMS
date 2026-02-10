# Employee Management System (EMS)

[![Build Status](https://img.shields.io/github/actions/workflow/status/ashusahu6392/EMS/maven-publish.yml?branch=master)](https://github.com/ashusahu6392/EMS/actions)
[![Language](https://img.shields.io/github/languages/top/ashusahu6392/EMS)](https://github.com/ashusahu6392/EMS)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)



A clean, production-oriented **Employee Management System (EMS)** — a Java web application using Servlets, JSP, Hibernate (JPA), and MySQL. Designed to be easy to run locally and simple to extend for learning or portfolio use.

---

## Demo

![](docs/demo-placeholder.png)

> Replace `docs/demo-placeholder.png` with real screenshots (place them inside the `docs/` folder).

---

## Why this repo looks professional

This repository includes everything a hiring manager or peer reviewer expects:

* A clear, concise README with quick start and architecture overview
* CI pipeline to run `mvn test` (GitHub Actions)
* Standard `.gitignore` and a `LICENSE` (MIT)
* CONTRIBUTING and templates for Issues / PRs
* Screenshots and example `WAR` deployment instructions

---

## Features

* Create / Read / Update / Delete employee records
* Simple UI built with Bootstrap
* Persistence with Hibernate (JPA) and MySQL
* Clear servlet mappings (web.xml) for compatibility with Tomcat

---

## Tech stack

* Java 11+
* Jakarta Servlet / JSP
* Hibernate (JPA)
* MySQL / MariaDB
* Maven
* Apache Tomcat 9/10
* Bootstrap (frontend)

---

## Quick start (local)

### Prerequisites

* Java 11+ and `JAVA_HOME` set
* Maven 3.6+
* MySQL server running
* Apache Tomcat installed (optional — you can also use `mvn tomcat7:run` or `mvn jetty:run` if configured)

### Setup

1. Clone the repo

```bash
git clone https://github.com/<YOUR_GITHUB_USERNAME>/<REPO_NAME>.git
cd <REPO_NAME>
```

2. Configure database in `src/main/resources/hibernate.cfg.xml` (or your `HibernateUtil`):

```xml
<property name="hibernate.connection.url">jdbc:mysql://localhost:3306/ems_db?useSSL=false&serverTimezone=UTC</property>
<property name="hibernate.connection.username">root</property>
<property name="hibernate.connection.password">your_password</property>
```

3. Create the database (example):

```sql
CREATE DATABASE ems_db;
```

4. Build and package the WAR

```bash
mvn clean package
```

5. Deploy the generated `target/*.war` to Tomcat `webapps/` and start Tomcat.

6. Open `http://localhost:8080/<context-path>/`

---

## Development (run with embedded Tomcat / Jetty)

If you want quicker local dev, add a plugin to `pom.xml` (Tomcat or Jetty plugin) and run:

```bash
mvn tomcat7:run
# or
mvn jetty:run
```

---

## Running tests

If you add JUnit or integration tests, run:

```bash
mvn test
```

---

## Recommended repository files (add these to root)

### `.gitignore` (Java / Maven)

```gitignore
# Java
*.class
*.jar
*.war
*.ear

# Maven
target/
!.mvn/wrapper/maven-wrapper.jar

# Eclipse / IntelliJ
*.iml
.idea/
.project
.classpath
.settings/

# Temporary
.DS_Store
logs/
*.log

# Database
*.sql
```

### `LICENSE` (MIT)

```
MIT License

Copyright (c) 2026 <Ashu Sahu>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:


```

### `CONTRIBUTING.md` (short)

```markdown
# Contributing

Thanks for your interest! To contribute:

1. Fork the repo
2. Create a feature branch: `git checkout -b feature/name`
3. Commit: `git commit -m "Short description"`
4. Push and open a PR

Please follow existing code style and include tests where applicable.
```

### Issue & PR templates (place under `.github/ISSUE_TEMPLATE` and `.github/PULL_REQUEST_TEMPLATE`)

**Bug report template** (issue):

```markdown
---
name: Bug report
about: Create a report to help us improve
---

**Describe the bug**

Steps to reproduce:
1. ...
2. ...

**Expected behavior**

**Environment**
- Java: ...
- Tomcat: ...
- Database: ...
```

**Pull request template**:

```markdown
## Summary

What does this change do?

## Type of change
- Bug fix / feature / docs

## Checklist
- [ ] My code follows the project style
- [ ] I added tests where applicable
```

---

## CI: GitHub Actions (recommended)

Create `.github/workflows/maven.yml` with the following content to run `mvn -B -DskipTests=false test` on pushes/PRs:

```yaml
name: Java CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v4
    - name: Set up JDK 17
      uses: actions/setup-java@v4
      with:
        java-version: '17'
        distribution: 'temurin'
    - name: Cache Maven packages
      uses: actions/cache@v4
      with:
        path: ~/.m2/repository
        key: ${{ runner.os }}-maven-${{ hashFiles('**/pom.xml') }}
        restore-keys: |
          ${{ runner.os }}-maven-
    - name: Build with Maven
      run: mvn -B clean package --file pom.xml
```

---

## Code style & tips

* Use meaningful servlet names and keep controllers thin — move DB logic to DAO/Repository classes.
* Keep JSPs lean: prefer JSTL and avoid Java scriptlets (`<% %>`).
* Use prepared statements / parameter binding and validate user input.

---

## How I can help (optional next steps I can do for you)

If you want, I can:

* Add the GitHub Actions YAML directly to your repo content here
* Generate a polished `.gitignore`, `LICENSE` and `CONTRIBUTING.md` files
* Create screenshot placeholders and optimize README badges

---

## Contact

For questions or portfolio requests, email: `Ashusahu6392@gmil.com`.


