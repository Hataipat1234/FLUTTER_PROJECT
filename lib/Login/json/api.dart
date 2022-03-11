import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<dynamic, dynamic>> api({url, post, get}) async {
  Map<String, dynamic> responseDecoded = {'Message': "Something wrong!"};
  try {
    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll(post);
    final response = await request.send();
    responseDecoded = json.decode(await response.stream.bytesToString());
  } catch (e) {}
  return responseDecoded;
}
/*
Map<dynamic, dynamic> some = api(url: "ww.", post: {
  "usr":"dsad"
});
*/