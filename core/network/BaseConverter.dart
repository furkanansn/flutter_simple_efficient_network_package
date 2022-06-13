mixin BaseConverter {
  Uri uri(String url) {
    return Uri.parse(url);
  }

  Map<String, String> header({String headerSecurity, String type, token}) {
    Map<String, String> map = {};
    if (headerSecurity != null) {
      map["AUTH"] = headerSecurity;
    }
    map["Authorization"] = "Bearer " + token;
    type == null
        ? map["content-type"] = "application/json"
        : map["content-type"] = type;
    return map;
  }

  String body(dynamic body) {
    if (body is Map<String, dynamic>) {
      return jsonEncode(body);
    } else {
      return body;
    }
  }
}
