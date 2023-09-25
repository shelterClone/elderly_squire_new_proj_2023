import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap:(){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            } ,
            child: Icon(
                Icons.arrow_back_ios_new,

            ),
          ),
          title: const Text('Elderly Squire'),
          backgroundColor: const Color(0XFF526D82),
          elevation: 0,
        ),
        body: Tawk(
          // directChatLink: 'YOUR_DIRECT_CHAT_LINK',
          directChatLink: 'https://tawk.to/chat/648563f094cf5d49dc5cf700/1h2kgsp8d',
          visitor: TawkVisitor(
            name: 'Elder',
            email: '',
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}