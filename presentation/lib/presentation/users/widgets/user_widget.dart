import 'package:domain/users/models/small_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_2/resources/text_styles.dart';

class UserWidget extends StatelessWidget {
  final SmallUser smallUser;

  const UserWidget({super.key, required this.smallUser});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image(
              image: NetworkImage(smallUser.picture ??
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
                  smallUser.firstName,
                  style: TextStyles.textStyleSignika18(),
                ),
                Text(
                  smallUser.lastName,
                  style: TextStyles.textStyleSignika18(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}