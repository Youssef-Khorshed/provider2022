// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_brace_in_string_interps, avoid_types_as_parameter_names, unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ignore: prefer_const_literals_to_create_immutables
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // proxy provider<R>  0

              // ProxyProvider0<int>(
              //     update: ((context, int) => provider.counter),
              //     child: Counter()),

              // proxy provider <T,R>

              // ProxyProvider<MyProvider, int>(
              //     update: ((_, context, __) => context.counter),
              //     child: Counter()),

              // Selector<MyProvider, String>(
              //   selector: (context, p1) => p1.showdata,
              //   builder: (context, value, child) {
              //     print('data is consumed');
              //     return Text(value);
              //   },
              // ),
              // Consumer<MyProvider>(
              //   builder: (context, value, child) {
              //     return MaterialButton(
              //       onPressed: () {
              //         // provider.add();
              //         value.changeString();
              //       },
              //       child: Text('+'),
              //     );
              //   },
              // ),

              MaterialButton(
                onPressed: () {
                  // provider.remove();
                },
                child: Text('-'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyProvider extends ChangeNotifier {
  int counter = 0;
  String data = "hello";
  String get showdata => data;
  void changeString() {
    data = "hi";
    notifyListeners();
  }

  void add() {
    counter++;
    notifyListeners();
  }

  void remove() {
    counter--;
    notifyListeners();
  }
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<int>(context);
    return Text('counter $counter');
  }
}
