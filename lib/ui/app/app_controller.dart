// import 'package:flutter/material.dart';


// class AppController {
//   static AppController find(BuildContext context) => Provider.of(context);

//   late DatabaseClient databaseClient;

//   late ProfileRepository profileRepository;
//   late AccountRepository accountRepository;
//   late CategoryRepository categoryRepository;
//   late PayeeRepository payeeRepository;
//   late LabelRepository labelRepository;

//   late OperationRepository operationRepository;
//   late TemplateOperationRepository templateOperationRepository;

//   Future setup() async {
//     databaseClient = MemoryDatabaseClient();
//     await databaseClient.setup();

//     profileRepository = ProfileRepository(databaseClient);
//     accountRepository = AccountRepository(databaseClient);
//     categoryRepository = CategoryRepository(databaseClient);
//     payeeRepository = PayeeRepository(databaseClient);
//     labelRepository = LabelRepository(databaseClient);

//     operationRepository = OperationRepository(databaseClient);
//     templateOperationRepository = TemplateOperationRepository(databaseClient);
//   }
// }
