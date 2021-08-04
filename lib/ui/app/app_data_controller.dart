// import 'package:flutter/material.dart';
// import 'package:my_finance_flutter_3/core/domain/model/account/account_model.dart';
// import 'package:my_finance_flutter_3/core/domain/model/category/category_model.dart';
// import 'package:my_finance_flutter_3/core/domain/model/label/label_model.dart';
// import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
// import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';
// import 'package:my_finance_flutter_3/core/domain/model/template_operation/template_operation_model.dart';
// import 'package:my_finance_flutter_3/core/domain/repository/account/account_repository.dart';
// import 'package:my_finance_flutter_3/core/domain/repository/category/category_repository.dart';
// import 'package:my_finance_flutter_3/core/domain/repository/label/label_repository.dart';
// import 'package:my_finance_flutter_3/core/domain/repository/payee/payee_repository.dart';
// import 'package:my_finance_flutter_3/core/domain/repository/profile/profile_repository.dart';
// import 'package:my_finance_flutter_3/core/domain/repository/template_operation/template_operation_repository.dart';
// import 'package:provider/provider.dart';

// class AppDataController extends StatelessWidget {
//   const AppDataController({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         StreamProvider<List<ProfileModel>>(
//           initialData: const [],
//           create: (context) {
//             var repo = context.read<ProfileRepository>();
//             return repo.watchAll();
//           },
//         ),
//         StreamProvider<List<AccountModel>>(
//           initialData: const [],
//           create: (context) {
//             var repo = context.read<AccountRepository>();
//             return repo.watchAll();
//           },
//         ),
//         StreamProvider<List<CategoryModel>>(
//           initialData: const [],
//           create: (context) {
//             var repo = context.read<CategoryRepository>();
//             return repo.watchAll();
//           },
//         ),
//         StreamProvider<List<PayeeModel>>(
//           initialData: const [],
//           create: (context) {
//             var repo = context.read<PayeeRepository>();
//             return repo.watchAll();
//           },
//         ),
//         StreamProvider<List<LabelModel>>(
//           initialData: const [],
//           create: (context) {
//             var repo = context.read<LabelRepository>();
//             return repo.watchAll();
//           },
//         ),
//         StreamProvider<List<TemplateOperationModel>>(
//           initialData: const [],
//           create: (context) {
//             var repo = context.read<TemplateOperationRepository>();
//             return repo.watchAll();
//           },
//         ),
//       ],
//       builder: (context, _) {
//         return child;
//       },
//     );
//   }
// }
