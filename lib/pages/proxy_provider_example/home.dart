import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/proxy_ex/cart_provider.dart';
import '../../providers/proxy_ex/greeting_provider.dart';
import '../../providers/proxy_ex/user_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('user name : ${ context.watch<CartProvider>().userProvider.user.email}'  ,style:  TextStyle(fontSize: 30),) ,
             const SizedBox(height:  20,),
            Text('Greeting  ${ context.watch<CartProvider>().greetingsProvider.greeting}' ,style: TextStyle(fontSize: 30),) ,



          ],
        ),
      ),
    );
  }
}
