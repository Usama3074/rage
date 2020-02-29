import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rant/constants/text_field.dart';

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.times,
                color: Colors.white,
              ),
              onPressed: null)
        ],
        title: Text('Profile Details'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        coverAndProfileImage(),
                        profileDetail(context),
                      ],
                    ))));
      }),
    );
  }

  Widget coverAndProfileImage() {
    return Container(
        height: 300,
        child: Stack(
          alignment: Alignment(0, 0),
          children: <Widget>[
            Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: Image(
                    image: AssetImage('assets/images/cover.jpg'),
                    fit: BoxFit.cover,
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                    right: 5,
                    bottom: 60,
                    child: Container(
                      //alignment: Alignment.center,
                      height: 30,
                      width: 70,
                      child: Card(
                          color: Colors.grey[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.camera,
                                size: 13,
                                color: Colors.grey[400],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 16),
                              )
                            ],
                          )),
                    ))
              ],
            ),
            Positioned(
              bottom: 1,
              child: Stack(
                alignment: Alignment(0, 0),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 90.0,
                      backgroundImage: AssetImage('assets/images/man.png'),
                    ),
                  ),
                  Positioned(
                    right: circleX(90, 45) - 10,
                    bottom: circleY(90, 45) - 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile_crop');
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          FontAwesomeIcons.camera,
                          size: 20,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  circleX(num radius, num angle) {
    return radius - cos(radians(angle)) * radius;
  }

  circleY(num radius, num angle) {
    return radius - sin(radians(angle)) * radius;
  }

  radians(num degree) {
    return degree * (pi / 180);
  }

  Widget profileDetail(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FieldText(
            hint: 'Enter Name',
            label: "Name",
          ),
          FieldText(
            hint: 'Enter Email',
            label: "Email",
            inputType: TextInputType.emailAddress,
          ),
          FieldText(
            hint: 'Enter Mobile Number',
            label: "Mobile No",
            inputType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
