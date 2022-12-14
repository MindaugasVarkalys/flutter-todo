abstract class ApiData<T> {}

class ApiDataLoading<T> extends ApiData<T> {}

class ApiDataLoaded<T> extends ApiData<T> {
  final T data;

  ApiDataLoaded(this.data);
}
