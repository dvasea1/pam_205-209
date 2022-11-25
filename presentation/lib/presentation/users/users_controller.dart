import 'package:domain/users/models/small_user.dart';
import 'package:domain/users/use_cases/get_users_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class UsersController extends GetxController {
  RxList<SmallUser> users = RxList();
  RxBool isLoading = false.obs;
  var getUsersUseCase = GetIt.instance.get<GetUsersUseCase>();

  void getUsers() {
    getUsersUseCase.call().listen((usersList) {
      print('getUsers length: ${usersList.length}');
      users.value = usersList;
    });
  }
/*late LocalDataBase localDataBase;

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
  }*/
}
