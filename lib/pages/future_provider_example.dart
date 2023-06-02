import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/FutureProviderModel.dart';

// FutureBuilder
class FutureProviderExample extends StatelessWidget {
  const FutureProviderExample({super.key});


    @override
    Widget build(BuildContext context) {
      return  FutureProvider(create: (BuildContext con){
        return getModuleFun();
      }, initialData: FutureProviderModel( value:  'first time') ,
        child: ui(context),

      );
    }

     ui (BuildContext context){
       return  Scaffold(
           appBar: AppBar(
             backgroundColor: Theme
                 .of(context)
                 .colorScheme
                 .inversePrimary,
             title: const Text("FutureProvider example"),
           ),
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 const SizedBox(
                   height: 20,
                 ),
                 Text(
                   'Consumer someValue',
                   style: Theme
                       .of(context)
                       .textTheme
                       .headlineMedium,
                 ),

                 Consumer<FutureProviderModel>(
                     builder: (BuildContext _context, cashValue, child) {
                       print('Consumer value');
                       return Text(
                         cashValue.value,
                         style: Theme
                             .of(context)
                             .textTheme
                             .headlineMedium,
                       );
                     }),
               ],
             ),
           ),
           floatingActionButton: Container(
             height: 150,
             margin: const EdgeInsets.all(10),
             alignment: Alignment.centerRight,
             child: Column(
               children: [

                 FloatingActionButton(
                   onPressed: () {
                     // throw exaption
                  ///   context.read<FutureProviderModel>().doSomething();
                   },
                   tooltip: 'Increment',
                   child: const Icon(Icons.refresh),
                 ),
               ],
             ),
           ) // This trailing comma makes auto-formatting nicer for build methods.
       );
     }

  Future<FutureProviderModel> getModuleFun () async{
      Future.delayed(const Duration(seconds: 5));
     return  FutureProviderModel(value: 'get data');
  }
}
