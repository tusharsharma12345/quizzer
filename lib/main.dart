import 'package:flutter/material.dart';
import 'package:quizzer/question.dart';
import 'allquestion.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main(){
  runApp(const MyApp());
}
Allquestion ques = Allquestion();
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzer',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  void isreached(){
    if(f>=ques.q.length){
    Alert(context: context, title: "QUIZ OVER", desc: "You play awesome.").show();
    }
  }
  int f=0;
  List<Icon> ic = [];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Center(child: Text('quizzer')),
       backgroundColor: Colors.black,
     ),
     body:
     Center(child: Container(
       color: Colors.black,
       height: double.infinity,
       width: double.infinity,
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             height: 400,
             width: 400,
             child: Center(child: Text(ques.getquestion(),style: TextStyle(fontSize: 25,color: Colors.white),)),
           ),
           Container(height: 70, width: 300,child: ElevatedButton(onPressed: (){
              f++;
              bool selectedanswer = ques.getanswer();
             if(selectedanswer==true){
               ic.add(Icon(Icons.check,color: Colors.green,),);
             }
             else{
               ic.add(Icon(Icons.close,color: Colors.red,),);
             }
             setState(() {
             ques.incre();
             isreached();
             });}, child: Text("TRUE",style: TextStyle(fontSize: 30),),style: ElevatedButton.styleFrom(primary: Colors.lightGreen,)),),
           SizedBox(height: 10,),
           Container(height: 70, width: 300,child: ElevatedButton(onPressed: (){
                f++;
              bool selectedanswerb = ques.getanswer();
             if(selectedanswerb==false){
               ic.add(Icon(Icons.check,color: Colors.green,),);
             }
             else{
               ic.add(Icon(Icons.close,color: Colors.red,),);
             }
             setState(() {
             ques.incre();
             isreached();
             });}, child: Text("FALSE",style: TextStyle(fontSize: 30),),style: ElevatedButton.styleFrom(primary: Colors.red),)),
           Row(
             children: ic,
           )
         ],
       ),
     ),)
   );
  }
}

