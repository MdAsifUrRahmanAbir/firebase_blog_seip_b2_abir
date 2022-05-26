import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_blog_flutter/views/view_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: const Icon(Icons.menu, color: Colors.black,),
        actions:  const [
          Icon(Icons.search, color: Colors.black,),
          SizedBox(width: 5,),
          Icon(Icons.person_rounded, color: Colors.black,),
          SizedBox(width: 8,),
        ],
      ),

      backgroundColor: Colors.white.withOpacity(.9),

      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Daily',
              style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w400,),
              textAlign: TextAlign.center,),

            Text('Recommendation',
              style: GoogleFonts.roboto(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700,),
              textAlign: TextAlign.center,),

            const SizedBox(height: 20,),

            SizedBox(
              height: 270,
              width: double.infinity,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('travel-blog').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasData){
                    print('data collected');
                    print('data length: ${snapshot.data!.docs.length}');
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length ,
                      itemBuilder: (context, index){
                        String? userName = snapshot.data!.docs[index]['userName'];
                        String? image = snapshot.data!.docs[index]['image'];
                        String? travelTitle = snapshot.data!.docs[index]['travelTitle'];
                        String? travelBlog = snapshot.data!.docs[index]['travelBlog'];

                        return InkWell(

                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPage(
                                userName: userName!,
                                travelTitle: travelTitle!,
                                img: image!,
                                travelBlog: travelBlog!
                            )));
                          },

                          child: Container(
                            width: 180,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  child: Image.network('${snapshot.data!.docs[index]['image']}', fit: BoxFit.cover,height: double.infinity,),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                Positioned(
                                    bottom: 20,
                                    left:20,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(travelTitle!,
                                          style: GoogleFonts.roboto(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400,),
                                          textAlign: TextAlign.center,),


                                        const SizedBox(height: 10,),

                                        Row(
                                          children: [
                                            const Icon(Icons.person_rounded, size: 15, color: Colors.grey,),
                                            const SizedBox(width: 5,),
                                            Text(userName!,
                                              style: GoogleFonts.roboto(fontSize: 10, color: Colors.white.withOpacity(.5), fontWeight: FontWeight.w400,),
                                              textAlign: TextAlign.center,),
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 4,
                      ),
                    );
                  }
                  else {
                    print('data collection failled');
                    return Container();
                  }
                },
              )
            ),

            const SizedBox(height: 20,),

            SizedBox(
              height: 20,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index){
                  return SizedBox(
                    width: 70,
                    child: Text('Top',
                      style: GoogleFonts.roboto(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w400,),
                      textAlign: TextAlign.start,),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
              ),
            ),

            const SizedBox(height: 20,),

            Expanded(
              //width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        shadowColor: Colors.green,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 100,
                          decoration: BoxDecoration(
                            //color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset('assets/auth_back.jpg', fit: BoxFit.cover,height: double.infinity,)),
                              ),
                              Expanded(
                                flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded( flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Your Daily',
                                            style: GoogleFonts.roboto(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700,),
                                            textAlign: TextAlign.center,),
                                        ),
                                      ),

                                      Expanded(  flex: 1,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.person_rounded, size: 15, color: Colors.grey,),
                                            const SizedBox(width: 5,),
                                            Text('Mr. SHohag',
                                              style: GoogleFonts.roboto(fontSize: 10, color: Colors.grey.withOpacity(.5), fontWeight: FontWeight.w400,),
                                              textAlign: TextAlign.center,),
                                            const SizedBox(width: 5,),
                                            const Icon(Icons.watch_later_rounded, size: 15, color: Colors.grey,),
                                            const SizedBox(width: 5,),
                                            Text('10 min',
                                              style: GoogleFonts.roboto(fontSize: 10, color: Colors.grey.withOpacity(.5), fontWeight: FontWeight.w400,),
                                              textAlign: TextAlign.center,),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),

                            ],
                          ),

                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    itemCount: 10),
              ),
            )

          ],
        ),
      ),
    );
  }
}
