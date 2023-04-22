import 'package:get/get.dart';
import '../pages/HomePage.dart';
import '../pages/CashOutPage.dart';
import '../pages/CashInPage.dart';

final routes = [
  GetPage(name: '/homePage', page: () => HomePage()),
  GetPage(name: '/cashInPage', page: () => CashInPage()),
  GetPage(name: '/cashOutPage', page: () => CashOutPage()),
];
