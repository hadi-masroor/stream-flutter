import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:straem/home.provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Stream<int> stream = context.read<HomeProvider>().inCrementStreamWhile(5);
    
    return Scaffold(
      appBar: AppBar(title: Text('Stream'),backgroundColor: Colors.blue.withOpacity(0.5),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Text('data: ${context.watch<HomeProvider>().count1}'),
          TextButton(onPressed: (){
                      context.read<HomeProvider>().inCrement();  //اضافه شدن دستی بدون وجود استریم
          }, child: Text('اضافه کردن دستی بدون استریم')),

          Text('data: ${context.watch<HomeProvider>().count2}'),
          TextButton(onPressed: (){
                      stream.listen((event) {print(event); });
          }, child: Text('اضافه کردن با حلقه به صورت استریم')),

          Text('data: ${context.watch<HomeProvider>().count3}'),
          TextButton(onPressed: (){}, child: Text('اضافه کردن دستی بدون استریم')),

          Text('data: ${context.watch<HomeProvider>().count4}'),
          TextButton(onPressed: (){}, child: Text('اضافه کردن دستی بدون استریم')),
        ],
      ),
    );
  }
}
