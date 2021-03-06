import 'package:hive/hive.dart';
import 'package:my_finance_flutter/core/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';

class OperationStateDao {
  final Box box;

  OperationStateDao(this.box);

  OperationStateModel getLastUsed() {
    return OperationStateModel.fromJson(
      box.get(
        'defaultOperationState',
        defaultValue: OperationStateConstants.getDefault().toJson(),
      ),
    );
  }

  Future<void> updateLastUsed(OperationStateModel operationState) async {
    await box.put('defaultOperationState', operationState.toJson());
  }
}
