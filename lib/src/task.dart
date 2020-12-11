part of algolia;

class AlgoliaTask {
  AlgoliaTask._(this.algolia, String index, Map<String, dynamic> data)
      : _index = index,
        _data = data,
        taskID = data['taskID'],
        assert(algolia != null);
  final Algolia algolia;
  final String _index;
  final int taskID;
  final Map<String, dynamic> _data;

  Map<String, dynamic> get data {
    Map<String, dynamic> d = Map<String, dynamic>.from(_data);
    d.remove('taskID');
    return d;
  }

  Future<void> waitTask() async {
    const int baseDelay = 100;
    const int maxDelay = 5000;
    int delay = 0;
    int loop = 0;
    while (!await Future.delayed(Duration(milliseconds: delay), taskStatus)) {
      ++loop;
      delay = (baseDelay * loop * loop).clamp(baseDelay, maxDelay);
    }
  }

  Future<bool> taskStatus() async {
    BaseOptions options = new BaseOptions(
        connectTimeout: 3000,
        headers: algolia._header
      //receiveTimeout: 3000,
    );

    var dio = Dio(options);
    String url = '${algolia._host}indexes/$_index/task/$taskID';
    Response response = await dio.get(
      url,

    );
    Map<String, dynamic> body = json.decode(response.data);
    return body['status'] == 'published';
  }
}
