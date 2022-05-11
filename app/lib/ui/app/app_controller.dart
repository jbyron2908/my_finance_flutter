import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter/core/data_source/database/memory/database_client.dart';
import 'package:my_finance_flutter/core/domain/repository/account/account_repository.dart';
import 'package:my_finance_flutter/core/domain/repository/category/category_repository.dart';
import 'package:my_finance_flutter/core/domain/repository/label/label_repository.dart';
import 'package:my_finance_flutter/core/domain/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/domain/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/core/domain/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/core/domain/repository/template_operation/template_operation_repository.dart';
import 'package:navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:theme/theme.dart';

class AppController extends StatelessWidget {
  const AppController({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThemeProvider>(
          create: (context) => AppThemeProvider(),
        ),
        Provider<DatabaseClient>(
          create: (context) => MemoryDatabaseClient(),
        ),
        Provider(
          create: (context) => ProfileRepository(context.read()),
        ),
        Provider(
          create: (context) => AccountRepository(context.read()),
        ),
        Provider(
          create: (context) => CategoryRepository(context.read()),
        ),
        Provider(
          create: (context) => PayeeRepository(context.read()),
        ),
        Provider(
          create: (context) => LabelRepository(context.read()),
        ),
        Provider(
          create: (context) => TemplateOperationRepository(context.read()),
        ),
        Provider(
          create: (context) => OperationRepository(context.read()),
        ),
        Provider(
          create: (context) => AppRouterObserverRegister(),
        ),
      ],
      builder: (context, _) {
        return child;
      },
    );
  }
}
