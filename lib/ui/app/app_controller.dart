import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/database_client.dart';
import 'package:my_finance_flutter_3/core/domain/repository/account/account_repository.dart';
import 'package:my_finance_flutter_3/core/domain/repository/category/category_repository.dart';
import 'package:my_finance_flutter_3/core/domain/repository/label/label_repository.dart';
import 'package:my_finance_flutter_3/core/domain/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter_3/core/domain/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter_3/core/domain/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter_3/core/domain/repository/template_operation/template_operation_repository.dart';

final databaseProvider = Provider.autoDispose<DatabaseClient>((ref) {
  var databaseClient = MemoryDatabaseClient();
  return databaseClient;
});

final profileRepositoryProvider = Provider(
  (ref) {
    var database = ref.read(databaseProvider);
    return ProfileRepository(database);
  },
);

final accountRepositoryProvider = Provider(
  (ref) {
    var database = ref.read(databaseProvider);
    return AccountRepository(database);
  },
);

final categoryRepositoryProvider = Provider(
  (ref) {
    var database = ref.read(databaseProvider);
    return CategoryRepository(database);
  },
);

final payeeRepositoryProvider = Provider(
  (ref) {
    var database = ref.read(databaseProvider);
    return PayeeRepository(database);
  },
);

final labelRepositoryProvider = Provider(
  (ref) {
    var database = ref.read(databaseProvider);
    return LabelRepository(database);
  },
);

final operationRepositoryProvider = Provider(
  (ref) {
    var database = ref.read(databaseProvider);
    return OperationRepository(database);
  },
);

final templateOperationRepositoryProvider = Provider(
  (ref) {
    var database = ref.read(databaseProvider);
    return TemplateOperationRepository(database);
  },
);
