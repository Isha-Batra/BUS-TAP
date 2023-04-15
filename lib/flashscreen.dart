import 'package:flutter/material.dart';
class Flash_screen extends StatelessWidget {
  const Flash_screen({Key? key}) : super(key: key);
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('background/flash_back.jpeg'),
          fit: BoxFit.cover,
        )
      ),
      
    );
  }
}
