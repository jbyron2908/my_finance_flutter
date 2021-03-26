// import 'package:mobx/mobx.dart';
// import 'package:my_finance_flutter_2/core/bloc/model/account/account_model.dart';
// import 'package:my_finance_flutter_2/core/bloc/model/category/category_model.dart';
// import 'package:my_finance_flutter_2/core/bloc/model/label/label_model.dart';
// import 'package:my_finance_flutter_2/core/bloc/model/operation_state/operation_state_model.dart';
// import 'package:my_finance_flutter_2/core/bloc/model/operation_type/operation_type_model.dart';
// import 'package:my_finance_flutter_2/core/bloc/model/payee/payee_model.dart';
// import 'package:my_finance_flutter_2/core/bloc/model/profile/profile_model.dart';
// import 'package:my_finance_flutter_2/ui/app/app_controller.dart';

// class AppDataController {
//   AppDataController({
//     required AppController appController,
//   }) {
//     profileList = ObservableStream(
//       appController.profileRepository.watchAll(),
//     );
//     accountList = ObservableStream(
//       appController.accountRepository.watchAll(),
//     );
//     categoryList = ObservableStream(
//       appController.categoryRepository.watchAll(),
//     );
//     payeeList = ObservableStream(
//       appController.payeeRepository.watchAll(),
//     );
//     labelList = ObservableStream(
//       appController.labelRepository.watchAll(),
//     );
//     operationTypeList = ObservableList.of(operationTypeList);
//     operationStateList = ObservableList.of(operationStateList);
//   }

//   late ObservableStream<List<ProfileModel>> profileList;
//   late ObservableStream<List<AccountModel>> accountList;
//   late ObservableStream<List<CategoryModel>> categoryList;
//   late ObservableStream<List<PayeeModel>> payeeList;
//   late ObservableStream<List<LabelModel>> labelList;

//   late ObservableList<OperationTypeModel> operationTypeList;
//   late ObservableList<OperationStateModel> operationStateList;
// }
