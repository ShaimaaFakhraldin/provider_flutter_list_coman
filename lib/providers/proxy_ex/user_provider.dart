import '../../entities/user.dart';

class UserProvider  {
  User? _user ;
   User get user => _user! ;
   setUser(User user){
     _user = user ;
     print(_user!.email);
   }

}