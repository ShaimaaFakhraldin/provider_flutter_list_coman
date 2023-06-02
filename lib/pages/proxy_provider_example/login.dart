import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter_list_coman/entities/user.dart';
import 'package:provider_flutter_list_coman/pages/proxy_provider_example/home.dart';
import 'package:provider_flutter_list_coman/providers/proxy_ex/user_provider.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Login'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(
                    'Enter your email',
                    style: TextStyle(fontSize: 20),
                  ),
      ),
              onChanged: (String? value) {
                setState(() {
                  email = value!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  label: Text(
                    'Enter your password',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              onChanged: (String? value) {
                setState(() {
                  password = value!;
                });
              },
            ),
            const SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              User user = User(email: email);
              context.read<UserProvider>().setUser(user);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext con ){ return const Home();}));
              // Provider.of<UserProvider>(context , listen: false).setUser(User(email: email));
              //
              // context.watch<UserProvider>().setUser(User(email: email));
              // Provider.of<UserProvider>(context , listen: true).setUser(User(email: email));


            }, child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
