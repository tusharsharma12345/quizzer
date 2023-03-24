import 'package:flutter/material.dart';
import 'package:quizzer/question.dart';
import 'allquestion.dart';

class Allquestion{
int index =0;
 List<Question> q=[Question("is 2+2=4?", true),
 Question("is 2+2=6?", false),
 Question("is sky blue?", true)];
 void incre(){
 if(index < q.length-1){index++;
 print("$index");}

 }
 String getquestion(){
  return q[index].Que;
 }
 bool getanswer(){
  return q[index].boo;
 }
}