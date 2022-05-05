import 'package:database_domain/domain.dart';
import 'package:my_finance_flutter/core/domain/repository/payee/payee_repository.dart';
import 'package:rxdart/subjects.dart';

class PayeeListController {
  PayeeListController(this.payeeRepository);

  final PayeeRepository payeeRepository;

  final payeeStream = BehaviorSubject<List<PayeeModel>>();

  Future<void> start() async {
    var payeeListStream = await payeeRepository.watchAll();
    payeeStream.addStream(payeeListStream);
  }

  Future deletePayee(PayeeModel payee) {
    return payeeRepository.delete(payee);
  }
}
