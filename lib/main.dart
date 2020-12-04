import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
      void main () {
        runApp(MyApp());
      }
      var first = 0.0 , second = 0.0 , res = 0.0 ;
      var resdis = "Result = " + "0.0";
      //operator list
      List<String> _op = ['+', '-', '*', '/'];
      String op_sy = '+';


      TextEditingController firstcontroller = new TextEditingController();
      TextEditingController secondcontroller = new TextEditingController();


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.brown[100],
              appBar: AppBar(
                title: Text("DSC Calculator",
                style: TextStyle(color: Colors.white, fontSize: 25.0,fontFamily: "SansitaSwashed" ,fontWeight: FontWeight.w800 ),
                ),
                centerTitle: true ,
                backgroundColor: Colors.brown[600],
              ),
              body: Container(
                margin: EdgeInsets.only(left: 32.0,right: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500.0,
                    ),
                    Row(
                      children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: firstcontroller,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.brown[600],fontWeight: FontWeight.bold,fontSize: 15.0),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),) ,
                                hintText: "First Num" ,
                              ),

                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: DropdownButton <String> (
                                  style: TextStyle(color: Colors.brown[600],fontSize: 40.0),
                                  items: _op.map((String dropDownStringItem){
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),

                                  onChanged: (String nop){
                                      setState(() {
                                        op_sy =  nop;
                                      });
                                  },
                                  value: op_sy,

                              ),
                            )
                          ),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: secondcontroller,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.brown[600],fontWeight: FontWeight.bold,fontSize: 15.0),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),) ,
                                hintText: "Second Num" ,
                              ),

                            ),
                          ),

                        ],
                      ),

                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 16.0,bottom: 16.0),
                        width: 100.0,
                        height: 50.0,
                        child: RaisedButton(
                            color: Colors.brown[600],
                          onPressed: (){
                                setState(() {
                                  first = double.parse(firstcontroller.text);
                                  second = double.parse(secondcontroller.text);
                                  if(op_sy == '+')
                                    {
                                      res =  first + second ;
                                      resdis = "Result = " + res.toString();
                                    }
                                  if(op_sy == '-')
                                  {
                                    res =  first - second ;
                                    resdis = "Result = " + res.toString();
                                  }
                                  if(op_sy == '*')
                                  {
                                    res =  first * second ;
                                    resdis = "Result = " + res.toString();
                                  }
                                  if(op_sy == '/'&& second != 0)
                                  {
                                    res =  first / second ;
                                    resdis = "Result = " + res.toString();
                                  }
                                  if(op_sy == '/'&& second == 0)
                                  {
                                    resdis = "Can't Divide on Zero";
                                  }



                                });
                          },

                          child: Text(
                            "Calculate",style: TextStyle(
                              fontFamily: "DancingScript",fontSize: 20.0,fontWeight: FontWeight.w800,
                              color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: Container(
                          child: Text(resdis,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25.0,fontFamily: "DancingScript",fontWeight: FontWeight.w800,color: Colors.brown[500]),
                          ),
                        ),
                    ),

                  ],
                ),
              ),

            ),
          );
        }
}




