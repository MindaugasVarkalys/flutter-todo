import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter_todo/model/api/response_parser.dart';
import 'package:flutter_todo/model/data/todo.dart';

class ApiClient {
  static const _baseUrl = "https://jsonplaceholder.typicode.com/";
  static const _userId = 1;

  final _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  final ResponseParser responseParser;

  ApiClient(this.responseParser) {
    _dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
  }

  Future<List<Todo>> getTodos() async {
    final response = await _dio
        .get<Iterable<dynamic>>('todos', queryParameters: {"userId": _userId});
    return responseParser.parseTodoList(response.data);
  }

  Future<Todo> addTodo(String title, bool completed) async {
    final response = await _dio.post('todos', data: {
      "userId": _userId,
      "title": title,
      "completed": completed,
    });
    return responseParser.parseTodo(response.data);
  }

  void dispose() {
    _dio.close();
  }
}
