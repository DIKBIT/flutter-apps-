import 'package:flutter/material.dart';

class Login extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return new LoginState();
    throw UnimplementedError();
  }

}

class LoginState extends State<Login>
{
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";


  //using this function so that the clear button after being pressed can clear the form.
  void _erase() //underscore is used to make a private function.
  {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  // function to show the name of the username along with welcome.
  void _showWelcome()
  {
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty)
        {
          _welcomeString = _userController.text;
        }
      else
        print("nothing");

    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,  //keeps the title of the app bar in the middle
        backgroundColor: Colors.blueAccent,
      ),

      backgroundColor: Colors.blueGrey, //background of the whole screen or apps body.

      body: new Container( //body of the scaffold or the entire app
        alignment: Alignment.topCenter,
        child: new ListView(   //remember column has children. listview allows us to scroll the widget
          children: <Widget> [
            //image profile or icon.
            new Image.asset('images/097 face.png',  //it will allow us to enter the string which will have the path of our directory in which images are kept
              width: 90.0,
              height: 90.0,
              color: Colors.greenAccent),
            // it changes the color of the png

            //form
            new Container( //inside container we have child and inside column we have children.
              height: 180.0,
              width: 390.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField( //it allows us to enter a text or write on the screen.
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: "Username",
                      icon: new Icon(Icons.person),

                    ),

                  ),

                  new TextField( //it allows us to enter a text or write on the screen.
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: "Password",
                      icon: new Icon(Icons.lock),
                    ),
                    obscureText: true,  //it allows to hide our password.
                  ),


                  // before adding to the raised button, the button was stuck to the password line. but after adding padding to the button it got
                  // spacing from the top, right, and bottom.
                  // as padding will  be for both the buttons so it is placed at the top.


                  new Padding(padding: new EdgeInsets.all(10.5)),  //adding padding to the button
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        //login button
                        new Container(
                          margin: const EdgeInsets.only(left:38.0),  //before having this margin, the login button was sticking to the left side.
                          child: new RaisedButton(onPressed: _showWelcome,
                          color: Colors.redAccent,   //color of the pressable button
                            child: new Text("LOGIN",
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),),
                          ),
                        ),


                        //clear button
                        new Container(
                          margin: const EdgeInsets.only(left:128.0),  //before having this margin, the login button was sticking to the left side.
                          child: new RaisedButton(onPressed: _erase,
                            color: Colors.redAccent,   //color of the pressable button
                            child: new Text("CLEAR",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),),
                          ),
                        )

                      ],
                    ),

                  )
                ],
              )
            ),

            new Padding(padding: const EdgeInsets.all(8.0)),  //since we want the row to be padded so it is kept at the top.
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Welcome $_welcomeString",  //this will return what the user inputs in username.
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,

                  ),
                )
              ],

            )


          ],

        ),

      ),


      );

    throw UnimplementedError();
  }

}