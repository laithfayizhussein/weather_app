import 'package:http/http.dart' as http;
import 'dart:convert';

//222222 send the request
class NetworkData {
  NetworkData(this.url);
  final String url;
  Future getDate() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      String a = '#';
      print(a * 30);
      print(decodedData);
      print(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
