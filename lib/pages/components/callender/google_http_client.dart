//
// import 'package:http/http.dart';
//
// class GoogleHttpClient extends  BaseClient {
//   final Map<String, String> headers;
//
//   late final  Client client;
//
//   GoogleHttpClient(this.headers, this.client);
//
//   @override
//   Future< StreamedResponse> send(BaseRequest request) {
//     return client.send(request..headers.addAll(headers));
//   }
//
// }