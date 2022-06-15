import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchScreen extends StatefulWidget {

  @override
  _searchScreenState createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {

  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600],
          image: DecorationImage(
              image: AssetImage("images/searchScreenBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                alignment: Alignment.bottomLeft,
                height: 100,
                width: 100,
                child: IconButton(iconSize: 60,icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () => Navigator.pop(context)),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    child: Icon(Icons.location_city,color: Colors.white,),
                  ),
                ),
                Expanded(
                  flex: 5,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: TextField(
                          cursorColor: Colors.grey[700],
                          controller: cityController,
                          style: TextStyle(decoration: TextDecoration.none,color: Colors.grey[700],fontSize: 20.0),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter City Name",
                            hintStyle: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: FlatButton(
                    splashColor: Colors.white.withOpacity(0),
                    onPressed: ()
                    {
                          Navigator.pop(context,cityController.text);
                    },
                    child: Text("GET WEATHER",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
