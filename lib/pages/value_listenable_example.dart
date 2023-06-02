import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/value_notifire_model.dart';

class ValueListenableExample extends StatelessWidget {
  const ValueListenableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  ui(context);
  }
  ui (BuildContext context){
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text("ValueListenableProvider example"),
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

              Consumer<ValueNotifierModel>(
                  builder: (BuildContext _context, cashValue, child) {
                    print('Consumer value');
                    return ValueListenableProvider<String>.value(
                      value: cashValue.myVar,
                      child: Text(
                        cashValue.myVar.value,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineMedium,
                      ),
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
              Consumer<ValueNotifierModel>(
                  builder: (BuildContext _context, cashValue, child) {
                    print('Consumer value');
                    return   FloatingActionButton(
                      onPressed: () {
                        cashValue.doSomething();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.refresh),
                    );
                  }),


            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
