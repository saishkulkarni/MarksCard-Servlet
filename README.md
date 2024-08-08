# MarksCard-Servlet

MarksCard-Servlet is a web application for managing student marks and generating mark cards. It's built using Java Servlets, JSP, and follows a DAO (Data Access Object) pattern for database operations.

## Features

- User Authentication (Student and Teacher login)
- Student Registration
- Add and Update Marks
- View Mark Cards
- Teacher Approval for Marks
- Session Management

## Technologies Used

- Java Servlets
- JavaServer Pages (JSP)
- JDBC for database operations
- HTML/CSS for frontend
- MySQL Database

## Project Structure

The project follows a standard Maven structure:

- `src/main/java`: Contains Java source files
  - `controller`: Servlet classes for handling HTTP requests
  - `dao`: Data Access Object classes for database operations
  - `dto`: Data Transfer Object classes representing database entities
- `src/main/webapp`: Contains web resources
  - `WEB-INF`: Configuration files
  - JSP files for views

## Setup and Installation

1. Clone the repository:

2. Set up a MySQL database and update the connection details in `StudentDao.java` and `MarksCardDao.java`.

3. Import the project into your preferred IDE (Eclipse, IntelliJ IDEA, etc.).

4. Configure your server (e.g., Apache Tomcat) in your IDE.

5. Build and run the project on your server.

## Usage

1. Access the application through your web browser.
2. Register as a new student or log in as an existing user.
3. Students can add marks, view mark cards, and update their information.
4. Teachers can approve marks and manage student records.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Contact

For any queries, please contact [Saish](mailto:saishkulkarni7@gmail.com).
