import 'package:fpdart/fpdart.dart' hide Task;

import '../../../shared/enum/enum.dart';
import '../../../shared/error/failure.dart';
import '../../domain/entities/task.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/task_repository.dart';
import '../models/task_model.dart';
import '../models/user_model.dart';
import '../sources/local_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      final models = await localDataSource.getTasks();
      final tasks = models.map((model) => model.toEntity()).toList();
      return Either.right(tasks);
    } catch (e) {
      return Either.left(ServerFailure('Failed to get tasks: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> createTask(Task task) async {
    try {
      final model = TaskModel.fromEntity(task);
      await localDataSource.createTask(model);
      return Either.right(null);
    } catch (e) {
      return Either.left(ServerFailure('Failed to create task: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> createAllTasks(List<Task> tasks) async {
    try {
      final models = tasks.map((task) => TaskModel.fromEntity(task)).toList();
      await localDataSource.createAllTasks(models);
      return Either.right(null);
    } catch (e) {
      return Either.left(ServerFailure('Failed to create all tasks: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(Task task) async {
    try {
      final model = TaskModel.fromEntity(task);
      await localDataSource.updateTask(model);
      return Either.right(null);
    } catch (e) {
      return Either.left(ServerFailure('Failed to update task: $e'));
    }
  }

  @override
  Future<Either<Failure, Task?>> getTaskById(int taskId) async {
    try {
      final model = await localDataSource.getTaskById(taskId);
      final task = model?.toEntity();
      return Either.right(task);
    } catch (e) {
      return Either.left(ServerFailure('Failed to get task by id: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> filterBy({
    String? title,
    List<User> assignees = const [],
    List<TaskPriority> priorities = const [],
  }) async {
    try {
      final models = await localDataSource.filterBy(
        title: title,
        assignees: assignees
            .map((assignee) => UserModel.fromEntity(assignee))
            .toList(),
        priorities: priorities,
      );
      final tasks = models.map((model) => model.toEntity()).toList();
      return Either.right(tasks);
    } catch (e) {
      return Either.left(ServerFailure('Failed to filter tasks: $e'));
    }
  }
}
