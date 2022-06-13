## You can use these classes for your network operations.
## - OOP layer arthitecture, so you can easily modify your headers with less code.
## - How to use 

-Example

```dart
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
```



