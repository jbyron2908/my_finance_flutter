import 'package:collection/collection.dart';
import 'package:my_finance_flutter_3/core/domain/model/operation_state/operation_state_model.dart';

class OperationStateConstants {
  static OperationStateModel paid =
      const OperationStateModel(id: 'paid', title: 'Paid');

  static OperationStateModel pending =
      const OperationStateModel(id: 'pending', title: 'Pending');

  static List<OperationStateModel> operationStateList = [
    paid,
    pending,
  ];

  static OperationStateModel getDefault() {
    return paid;
  }

  static OperationStateModel getById(String id) {
    return operationStateList.firstWhereOrNull(
          (item) => item.id == id,
        ) ??
        getDefault();
  }
}
