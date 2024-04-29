
---

# Task Manager App

Task Manager App is a simple Flutter application for managing tasks. It allows users to add, delete, and view tasks.

## Features

- **Add Task**: Users can add new tasks with a description.

- **Delete Task**: Users can delete tasks they no longer need.

- **View Tasks**: Users can view a list of all their tasks.

## Technologies Used

- **Flutter**: Cross-platform framework for building mobile applications.

- **Bloc Library**: State management library for Flutter applications.

- **Dart Language**: Programming language used for Flutter development.

## Project Structure

The project follows a standard Flutter project structure.

## Decisions and Assumptions

- **State Management**: The Bloc library is chosen for state management due to its simplicity and scalability for managing state in Flutter applications.

- **In-Memory Storage**: For simplicity, an in-memory storage mechanism is used to store tasks. This was chosen instead of a database for its ease of implementation in a small-scale application.

- **Use Cases**: The project follows a use case-driven architecture, separating business logic from presentation logic. Each use case represents a specific user action (e.g., adding a task, deleting a task) and is responsible for coordinating the necessary operations.

- **Assumptions**:

 - The user interface is kept minimal for demonstration purposes. Additional features such as task prioritization, due dates, and categories could be added in future iterations.

 - Error handling, logging and validation are assumed to be implemented. In a production-level application, thorough error handling and input validation would be necessary.

## Getting Started

1\. Clone the repository:

```bash

git clone https://github.com/your-username/task-manager.git

```

2\. Navigate to the project directory:

```bash

cd task-manager

```

3\. Install dependencies:

```bash

flutter pub get

```

4\. Run the application:
```bash

flutter run

```
---
