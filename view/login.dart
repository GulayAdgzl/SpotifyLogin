import 'package:flutter/material.dart';
import 'package:spotify_clone/model/user_request.dart';
import 'package:spotify_clone/service/firebase_service.dart';
import '../const/ProjectColor.dart';
import '../const/ProjectKeys.dart';
import '../const/ImageItems.dart';
import '../const/ProjectStyle.dart';
import '../const/pad.dart';
import '../model/user_auth_error.dart';
import 'Container2.dart';

class Spotify extends StatefulWidget {
  const Spotify({Key? key}) : super(key: key);

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey();
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    String? username;
    String? password;
    FirebaseService servis = FirebaseService();

    return DefaultTabController(
      //length: 2,
      length: _MyTabSpotifyViews.values.length,
      child: Scaffold(
          appBar: AppBar(
              /*title: Expanded(
            child:
                Image.asset(ImageItems().spotify, alignment: Alignment.center),
          )*/
              ),
          body: TabBarView(children: [
            //SIGN IN
            Container(
              color: ProjectColor.backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: ProjectPadding.pageEmail,
                      child: Container(
                        decoration: _BoxEmailPassw(),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          autofillHints: const [AutofillHints.email],
                          textInputAction: TextInputAction.next,
                          decoration: _InputDecoration().emailInput,
                          onChanged: (val) {
                            setState(() {
                              username = val;
                            });
                          },
                        ),
                        //_emailTextField(),
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.all(10),
                      padding: ProjectPadding.pageEmail,
                      decoration: _BoxEmailPassw(),
                      child: TextField(

                          //keyboardType: TextInputType.password,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          autofocus: true,
                          autofillHints: const [AutofillHints.password],
                          textInputAction: TextInputAction.next,
                          decoration: _InputDecoration().passwodInput,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          }),
                      //_passwordTextField(),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {
                            setState(() {
                              checkboxValue = value!;
                            });
                          },
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                        ),
                        Text(ProjectKeys().Stay,
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        var result = await servis.PostSpotify(SpotifyRequest(
                            email: username,
                            password: password,
                            returnSecureToken: true));
                        if (result is FirebaseAuthError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(result.error.message)));
                        }
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => conta()));
                      },
                      child: Container(
                          height: 50,
                          // margin: EdgeInsets.all(20),
                          margin: EdgeInsets.all(10),
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green,
                            // Colors.orange,
                          ),
                          child: Center(
                            child: Text(
                              ProjectKeys().GirisYap,
                              style: ProjectStyle.Giris,
                            ),
                          )),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(ProjectKeys().Forgot,
                          style: TextStyle(color: Colors.grey)),
                    )
                  ],
                ),
              ),
            ),
            const conta(),
//2.SAYFA
            /*Container(
              color: Colors.green,
            ),*/
          ])),
    );
  }

  /* _appBar() {
    return AppBar(
      title: SizedBox(
        child: _projectImage(),
      ),
      toolbarHeight: 20,
    );
  }*/

  BoxDecoration _BoxEmailPassw() {
    return BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
    )));
  }

  TabBar _tabSign() {
    return const TabBar(
      tabs: [
        Tab(text: 'SIGN IN'),
        Tab(text: 'SIGN UP'),
      ],
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Color.fromARGB(255, 20, 136, 23),
    );
  }

  _projectImage() {
    return /*Column(
      children: [
        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.only(right: 20),
            color: ProjectColor.backgroundColor,
            child:*/
        Image.asset(ImageItems().spotify, alignment: Alignment.center);
  }
}

class _InputDecoration {
  final emailInput = InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
    hintText: "Username",
    fillColor: Colors.white,
    filled: true,
  );
  final passwodInput = InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
    hintText: 'Password',
    fillColor: Colors.white,
    // Colors.white,

    filled: true,
  );
}

enum _MyTabSpotifyViews { SIGNIN, SIGNUP }
