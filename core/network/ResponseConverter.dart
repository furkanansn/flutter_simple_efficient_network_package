mixin ResponseConverter {
  dynamic model(dynamic json) {
    
    return jsonDecode(json.toString());
  }
}
