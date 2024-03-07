import 'package:chatui/Styles/margins.dart';
import 'package:chatui/Styles/textStyles.dart';
import 'package:chatui/Views/HomeView.dart';
import 'package:flutter/material.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/SplashBg.png"),
                  fit: BoxFit.cover
                )
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin, vertical: margin*2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Stay connected with your friends and family", style: bigHeading.copyWith(color: Colors.white),),
                  const SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage("assets/images/ph_shield-check-fill.png")),
                      const SizedBox(width: 4,),
                      Expanded(child: Text("Secure, private messaging", style: heading3FontStyle.copyWith(color: Colors.white),)),
                    ],
                  ),
                  const SizedBox(height: 6,),
                  getStartedButton(context),
                ],
              ),
            )
          )
        ],
      )
    );
  }

  Widget getStartedButton(BuildContext context){
    return SizedBox(
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return const HomeView();
        }));          
        }, 
        child: const Center(child: Text("Get Started", style: heading2FontStyle,),)
      ),
    );
  }

}