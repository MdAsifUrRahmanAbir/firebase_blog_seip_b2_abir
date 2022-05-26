import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class LandPage extends StatelessWidget {
  const LandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/auth_back.jpg',fit: BoxFit.cover,height: double.infinity,).blurred(blur: .1, blurColor: Colors.black.withOpacity(.2)),

            Positioned(
              top: 40,
                left: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Everyday New',
                      style: GoogleFonts.roboto(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w400,),
                      textAlign: TextAlign.center,),

                    Text('Travel Blog',
                      style: GoogleFonts.abrilFatface(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700,),
                      textAlign: TextAlign.center,),
                  ],
                )
            ),

            Positioned(
              bottom: 30,
                left: 1,
                right: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      },

                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 272,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),

                        child: Text('SIGN IN',
                          style: GoogleFonts.roboto(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.w400,),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(

                      onTap: (){
                        //Login(context: context, email: _emailController.text, pass: _passController.text);
                      },

                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 272,
                        decoration:  BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child: Text('SIGN IN WITH GOOGLE',
                          style: GoogleFonts.roboto(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400,),
                          textAlign: TextAlign.center,),
                      ),
                    )
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
