# TaskZen

A collaborative task management app where users can create, assign, and manage tasks across different stages (To Do, In Progress, Done). 

## Clean Architecture
![Clean Architecture](https://github.com/DevyankShaw/taskzen/blob/main/images/clean_architecture.svg)

## Folder Structure
![Folder Structure](https://github.com/DevyankShaw/taskzen/blob/main/images/folder_structure.svg)

## Demo

https://github.com/user-attachments/assets/7b884662-eb8a-404b-a566-a834b5af6256

## Requirements
- [x] Task Board: List tasks by status with grouped sections. 
- [x] Task Creation/Edit: A Modal or screen with fields like title, assignee, deadline, priority, and status. 
- [x] Team Management: Use a mock list of team members.
- [x] Search & Filter: Implement by task name, assignee, or priority. 
- [x] State Management: Use BLoC for business logic and Riverpod for UI states.
- [x] Architecture: Follow clean architecture principles.
- [x] Testing: Include at least one unit test and one widget test.
- [x] Bonus: Handle offline mode with local storage (optional)

## Challenge Approach (Daywise)

Day 8 | 20/7/25 | 4 Hr
   - Wrote necessary queries and completed binding activities required for the isar/local db integration.
   - Fixed an ANR issue by converting ref.watch to ref.read for the providers, which caused.
   - Widget test case broke due to converting Provider to FutureProvider. Resolved by mocking that provider.

Day 7 | 19/7/25 | 4 Hr
   - Resolved dependencies conflict by lowering the isar version and moving the analyzer dependency under dependency_overrides
   - isar namespace issue occurred during the gradle build. Fixed with the help of Stack Overflow
   - Continued with a few implementations

Day 6 | 4/7/25 | 3 Hr
   - Tried to make local storage (isar) workable, but a dependency conflict arose which will require some more time to resolve
   - Finally done some cleaning up and streamlined activities

Day 5 | 3/7/25 | 6 Hr
   - Added unit test for two blocs and widget test for one widget
   - Initially, I found myself stuck on setting up mock responses for use cases/repositories being invoked inside bloc event handlers. Later, resolved by changing the package to Mocktail from Mockito

Day 4 | 2/7/25 | 3 Hr
   - Trying to implement offline mode using [Isar](https://pub.dev/packages/isar) as local storage. Facing a few challenges in binding it with the existing structure.
   - [PR](https://github.com/DevyankShaw/taskzen/pull/1) raised with initial implementation

Day 3 | 1/7/25 | 5 Hr
   - Implementing search and filter functionality is a bit of decision-making, especially keeping track of searched/filtered keywords, whether using Bloc or Riverpod. But finally, make it using Riverpod, which was even testable
   - Setting up Bloc Observer was helpful in debugging, as it showed what event and its input are being executed

Day 2 | 29/6/25 | 11 Hr
   - Started with the implementation of the task board page UI, following up with entities, repositories, use cases, local storage (mock data), and finally binding Bloc with Riverpod
   - Understand the importance of [Either](https://codewithandrea.com/articles/functional-error-handling-either-fpdart/), which makes it easy and enforceable for error handling at compile time
   - Applied the same strategy to implement the task form page to create/update a task

Day 1 | 28/6/25 | 4 Hr
   - List down the task and its subtasks to get started with the challenge, like a high-level breakdown of features, entities, etc
   - Learned the riverpod with integration steps and thinking of how to bind Bloc (Business Logic) with Riverpod (UI States) 
   - Revisited clean architecture and defined the folder structure following its principles. 

## Tools
- AI (ChatGPT, Claud, Gemini)
- Packages (Refer pubspec.yaml)
- Flutter & Dart
- VS Code

