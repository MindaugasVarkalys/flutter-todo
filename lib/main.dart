import 'package:flutter_todo/bloc/todo_bloc.dart';
import 'package:flutter_todo/model/api/api_client.dart';
import 'package:flutter_todo/model/api/response_parser.dart';
import 'package:flutter_todo/model/repository/todo_repository.dart';
import 'package:get_it/get_it.dart';

void main() {
  registerDependencies();
  // runApp(const App());
}

void registerDependencies() {
  final getIt = GetIt.I;
  getIt.registerFactory(() => ResponseParser());
  getIt.registerLazySingleton(() => ApiClient(getIt.get()),
      dispose: (client) => client.dispose());
  getIt.registerFactory(() => TodoRepository(getIt.get()));
  getIt.registerLazySingleton(() => TodoBloc(getIt.get()));
}