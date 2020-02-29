import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //color: Colors.white,
        //padding: EdgeInsets.all(7),
        child: Column(
          children: <Widget>[
            coverAndProfileImage(),
            name(),
            Expanded(child: selection(context)),
          ],
        ),
      ),
    );
  }

  Widget name() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey[300]))),
      child: Text(
        'User Name',
        style: TextStyle(color: Colors.grey[600], fontSize: 22),
      ),
    );
  }

  Widget coverAndProfileImage() {
    return Container(
        height: 250,
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
                    height: 200,
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
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 55.0,
                      backgroundImage: AssetImage('assets/images/man.png'),
                    ),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Icon(
                        FontAwesomeIcons.camera,
                        size: 15,
                        color: Colors.blueAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget selection(BuildContext context) {
    return ListView(
      //padding: EdgeInsets.only(left: 10, right: 20, top: 20),
      children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/profile_details');
          },
          leading: Icon(
            FontAwesomeIcons.user,
            size: 25,
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
          title: Text('Profile Details'),
          
        ),
        Divider(
            thickness: 1,
            indent: 64,
          ),
      ],
    );
  }
}
