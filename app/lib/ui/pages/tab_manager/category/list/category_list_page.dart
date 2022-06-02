import 'package:auto_route/auto_route.dart';
import 'package:database_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/category/list/category_list_controller.dart';
import 'package:my_finance_flutter/ui/pages/tab_manager/category/select/category_select_page.dart';
import 'package:navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:theme/widget.dart';

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
                  AppRouter.navigateToCategoryForm(context.router);
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
