import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';

class AnimatedDecoratedText extends StatelessWidget {

  String text ;

  AnimatedDecoratedText(this.text);
  @override
  Widget build(BuildContext context) {
    return DecoratedText(text: text,
        style: TextStyle(color: Colors.white),
        rules: [
          DecoratorRule(
              regExp: RegExp(r'\*\*(.*?)\*\*',),
              transformMatch: (value) {
                return value.replaceAllMapped('**', (match) => '').replaceAllMapped('*', (match) => '+');
              },
              style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)),
          DecoratorRule(
              regExp: RegExp(r'^##.*'),
              transformMatch: (value) {
                return value.replaceAllMapped('##', (match) => '');
              },
              style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold)),
          DecoratorRule(
              regExp: RegExp(r'^```.*',multiLine: true),
              transformMatch: (value) {
                return value.replaceAllMapped('```', (match) => '');
              },
              trailingBuilder: (p0) => Icon(Icons.code,color: Colors.white,),
              leadingBuilder:(p0) => Icon(Icons.code,color: Colors.white,),
              style: TextStyle(color: Colors.white,fontSize: 16.0,fontStyle: FontStyle.italic),
          ),
          DecoratorRule.url(style: TextStyle(color: Colors.green), onTap: (p0) {

          },),
          DecoratorRule.email(style: TextStyle(color: Colors.red), onTap: (p0) {

          },),
        ]
    );
  }




}
