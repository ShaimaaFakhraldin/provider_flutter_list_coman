import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_list_coman/pages/consumer_example.dart';
import 'package:provider_flutter_list_coman/pages/future_provider_example.dart';
import 'package:provider_flutter_list_coman/pages/provider_only_ui.dart';
import 'package:provider_flutter_list_coman/pages/proxy_provider_example/home.dart';
import 'package:provider_flutter_list_coman/pages/proxy_provider_example/login.dart';
import 'package:provider_flutter_list_coman/pages/streem_provider_example.dart';
import 'package:provider_flutter_list_coman/pages/value_listenable_example.dart';
import 'package:provider_flutter_list_coman/providers/proxy_ex/cart_provider.dart';
import 'package:provider_flutter_list_coman/providers/proxy_ex/greeting_provider.dart';
import 'package:provider_flutter_list_coman/providers/saving_data_only_proivder.dart';
import 'package:provider_flutter_list_coman/providers/simple_provider_model.dart';
import 'package:provider_flutter_list_coman/providers/proxy_ex/user_provider.dart';
import 'package:provider_flutter_list_coman/providers/value_notifire_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // first provider

        ChangeNotifierProvider(create: (BuildContext context) {
          return Mymodel();
        }),
        Provider(create: (con) {
          return SaveDataOnly();
        }),
        Provider(create: (con) {
          return ValueNotifierModel();
        }),
        Provider(create: (con) {
          return UserProvider();
        }),
        ProxyProvider<UserProvider, GreetingsProvider>(update:
            (BuildContext context, UserProvider _userProvider,
                GreetingsProvider? greetingsProvider) {
          return GreetingsProvider(userProvider: _userProvider);
        }),
        ProxyProvider2<UserProvider ,GreetingsProvider , CartProvider >(update: (BuildContext context  , UserProvider _userProvider,
            GreetingsProvider greetingsProvider ,CartProvider? cartProvider  ){

          return CartProvider (userProvider:  _userProvider  , greetingsProvider:  greetingsProvider);
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginUi(),
      ),
    );
  }
}
