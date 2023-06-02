import 'package:provider_flutter_list_coman/providers/proxy_ex/user_provider.dart';

import 'greeting_provider.dart';

class CartProvider {
  UserProvider userProvider ;
  GreetingsProvider  greetingsProvider ;
   CartProvider({required this.userProvider , required this.greetingsProvider});

}