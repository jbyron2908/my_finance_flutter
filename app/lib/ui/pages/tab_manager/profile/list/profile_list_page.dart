import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/ui/navigation/app_router.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/profile/list/profile_list_controller.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/profile/select/profile_select_page.dart';
import 'package:my_finance_flutter/ui/widget/bottom_action_bar/bottom_action_bar.dart';
import 'package:my_finance_flutter/ui/widget/wrapper/controlled_widget.dart';
import 'package:provider/provider.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ProfileListPage extends StatelessWidget {
  const ProfileListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ControlledWidget<ProfileListController>(
      widgetController: ProfileListController(context.read()),
      builder: (context, controller) {
        return Scaffold(
          body: BottomActionBar(
            actionList: [
              BottomActionItem(
                icon: Icons.self_improvement_outlined,
                onTap: () async {
                  var result = await showProfileMultiSelector(context);
                  Log.i('Result - $result');
                },
              ),
              BottomActionItem(
                icon: Icons.add,
                onTap: () {
                  AppRouter.navigateToProfileForm(context);
                },
              ),
            ],
            child: RxBuilder(
              builder: (context) {
                var state = controller.state.value;
                if (state is Idle) {
                  var profileList = state.profileList.data ?? [];

                  return ListView.builder(
                    itemCount: profileList.length,
                    itemBuilder: (context, index) {
                      var profile = profileList[index];

                      return ListTile(
                        title: Text(profile.name),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
