import 'package:flutter/material.dart';
import 'package:fsdh_xpense/models/Account.dart';
import 'package:fsdh_xpense/models/Budget.dart';
import 'package:fsdh_xpense/view/LoginScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()  async{
  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
  Hive.registerAdapter(BudgetAdapter());
  await Hive.openBox<Account>('accounts');
  await Hive.openBox<Budget>('budgets');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FSDH Xpense',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
