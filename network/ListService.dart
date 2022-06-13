class ListService extends BaseNetwork with ILocalUtil {

  Future<List<MyModel>> getMonthList() async {
    final response = await request(
        url: "api/list/getMonths",
        token: await getLocalData(key: "token"),
        requestType: "Get");
    return (response as List)
        .map((e) => MyModel.fromJson(e))
        .toList();
  }

}
