import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/payee/payee_repository.dart';

class PayeeListController {
  PayeeListController(this.payeeRepository);

  final PayeeRepository payeeRepository;

  Future deletePayee(PayeeModel payee) {
    return payeeRepository.delete(payee);
  }
}
