import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:straem/home.provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<HomeProvider>().inCrement();
        },
        child: Text('Click'),),
      appBar: AppBar(title: Text('Stream'),backgroundColor: Colors.blue.withOpacity(0.5),),
      body: Center(child: Text('data: ${context.watch<HomeProvider>().count}')),
    );
  }
}
