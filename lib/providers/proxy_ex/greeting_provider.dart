import 'package:provider_flutter_list_coman/providers/proxy_ex/user_provider.dart';

class GreetingsProvider{
  UserProvider  userProvider ;
  GreetingsProvider({ required  this.userProvider});
  String get  greeting => 'Hello :${userProvider.user.email}';


}