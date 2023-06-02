import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/saving_data_only_proivder.dart';

class ProvideronlyUI extends StatelessWidget {
  const ProvideronlyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Provider only example"),
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
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              Consumer<SaveDataOnly>(
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
                  context.read<SaveDataOnly>().changeValue('hend');
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
