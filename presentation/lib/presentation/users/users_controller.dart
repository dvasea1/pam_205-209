import 'package:domain/users/models/small_user.dart';
import 'package:domain/users/use_cases/get_users_from_api_use_Case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_2/presentation/commont/bottom_loading_indicator_item.dart';
import 'package:test_2/presentation/commont/list_item.dart';
import 'package:test_2/presentation/users/models/user_list_item.dart';

class UsersController extends GetxController {
  RxList<ListItem> usersList = RxList();
  RxBool isLoading = false.obs;
  var getUsersUseCase = GetIt.instance.get<GetUsersFromApiUseCase>();
  int page = 1;
  int limit = 20;
  bool canGetMoreData = true;

  void getUsers() async {
   if(page !=1) await Future.delayed(Duration(seconds: 3));
    getUsersUseCase.call(GetUsersFromApiParams(page, limit)).then((users) {
      print('getUsers length: ${usersList.length}');
      usersList.removeWhere((element) => element is BottomLoadingIndicatorItem);
      usersList.addAll(users.map((e) => UserListItem(e)).toList());
      usersList.add(BottomLoadingIndicatorItem());
      page++;
      canGetMoreData = true;
    });
  }

  void getNextPage() {
    if (canGetMoreData) {
      print('Can get next page');
      canGetMoreData = false;
      getUsers();
    }
  }
}
