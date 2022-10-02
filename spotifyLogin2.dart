import 'package:flutter/material.dart';

import '../101/color_learn.dart';

class Spotify extends StatefulWidget {
  const Spotify({Key? key}) : super(key: key);

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //length: 2,
      length: _MyTabSpotifyViews.values.length,
      child: Scaffold(
          appBar: _appBar(),
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
                        child: _emailTextField(),
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.all(10),
                      padding: ProjectPadding.pageEmail,
                      decoration: _BoxEmailPassw(),
                      child: _passwordTextField(),
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
                    _girisButton(),
                    TextButton(
                      onPressed: () {},
                      child: Text(ProjectKeys().Forgot,
                          style: TextStyle(color: Colors.grey)),
                    )
                  ],
                ),
              ),
            ),
//2.SAYFA
            Container(
              color: Colors.green,
            ),
          ])),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ProjectColor.backgroundColor,
      automaticallyImplyLeading: false,
      title: Center(
        child: _projectImage(),
      ),
      bottom: _tabSign(),
    );
  }

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

  Column _projectImage() {
    return Column(
      children: [
        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.only(right: 20),
            color: ProjectColor.backgroundColor,
            child:
                Image.asset(ImageItems().spotify, alignment: Alignment.center),
          ),
        ),
      ],
    );
  }
}

class _passwordTextField extends StatelessWidget {
  const _passwordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //keyboardType: TextInputType.password,
      keyboardType: TextInputType.text,
      obscureText: true,

      autofocus: true,
      autofillHints: const [AutofillHints.password],
      textInputAction: TextInputAction.next,
      decoration: _InputDecoration().passwodInput,
    );
  }
}

class _emailTextField extends StatelessWidget {
  const _emailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,

      autofocus: true,
      autofillHints: const [AutofillHints.email],
      textInputAction: TextInputAction.next,
      decoration: _InputDecoration().emailInput,
      //controller: _emailController,
    );
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

class _girisButton extends StatelessWidget {
  const _girisButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
    );
  }
}

class ProjectKeys {
  final String GirisYap = "SIGN IN ";
  final String Stay = "stay signed in";
  final String Forgot = "Forgot Password?";
}

class ProjectStyle {
  static TextStyle Giris = const TextStyle(color: Colors.white);
}

class ProjectColor {
  static Color backgroundColor = Color.fromARGB(255, 85, 84, 83);
}

class ImageItems {
  final String spotify = "assets/spotify.png";
}

class ProjectPadding {
  static const pageEmail = EdgeInsets.all(20);
}

enum _MyTabSpotifyViews { SIGNIN, SIGNUP }
