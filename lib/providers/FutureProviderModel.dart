class FutureProviderModel {
  String value  ;
  FutureProviderModel({ required this.value});
  Future<void>  doSomething () async{
    await Future.delayed(const Duration(seconds: 2));
    value = 'shaimaa';
    print(value);
  }

}