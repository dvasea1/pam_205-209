import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_2/presentation/common_widgets/bottom_loading_widget.dart';
import 'package:test_2/presentation/commont/bottom_loading_indicator_item.dart';
import 'package:test_2/presentation/users/models/user_list_item.dart';
import 'package:test_2/presentation/users/users_controller.dart';
import 'package:test_2/presentation/users/widgets/user_widget.dart';
import 'package:test_2/resources/text_styles.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return UsersPageState();
  }
}

class UsersPageState extends State<UsersPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    Get.put(UsersController());
    UsersController controller = Get.find();
    controller.getUsers();

    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      var currentScroll = scrollController.position.pixels;
      if (currentScroll >= maxScroll) {
        controller.getNextPage();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UsersController controller = Get.find();
    return Scaffold(
      body: Obx(() {
        return controller.isLoading.value
            ? const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  var item = controller.usersList[index];
                  if (item is UserListItem) {
                    return UserWidget(
                      smallUser: item.smallUser,
                    );
                  } else if (item is BottomLoadingIndicatorItem) {
                    return const BottomLoadingWidget();
                  } else {
                    return Container();
                  }
                },
                itemCount: controller.usersList.length,
              );
      }),
    );
  }
}
