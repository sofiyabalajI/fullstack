PetStore Application

A simple full-stack PetStore application built using Angular, Spring Boot, and MySQL.

The project contains three main parts:

- Frontend – Angular
- Backend – Spring Boot
- Database – MySQL

Project Structure

PetStore
: frontend     # Angular application       :backend       # Spring Boot application
:database     # MySQL schema

Database Setup

The database schema is available in the "database" folder.

1. Open MySQL or MySQL Workbench.
2. Create a database if required.
3. Import the SQL file provided in the "database" folder.
4. Make sure the database name, username, and password match the configuration in the Spring Boot backend.

You can import the SQL file using MySQL Workbench or by running:

source path/to/petstore.sql;

Backend Setup

The backend is developed using Spring Boot.

Go to the backend folder:

cd backend

Start the Spring Boot server using:

mvn spring-boot:run

The backend server will start on the configured Spring Boot port, usually:

http://localhost:8080

Make sure MySQL is running before starting the backend.

Frontend Setup

The frontend is developed using Angular.

Go to the frontend folder:

cd frontend

Install the required dependencies:

npm install

Start the Angular development server:

ng serve

The Angular application will usually be available at:

http://localhost:4200

Running the Application

To run the complete application:

1. Start MySQL and import the database schema.
2. Start the Spring Boot backend.
3. Start the Angular frontend.
4. Open the Angular URL in your browser.

Frontend  →  http://localhost:4200
Backend   →  http://localhost:8080
Database  →  MySQL

The Angular frontend communicates with the Spring Boot backend through REST APIs, and the backend handles communication with the MySQL database.

Technologies Used

- Angular
- Spring Boot
- Java
- MySQL
- REST API
- HTML
- CSS
- TypeScript

Note

Make sure Java, Maven, Node.js, Angular CLI, and MySQL are installed on your system before running the project.
