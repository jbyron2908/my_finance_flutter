import 'package:database_domain/domain.dart';
import 'package:my_finance_flutter/core/domain/repository/payee/payee_repository.dart';

class PayeeFormBloc {
  PayeeFormBloc(this.payeeRepository);

  final PayeeRepository payeeRepository;

  String name = '';
  int picker = 0;

  Future<bool> save() async {
    var model = PayeeModel(name: name);
    await payeeRepository.save(model);
    return true;
  }
}
