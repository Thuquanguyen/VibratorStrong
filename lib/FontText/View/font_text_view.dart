import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/FontText/Model/font_model.dart';
import 'package:flutter_app_vibrator_strong/main.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTextView extends StatefulWidget {
  static const String routerName = "/font_text";
  @override
  _FontTextViewState createState() => _FontTextViewState();
}

class _FontTextViewState extends State<FontTextView> {
  List<FontModel> fonts = [FontModel("font1",GoogleFonts.aBeeZee().fontFamily),
    FontModel("font2",GoogleFonts.share().fontFamily),
    FontModel("font3",GoogleFonts.roboto().fontFamily),
    FontModel("font4",GoogleFonts.abelTextTheme().bodyText1.fontFamily),
    FontModel("font5",GoogleFonts.abhayaLibre().fontFamily),
    FontModel("font6",GoogleFonts.zillaSlabHighlightTextTheme().bodyText1.fontFamily),
    FontModel("font7",GoogleFonts.acme().fontFamily),
    FontModel("font8",GoogleFonts.adamina().fontFamily),
    FontModel("font9",GoogleFonts.alata().fontFamily),
    FontModel("font10",GoogleFonts.alegreyaSans().fontFamily),
    FontModel("font11",GoogleFonts.akronim().fontFamily),
    FontModel("font12",GoogleFonts.baiJamjuree().fontFamily),
    FontModel("font13",GoogleFonts.biryani().fontFamily),
    FontModel("font14",GoogleFonts.capriolaTextTheme().bodyText1.fontFamily),
    FontModel("font15",GoogleFonts.beVietnam().fontFamily),
    FontModel("font16",GoogleFonts.bioRhyme().fontFamily),
    FontModel("font17",GoogleFonts.creepsterTextTheme().bodyText1.fontFamily),
    FontModel("font18",GoogleFonts.balooBhaijaanTextTheme().bodyText1.fontFamily),
    FontModel("font19",GoogleFonts.changa().fontFamily),
    FontModel("font20",GoogleFonts.righteous().fontFamily)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Check change font"),leading: IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: Icon(Icons.arrow_back_ios))),
    body: Container(child: ListView.builder(itemBuilder: (context,index){
      return Container(height: 50,child: GestureDetector(child: Column(children: [
        Text(fonts[index].fontStyle,style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 15,),
        Divider(height: 1,)
      ],),onTap: (){
          MyApp.restartApp(context,"fonts",fontStyle: fonts[index].fontStyle);
      },),);
    },itemCount: fonts.length)),);
  }
}
