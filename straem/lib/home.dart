import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:straem/home.provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Stream'),backgroundColor: Colors.blue.withOpacity(0.5),),
      body: Column(
        children: [
          
          Text('data: ${context.watch<HomeProvider>().count1}'),
          TextButton(onPressed: (){
                      context.read<HomeProvider>().inCrement();  //اضافه شدن دستی بدون وجود استریم
          }, child: Text('اضافه کردن دستی بدون استریم')),

          Text('data: ${context.watch<HomeProvider>().count2}'),
          TextButton(onPressed: (){
                final Stream<int> stream = context.read<HomeProvider>().inCrementStreamWhile(5);
                stream.listen((event) {print(event); });
          }, child: Text('اضافه کردن با حلقه به صورت استریم')),

          //Text('data: ${context.watch<HomeProvider>().count3}'),
          TextButton(onPressed: ()async{
            final Stream<int> stream = context.read<HomeProvider>().inCrementStreamWhile(5);
            await for(final event in stream){
              print(event);
            }
          }, child: Text('همون قبلی به کمک حلقه دریافت شود')),

          //Text('data: ${context.watch<HomeProvider>().count3}'),
          TextButton(onPressed: ()async{
            Stream<int> stream = StreamCounter().stream;
            await for(final event in stream){
              print(event);
            }

          }, child: Text(' خروجی به صورت کنسول نشان داده می شود- استریم کنترلر')),
        ],
      ),
    );
  }
}
