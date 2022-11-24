import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_2/presentation/users/users_controller.dart';
import 'package:test_2/resources/text_styles.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return UsersPageState();
  }
}

class UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    Get.put(UsersController());
    UsersController controller = Get.find();
    controller.getUsers();
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
                itemBuilder: (context, index) {
                  var user = controller.users[index];
                  return SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image(
                            image: NetworkImage(user.picture ??
                                'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.firstName,
                                style: TextStyles.textStyleSignika18(),
                              ),
                              Text(
                                user.lastName,
                                style: TextStyles.textStyleSignika18(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.users.length,
              );
      }),
    );
  }
}
