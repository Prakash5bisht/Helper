import 'package:flutter/material.dart';
import 'package:helper/view/web_view/CenteredView.dart';
import 'package:helper/view/web_view/IntroText.dart';
import 'package:helper/view/web_view/MyNavigationBar.dart';
import 'package:helper/view/web_view/widgets/ActionButton.dart';
import 'package:helper/view/web_view/widgets/clip.dart';
import 'package:helper/view/web_view/widgets/list_of_services.dart';
import 'package:helper/view/web_view/widgets/service_title.dart';

class HomeViewDesktop extends StatelessWidget {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyNavigationBar(),
            CenteredView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IntroText(),
                      SizedBox(
                        width: 60,
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              AnimationClip(),
                              SizedBox(
                                height: 50,
                              ),
                              ActionButton(scrollController: _scrollController)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
              color: Color(0xff304FFE),
              child: Column(
                children: [
                  ServiceTitle(fontSize: 50,),
                  SizedBox(
                    height: 20.0,
                  ),
                  ListOfServices(web: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


