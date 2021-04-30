import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnizor/Screens/furnizorFormPage.dart';

class HomePage extends StatefulWidget {
  static final String routName = "/HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List currentPage = [
    AllWorkspacePage(),
    FurnizorFormPage(),
  ];

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.grey.shade300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildContainerButton(
                        icon: CupertinoIcons.home,
                        text: "Home",
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        }),
                    buildContainerButton(
                        icon: CupertinoIcons.building_2_fill,
                        text: "Add WorkSpace",
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        }),
                    buildContainerButton(
                        icon:Icons.logout,
                        text: "Logout",
                        onTap: () {
                          setState(() {
                              FirebaseAuth.instance.signOut();
                          });
                        })
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: currentPage[currentIndex],
            ),
          ],
        ),
      ),
    );
  }

  buildContainerButton({icon, text, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Icon(icon), Expanded(flex:1,child: Center(child: Text(text)))],
        ),
      ),
    );
  }
}

class AllWorkspacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
