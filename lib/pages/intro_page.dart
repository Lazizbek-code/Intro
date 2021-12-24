import 'package:flutter/material.dart';
import 'package:intro_app/pages/home_page.dart';
import 'package:intro_app/utils/String.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({ Key? key }) : super(key: key);
  static const String id = "IntroPage";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    String content;
    String title;
    String image;
    return Scaffold(
      backgroundColor:Colors.white,
     

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged:(int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller: pageController,
            children:[
              makePage(
                image = 'assets/images/image_1.png',
                title = Strings.stepOneTitle, 
                content = Strings.stepOneContent
              ),
               makePage(
                image = 'assets/images/image_2.png',
                title = Strings.stepTwoTitle, 
                content = Strings.stepTwoContent
              ),
               makePage(
                image = 'assets/images/image_1.png',
                title = Strings.stepThreeTitle, 
                content = Strings.stepThreeContent
              ),
            ]
          ),

          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: buildIndicator(),
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 75, right: 20),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               currentIndex==2 ? GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child:Text("Skip", style: TextStyle(color: Colors.red, fontSize:18,))
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                ):Container(),
              ],
            ),
          ),
        ],
      ),

      
    );
  }

  

  Widget makePage(String image, String title, String content){
    return Container(
      padding:const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title, style: TextStyle(color: Colors.red, fontSize: 25),),
              SizedBox(height: 15,),
              Text(content, style: TextStyle(color: Colors.grey, fontSize: 18),),
              SizedBox(height: 15,),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:20),
                child: Image.asset(image),
              ), 
              
              
              
              

            ],
          )
        ],
      ),
    );
  }

  Widget indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: 6,
      width:isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius:BorderRadius.circular(6),
      ),
    );
  }

  List<Widget> buildIndicator(){
    List<Widget> indicators = [];
    for(int i=0; i<3; i++){
      if (currentIndex == i) {
        indicators.add(indicator(true));
      }else{
        indicators.add(indicator(false));
      }
    }

    return indicators;
  }

}