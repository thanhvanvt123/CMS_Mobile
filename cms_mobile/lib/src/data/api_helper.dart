import 'package:cms_mobile/src/common/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

mixin IApiHelper {
  // Get all from an API [endpoint] using [uri] and [query]
  Future<Response> getAll<T>(
    String uri, {
    Map<String, dynamic> query = Constants.defaultPagingQuery,
    Map<String, String> request = Constants.requestHeaders,
  });

  // Get all from an API [endpoint] using [uri] and [query]
  // Future<Response> getAll2<T>(
  //   String uri, {
  //   Map<String, dynamic> query = Constants.params,
  //   Map<String, String> request = Constants.requestHeaders,
  // });

  /// Get 1 by Id from API [endpoint] using [uri] and [id]
  Future<Response> getById<T>(String endpoint, dynamic id, {Map<String, String> request = Constants.requestHeaders});
  /// Get 1 by Id from API [endpoint] using [uri] and [id]
  Future<Response> getById1(String endpoint, dynamic id, {Map<String, String> request = Constants.requestHeaders});
  /// Post 1 to API [endpoint] providing [data]
  Future<Response> postOne(
    String endpoint,
    Map<String, dynamic> data,
    {Map<String, dynamic> query = Constants.defaultPagingQuery,
      Map<String, String> request = Constants.requestHeaders}
  );

  // // Post 1 to API [endpoint] providing [data]
  // Future<Response> postById(
  //   String endpoint,
  //   // Map<String, dynamic> body,
  //   { Map<String, dynamic> query = Constants.defaultPagingQuery,
  //     Map<String, String> headers = Constants.requestHeaders}
  // );

  /// Post 1 to API [endpoint] providing [data]
  Future<Response> postList(
    String endpoint,
    List<Map<String, dynamic>> data,
    {Map<String, String> request = Constants.requestHeaders}
  );

  /// Post 1 to API [endpoint] providing [data] with many files [files]
  Future<Response> postOneWithFiles(
    String endpoint,
    Map<String, dynamic> data,
    List<MultipartFile> files,
  );

  /// Post 1 to API [endpoint] providing [data] with many files [files]
  Future<Response> postOneWithFile(
    String endpoint,
    Map<String, dynamic> data,
    MultipartFile file,
  );

  /// Put 1 to API [endpoint] providing [id] and [data]
  Future<Response> putOne(
    String endpoint,
    dynamic id,
    Map<String, dynamic> data,
  );

  /// Put 1 to API [endpoint] providing [data] with one file [files]
  Future<Response> putOneWithOneFile(String endpoint, Map<String, dynamic> data,
      MultipartFile? file, String fileName);

  /// Put 1 to API [endpoint] providing [data] with many files [files]
  Future<Response> putOneWithFiles(
    String endpoint,
    Map<String, dynamic> data,
    List<MultipartFile> files,
  );

  /// Delete from API [endpoint] with [id]
  Future<Response> deleteOne(String endpoint, dynamic id);

  /// Convert json array to list
  List<T> convertToList<T>(dynamic body, Function fromJson);
}

/// Class for calling HTTP methods
class ApiHelper extends GetConnect with IApiHelper {
  @override
  void onInit() {
    super.onInit();

    // Set baseUrl & timeout for API call
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;

    //Request modifier: [Add bearer token]
      // httpClient.addRequestModifier((Request request) async {
      //   request.headers["Authorization"] = await AuthServices.getAuthHeader();
      //   return request;
      //   });
  }

  @override
  Future<Response> getAll<T>(
    String uri, {
    Map<String, dynamic>? query = Constants.defaultPagingQuery,
    Map<String, String>? request = Constants.requestHeaders,
  }) {
    return get<T>(uri, query: query, headers: request);
  }

  // @override
  // Future<Response> getAll2<T>(
  //   String uri, {
  //   //Map<String, dynamic>? query = Constants.defaultPagingQuery,
  //   Map<String, String>? query = Constants.params,
  //   Map<String, String>? request = Constants.requestHeaders,

  // }) {
  //   return get<T>(uri, headers: request, query: query);
  // }

  @override
  Future<Response> getById<T>(String endpoint, dynamic id, {Map<String, String>? request = Constants.requestHeaders}) {
    return get<T>('$endpoint$id', headers: request);
  }

  @override
  Future<Response> getById1(String endpoint, dynamic id, {Map<String, String>? request = Constants.requestHeaders}) {
    return get('$endpoint$id', headers: request);
  }

  @override
  Future<Response> postOne(String endpoint, Map<String, dynamic> data, {Map<String, dynamic> query = Constants.defaultPagingQuery, Map<String, String>? request = Constants.requestHeaders}) {
//     Map results =  fromJson.decode();
// User user = User.fromJson(results);
    return post(endpoint, data, query: query, headers: request);
  }

//   @override
//   Future<Response> postById(String endpoint, dynamic id, {Map<String, String>? headers = Constants.requestHeaders}) {
// //     Map results =  fromJson.decode();
// // User user = User.fromJson(results);
//     return post('$endpoint$id', headers: headers);
//   }

  @override
  Future<Response> postList(String endpoint, List<Map<String, dynamic>> data, {Map<String, String>? request = Constants.requestHeaders}) {
//     Map results =  fromJson.decode();
// User user = User.fromJson(results);
    return post(endpoint, data);
  }

  @override
  Future<Response> postOneWithFile(
    String endpoint,
    Map<String, dynamic> data,
    MultipartFile file,
  ) {
    var form = FormData(data);
    form.files.add(MapEntry('imageUrl', file));
    return post(endpoint, form);
  }

  @override
  Future<Response> postOneWithFiles(
    String endpoint,
    Map<String, dynamic> data,
    List<MultipartFile> files,
  ) {
    var form = FormData(data);
    files.forEach((file) {
      form.files.add(MapEntry('imageUrl', file));
    });
    return post(endpoint, form);
  }

  @override
  Future<Response> putOne(
    String endpoint,
    dynamic id,
    Map<String, dynamic> data,
  ) {
    return put('$endpoint/$id', data);
  }

  @override
  Future<Response> putOneWithOneFile(String endpoint, Map<String, dynamic> data,
      MultipartFile? file, String fileName) {
    var form = FormData(data);
    if (file != null) {
      form.files.add(MapEntry(fileName, file));
    }
    return put(endpoint, form);
  }

  @override
  Future<Response> putOneWithFiles(
    String endpoint,
    Map<String, dynamic> data,
    List<MultipartFile> files,
  ) {
    var form = FormData(data);
    files.forEach((file) {
      form.files.add(MapEntry('files', file));
    });
    return put(endpoint, form);
  }

  @override
  Future<Response> deleteOne(String endpoint, dynamic id) {
    return delete('$endpoint/$id');
  }

  @override
  List<T> convertToList<T>(body, Function fromJson) {
    return (body as List).map<T>((x) => fromJson(x)).toList();
  }

  // @override
  // Future<Response> postById(String endpoint, {Map<String, dynamic>? query = Constants.defaultPagingQuery, Map<String, String> headers = Constants.requestHeaders}) {
  //   // TODO: implement postById
  //   // return get<T>(uri, query: query, headers: request);
  //   return post(endpoint, query: query, headers: request);
  // }

}
