import 'package:flutter/material.dart';

class InfomationApp extends StatefulWidget {
  static const String routerName = "/infomation";

  @override
  _InfomationAppState createState() => _InfomationAppState();
}

class _InfomationAppState extends State<InfomationApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Infomation",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset("assets/images/ic_app.png"),
              title: Text(
                "Phone Vibration Strong",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Email: quangthu1162@gmail.com"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "     Application Infomation:",
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
                child: Container(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Text('''Vibrate massager simulated for you!
This applications will helps your phone is will vibrating almost like a massage device handy. It is simulated application.
Enabling applications with the features and select the mode:  - You can customize some interface components.
- Vibrate the phone constantly, constant vibration. 
- Vibrate the phone for a long hnbfhf, long vibrations. 
- Vibrate the phone intermittent vibration rhythm.
- Now you can choose 2 Option. And 8 modes to choose incoming. And more in future. - Can custom time vibration
- The level of vibration depends on the hardware of the phone. 

Note: This application is like a joke on the phone, it is only complementary solution, not a substitute for professional massage equipment. Using applications with long time could affect device hardw

are, as well as the battery life of the device.'''),
            )),
          ],
        ),
      ),
    );
  }
}
