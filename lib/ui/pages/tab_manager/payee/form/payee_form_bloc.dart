import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/payee/payee_repository.dart';

class PayeeFormBloc {
  PayeeFormBloc(this.payeeRepository);

  final PayeeRepository payeeRepository;

  String name = '';
  int picker = 0;

  String? validateName(String value) {
    return null;
  }

  Future<bool> save() async {
    var model = PayeeModel(name: name);
    await payeeRepository.save(model);
    return true;
  }
}
