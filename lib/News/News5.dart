import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/News/NewsHome.dart';
import 'package:elderly_squire_2023_remastered_v2/News/news_model.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
// import 'package:adv_mob_mtrep_official/recipe_data.dart';
import 'package:flutter/material.dart';

class News5 extends StatefulWidget {
  News5({super.key});

  @override
  News5State createState() => News5State();
}

class News5State extends State<News5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 75,
//          backgroundColor: Colors.blueGrey[900],
          backgroundColor: Colors.blueGrey[900],

          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsHome()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (_, index) => Column(
            children: [
              Container(
                height: 300,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  child:
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          '${newslist[4]['image']}',
                        ),
                      ),
                    ),
                  ),


                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20, bottom: 10,top:20),
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Text(
                      '${newslist[4]['title']}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20, top: 20,right:20,bottom: 50),
                alignment: Alignment.topLeft,
                child: Text(
                  '${newslist[4]['description']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top:280),
                margin: EdgeInsets.only(top:20, bottom:40),
                height: 50,
                width: 250,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsHome()));

                  },

                ),
              ),











            ],
          ),
        ));
  }
}
