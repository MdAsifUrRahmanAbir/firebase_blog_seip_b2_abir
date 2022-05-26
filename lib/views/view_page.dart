import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPage extends StatelessWidget {
   ViewPage({Key? key, required this.userName, required this.travelTitle, required this.img, required this.travelBlog}) : super(key: key);

   String img;
   String userName;
   String travelTitle;
   String travelBlog;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/2,
                child: Image.asset('assets/auth_back.jpg', fit: BoxFit.cover,height: double.infinity,),
              ),

              Positioned(
                bottom: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.8,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    color: Colors.white
                  ),

                  child: SingleChildScrollView(
                    child: Text('''
$travelBlog                  
                    ''',
                      style: GoogleFonts.roboto(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400,),
                      textAlign: TextAlign.center,),
                  ),

                ),
              ),

              Positioned(
                left: 25,
                top: MediaQuery.of(context).size.height/2 - 200,
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded( flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Your Daily',
                              style: GoogleFonts.roboto(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700,),
                              textAlign: TextAlign.center,),
                          ),
                        ),

                        Expanded(  flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Icon(Icons.person_rounded, size: 20, color: Colors.white.withOpacity(.6),),
                              const SizedBox(width: 5,),
                              Text('Mr. SHohag',
                                style: GoogleFonts.roboto(fontSize: 18, color: Colors.white.withOpacity(.6), fontWeight: FontWeight.w400,),
                                textAlign: TextAlign.center,),
                              const SizedBox(width: 5,),
                               Icon(Icons.watch_later_rounded, size: 20, color: Colors.white.withOpacity(.6),),
                              const SizedBox(width: 5,),
                              Text('10 min',
                                style: GoogleFonts.roboto(fontSize: 15, color: Colors.white.withOpacity(.5), fontWeight: FontWeight.w400,),
                                textAlign: TextAlign.center,),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
