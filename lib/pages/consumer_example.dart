import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/simple_provider_model.dart';

class ConsumerExample extends StatelessWidget {
  const ConsumerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return   ui(context);
  }
   ui (BuildContext context){
     return Scaffold(
         appBar: AppBar(
           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
           title: const Text("Consumer example"),
         ),
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               // Text(
               //   /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
               //   '${context.select<Mymodel , int>((value) { return value.counter ;})}',
               //   key: const Key('counterState'),
               //   style: Theme.of(context).textTheme.headlineMedium,
               // ),
               const SizedBox(
                 height: 20,
               ),
               Text(
                 /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
                 '${context.watch<Mymodel>().counter}',
                 key: const Key('counterState'),
                 style: Theme.of(context).textTheme.headlineMedium,
               ),
               const SizedBox(
                 height: 20,
               ),
               Text(
                 'Consumer counter',
                 style: Theme.of(context).textTheme.headlineMedium,
               ),
               const SizedBox(
                 height: 10,
               ),
               Consumer<Mymodel>(
                   builder: (BuildContext _context, cashValue, child) {
                     print('Consumer counter');
                     return Text(
                       '${cashValue.counter}',
                       style: Theme.of(context).textTheme.headlineMedium,
                     );
                   }),
               const SizedBox(
                 height: 20,
               ),
               Text(
                 'Selector someValue',
                 style: Theme.of(context).textTheme.headlineMedium,
               ),
               const SizedBox(
                 height: 10,
               ),
               Selector<Mymodel, String>(
                   builder: (BuildContext _context, value, child) {
                     print('Selector someValue');
                     return Text(
                       '${value}',
                       style: Theme.of(context).textTheme.headlineMedium,
                     );
                   }, selector: (BuildContext _con, cashValue) {
                 return cashValue.someValue;
               }),
               const SizedBox(
                 height: 20,
               ),
               Text(
                 'Consumer someValue',
                 style: Theme.of(context).textTheme.headlineMedium,
               ),
               const SizedBox(
                 height: 10,
               ),
               Consumer<Mymodel>(
                   builder: (BuildContext _context, cashValue, child) {
                     print('Consumer someValue');
                     return Text(
                       '${cashValue.someValue}',
                       style: Theme.of(context).textTheme.headlineMedium,
                     );
                   }),
             ],
           ),
         ),
         floatingActionButton: Container(
           height: 150,
           margin: EdgeInsets.all(10),
           alignment: Alignment.centerRight,
           child: Column(
             children: [

               FloatingActionButton(
                 onPressed: () {
                   context.read<Mymodel>().increementCounter();
                 },
                 tooltip: 'Increment',
                 child: const Icon(Icons.add),
               ),
               const SizedBox(
                 height: 20,
               ),
               FloatingActionButton(
                 onPressed: () {
                   context.read<Mymodel>().changeValue();
                 },
                 tooltip: 'Increment',
                 child: const Icon(Icons.refresh),
               ),
             ],
           ),
         ) // This trailing comma makes auto-formatting nicer for build methods.
     ); 
   }
}
