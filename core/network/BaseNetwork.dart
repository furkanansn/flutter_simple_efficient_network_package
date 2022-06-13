abstract class BaseNetwork<T> with BaseConverter, ResponseConverter {
  dynamic request(
      {String url, String token, dynamic body, String requestType}) async {
    String secondToken = await tokenReguest();
    var response;
    if (requestType.toLowerCase().trim() == "post") {
      response = await http.post(this.uri(BASE_URL + url),
          body: this.body(body),
          headers: this.header(headerSecurity: token, token: secondToken));
    } else if (requestType.toLowerCase().trim() == "get") {
      response = await http.get(this.uri(BASE_URL + url),
          headers: this.header(headerSecurity: token, token: secondToken));
    } else {
      response = await http.delete(this.uri(BASE_URL + url),
          headers: this.header(headerSecurity: token, token: secondToken));
    }
    print(response.body + response.statusCode.toString());
    if (response.statusCode == 500) {
      print(response.request.url.toString() +
          " " +
          response.headers.toString() +
          response.body);
    }

    return model(response.body);
  }

  dynamic tokenReguest() async {
    final queryParameters = {
      "username": "test",
      "password": "test"
    };
    final response = await http.post(
        Uri.parse(BASE_URL + "api/Secure/Authenticate"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(queryParameters));    
    return jsonDecode(response.body)["data"];
  }
}
