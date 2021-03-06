import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      width: double.infinity,
      child: Column(
        children: [
          AvatarGlow(
            endRadius: 90,
            duration: Duration(seconds: 2),
            glowColor: Colors.white24,
            repeat: true,
            repeatPauseDuration: Duration(seconds: 2),
            startDelay: Duration(seconds: 1),
            child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Image.asset('assets/avatar.jpg'),
                  radius: 50.0,
                )),
          ),
          SelectableText(
            'human elizavet',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SelectableText('writer - vlogger'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
