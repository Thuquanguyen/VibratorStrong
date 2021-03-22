import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/Infomation/View/infomation_app.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

class MoreView extends StatefulWidget {
  @override
  _MoreViewState createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Center(child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width - 30,
        height: MediaQuery.of(context).size.height * 2 / 3,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(3))),
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Image.asset("assets/images/ic_crow.png",fit: BoxFit.cover,alignment: Alignment.center),
                  Image.asset("assets/images/ic_crow.png",fit: BoxFit.cover,alignment: Alignment.center,width: 70,height: 70,),
                  Image.asset("assets/images/ic_crow.png",fit: BoxFit.cover,alignment: Alignment.center)
                ],),
                SizedBox(height: 10),
                Text("MORE",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center),
                SizedBox(height: 3),
                Divider(height: 4,color: Colors.grey),
                SizedBox(height: 20),
                Flexible(child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                        Icon(Icons.error_outline,size: 60,color: Colors.redAccent),
                        SizedBox(height: 10),
                        Text("Infomation")
                      ],),onTap: (){
                          Navigator.of(context).pushNamed(InfomationApp.routerName);
                      },),
                      SizedBox(height: 20),
                      GestureDetector(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                        Icon(Icons.share,size: 40,color: Colors.redAccent),
                        SizedBox(height: 10),
                        Text("Share Application")
                      ],),onTap: (){
                        showDialog(
                          barrierDismissible: false,
                          context: context, // this context should be passed to Future Function as parameter
                          builder: (BuildContext cx) {
                            return AlertDialog(
                              actions: [
                                Column(children: [
                                  Text("Choose",style: TextStyle(color: Colors.black)),
                                  SizedBox(height: 10),
                                  Divider(height: 1),
                                  SizedBox(height: 10),
                                  GestureDetector(child: Text("Mail",style: TextStyle(color: Colors.blue)),onTap: (){
                                    shareEmail();
                                    Navigator.of(context).pop();
                                  },),
                                  SizedBox(height: 10),
                                  Divider(height: 1),
                                  SizedBox(height: 10),
                                  GestureDetector(child: Text("Facebook",style: TextStyle(color: Colors.blue)),onTap: (){
                                    // shareOnFacebook();
                                    Navigator.of(context).pop();
                                  },),
                                  SizedBox(height: 10),
                                  Divider(height: 1),
                                  SizedBox(height: 10),
                                  GestureDetector(child: Text("Instagram",style: TextStyle(color: Colors.blue)),onTap: (){
                                    shareOnInstagram();
                                    Navigator.of(context).pop();
                                  },),
                                  SizedBox(height: 10),
                                  Divider(height: 1),
                                  SizedBox(height: 10),
                                  GestureDetector(child: Text("Cancel",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),onTap: (){
                                    Navigator.of(context).pop();
                                    print("cancel");
                                  },),
                                  SizedBox(height: 10)
                                ],),
                              ],
                            );
                          },
                        );
                      },)
                    ],),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                    GestureDetector(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Icon(Icons.stars,size: 60,color: Colors.redAccent),
                      SizedBox(height: 10),
                      Text("Rate Application")
                    ],),onTap: (){},),
                    SizedBox(height: 20),
                    GestureDetector(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Icon(Icons.feedback,size: 40,color: Colors.redAccent),
                      SizedBox(height: 10),
                      Text("Feedback")
                    ],),onTap: (){
                      shareEmail();
                    },)
                  ],)
                ],),))
              ],
            )),
      ),),
    );
  }

}

/// SHARE ON FACEBOOK CALL
shareOnFacebook() async { await FlutterSocialContentShare.share(
      type: ShareType.facebookWithoutImage,
      url: "https://www.google.com",
      quote: "Extreme Vibration App");
}

/// SHARE ON INSTAGRAM CALL
shareOnInstagram() async {
  await FlutterSocialContentShare.share(
      type: ShareType.instagramWithImageUrl,
      imageUrl:
      "https://post.healthline.com/wp-content/uploads/2020/09/healthy-eating-ingredients-732x549-thumbnail-732x549.jpg");
}

/// SHARE ON EMAIL CALL
shareEmail() async {
  var body = "Your suggestions on the application:\n=============Device\ninfomation (use for support only)";
  var url = 'mailto:quangthu1162@gmail.com?subject=Extreme Vibration App&body=$body';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
