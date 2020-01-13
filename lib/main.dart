import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_only/app_global_state.dart';
import 'package:provider_only/just_a_lazy_loading_test.dart';
import 'package:provider_only/my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppGlobalState>(create: (_) => AppGlobalState(),),
        Provider<JustALazyLoadingTest1>(create: (_) => JustALazyLoadingTest1(),),
        Provider<JustALazyLoadingTest2>(create: (_) => JustALazyLoadingTest2(),),
        Provider<JustALazyLoadingTest3>(create: (_) => JustALazyLoadingTest3(),),
        Provider<JustALazyLoadingTest4>(create: (_) => JustALazyLoadingTest4(),),
        Provider<JustALazyLoadingTest5>(create: (_) => JustALazyLoadingTest5(),),
        Provider<JustALazyLoadingTest6>(create: (_) => JustALazyLoadingTest6(),),
        Provider<JustALazyLoadingTest7>(create: (_) => JustALazyLoadingTest7(),),
        Provider<JustALazyLoadingTest8>(create: (_) => JustALazyLoadingTest8(),),
        Provider<JustALazyLoadingTest9>(create: (_) => JustALazyLoadingTest9(),),
        Provider<JustALazyLoadingTest10>(create: (_) => JustALazyLoadingTest10(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/' : (_) => MyHomePage(title: 'Total open pages: #1'),
        },
      ),
    );
  }
}