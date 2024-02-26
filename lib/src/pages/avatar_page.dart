import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});
  static final pageName = 'avatar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar'),
        actions: [
          Container(
            padding:const EdgeInsets.all(5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.britannica.com/73/137473-050-EEF6EAFF/Stan-Lee.jpg'),
              radius: 30,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text("MRH"),
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://letraslibres.com/wp-content/uploads/2018/11/stan%20lee.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
          ),
        
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.access_alarm_outlined),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
} 