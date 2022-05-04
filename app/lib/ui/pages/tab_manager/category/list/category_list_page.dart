import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/config/log/logger.dart';
import 'package:my_finance_flutter_3/core/domain/model/category/category_model.dart';
import 'package:my_finance_flutter_3/ui/navigation/app_router.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/category/list/category_list_controller.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_manager/category/select/category_select_page.dart';
import 'package:my_finance_flutter_3/ui/widget/bottom_action_bar/bottom_action_bar.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CategoryListController(context.read()),
      builder: (context, _) {
        return Scaffold(
          body: BottomActionBar(
            actionList: [
              BottomActionItem(
                icon: Icons.self_improvement_outlined,
                onTap: () async {
                  var result = await showCategoryMultiSelector(context);
                  Log.i('Result - $result');
                },
              ),
              BottomActionItem(
                icon: Icons.add,
                onTap: () {
                  AppRouter.navigateToCategoryForm(context);
                },
              ),
            ],
            child: Consumer<List<CategoryModel>>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    var category = value[index];

                    return ListTile(
                      title: Text(category.name),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
