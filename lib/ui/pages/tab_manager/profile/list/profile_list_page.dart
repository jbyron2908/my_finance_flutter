import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/config/log/logger.dart';
import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_router.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/profile/list/profile_list_controller.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/profile/select/profile_select_page.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_action_bar/bottom_action_bar.dart';
import 'package:my_finance_flutter_3/ui/widget/wrapper/lifecycle_widget.dart';
import 'package:provider/provider.dart';

class ProfileListPage extends StatelessWidget {
  const ProfileListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ProfileListController(context.read()),
      builder: (context, _) {
        ProfileListController controller = context.read();

        return LifecycleWidget(
          onReady: (context) {
            controller.watch();
          },
          child: Scaffold(
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
              child: StreamBuilder<ProfileListState>(
                stream: controller.state,
                builder: (context, state) {
                  if (state.data is Idle) {
                    var idle = state.data as Idle;
                    return StreamBuilder<List<ProfileModel>>(
                      initialData: const [],
                      stream: idle.profileListStream,
                      builder: (context, snapshot) {
                        var profileList = snapshot.requireData;

                        return ListView.builder(
                          itemCount: profileList.length,
                          itemBuilder: (context, index) {
                            var profile = profileList[index];

                            return ListTile(
                              title: Text(profile.name),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
