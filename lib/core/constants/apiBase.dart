class ApiBase {
  static final ApiBase _instance = ApiBase.init();
  static ApiBase get instance => _instance;
  ApiBase.init();

  final String users = "https://jsonplaceholder.typicode.com/users";
  

    final String posts = "https://jsonplaceholder.typicode.com/posts";

}
