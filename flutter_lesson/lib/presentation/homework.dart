import 'package:flutter/material.dart';


void main(){
 runApp(const App());
}
class App extends StatelessWidget{
 const App({super.key});
 @override
 Widget build(BuildContext context){
   return MaterialApp(
     title: 'Assignments',
     theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
       useMaterial3: true,
     ),
     home: _Assignments(),
   );
 }
}


class _Assignments extends StatelessWidget{
 const _Assignments();
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.lightBlueAccent ,
       foregroundColor: Colors.white,
       title: const Text('Assignments'),
       centerTitle: true
     ),
     body: Column(
      children: [
       Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const SizedBox(height: 40),
             Container(
               width: 400,
               height: 200,
               padding: const EdgeInsets.all(20),
               decoration: BoxDecoration(
               color: Colors.amberAccent,
               borderRadius: BorderRadius.circular(30),
               ),
               child: const Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Icon(Icons.assignment_turned_in,
                   size: 80,
                   color: Color.fromARGB(255, 32, 88, 135)),
                   Text('Assignments_turned_in',
                   style: TextStyle(
                     fontSize: 25
                   )
                   ),
                   Text(
                     'Pending',
                     style: TextStyle(
                       fontSize: 20
                     ))
                 ],
               ),
              
             ),
           ],
         ),
       ),
       Center(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               const SizedBox(height: 50),
               _AssignmentBlock(title: 'Assignment #1', status: 'Not submitted', time: 'Oct 7'),
               const SizedBox(height: 10),
               _AssignmentBlock(title: 'Assignment #2', status: 'Not submitted', time: 'Oct 26'),
               const SizedBox(height: 10),
               _AssignmentBlock(title: 'Assignment #3', status: 'Submitted', time: 'Dec 5'),
             ],
           ),
         ],
       ),
     )
     ]
     )
   );
 }
}


class _AssignmentBlock extends StatelessWidget{
 final String title;
 final String status;
 final String time;
 const _AssignmentBlock({
   required this.title,
   required this.status,
   required this.time,
 });
 @override
 Widget build(BuildContext context){
   return Container(
       padding: const EdgeInsets.only(left: 20, top: 10),
       height: 150,
       width: 400,
       decoration: BoxDecoration(
         color: const Color.fromARGB(255, 237, 235, 225),
         borderRadius: BorderRadius.circular(20),
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(title,
           style: TextStyle(
             fontSize: 30,
           )),
           SizedBox(height: 10),
           Text('Status: $status',
           style: TextStyle(
             fontSize: 20,
           )),
           Text('Due: $time',
           style: TextStyle(
             fontSize: 20,
           ))
         ],
       ),
   );
 }
}

