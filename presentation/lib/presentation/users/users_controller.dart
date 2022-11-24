import 'dart:convert';

import 'package:domain/users/models/small_user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_2/local_database/local_database.dart';



class UsersController extends GetxController {
  RxList<SmallUser> users = RxList();
  RxBool isLoading = false.obs;

  late LocalDataBase localDataBase;

  @override
  void onInit() {
    localDataBase = LocalDataBase();
    super.onInit();
  }

  void getUsers() async {
    localDataBase.getComments();
    localDataBase.getUsersStream().listen((usersLocalDb) {
      users.value = usersLocalDb.map((e) => SmallUser(e.id, e.firstName, e.lastName, e.picture)).toList().toList();
      isLoading.value = usersLocalDb.isEmpty;
    });
    syncUsersApi();

    /// Local database
    //var usersFromDb = await localDataBase.getUsers();
    // print('usersFromDb ${usersFromDb.length}');
    //  users.value = usersFromDb.map((e) => SmallUser(e.id, e.firstName, e.lastName, e.picture)).toList().take(7).toList();
    // isLoading.value = usersFromDb.isEmpty;

    ///Shared preferences
    // var usersFromSharedPref = await getUsersFromSharedPref();
    // users.value = usersFromSharedPref.take(7).toList();
    //isLoading.value = usersFromSharedPref.isEmpty;
    //isLoading.value = true;

    ///Api

    //  isLoading.value = false;
  }

  void syncUsersApi() async {
    await Future.delayed(const Duration(seconds: 4));
    Uri uri = Uri.parse('https://dummyapi.io/data/v1/user?limit=50&page=1');
    var response = await http.get(
      uri,
      headers: {'app-id': '6112dc7c3f812e0d9b6679dd'},
    );

    if (response.statusCode == 200) {
      UsersResponse usersResponse = UsersResponse.fromJson(jsonDecode(response.body));
      // saveUsersToSharedPref(usersResponse.users);
      localDataBase.insertUsers(usersResponse.users
          .map(
            (e) => UserTableData(
              id: e.id,
              firstName: e.firstName,
              lastName: e.lastName,
              picture: e.picture,
            ),
          )
          .toList());
    }
  }

  Future<List<SmallUser>> getUsersFromSharedPref() async {
    List<SmallUser> tempUsers = [];
    var sharedPreference = await SharedPreferences.getInstance();
    String? usersJson = sharedPreference.getString('users');
    if (usersJson != null) {
     // tempUsers = List.from(jsonDecode(usersJson)).map((e) => SmallUser.fromJson(e)).toList();
    }
    print('getUsersFromSharedPref : ${tempUsers.length}');
    return tempUsers;
  }

  void saveUsersToSharedPref(List<SmallUser> users) async {
    var sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString('users', jsonEncode(users));
  }
}
