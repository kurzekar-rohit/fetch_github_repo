import 'package:github_api_unite_cloud/Model/RepositryData.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url = 'https://api.github.com/repositories';
  static Future<List<RepositoryData>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<RepositoryData> repositorydata =
            repositoryDataFromJson(response.body);
        // print('IN SERVISE:$repositorydata');
        return repositorydata;
      } else {
        // return List<User>();
      }
    } catch (e) {
      // return List<User>();
    }
  }
}
