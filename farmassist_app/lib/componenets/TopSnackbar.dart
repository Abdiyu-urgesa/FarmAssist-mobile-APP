import 'package:flutter/material.dart';

class TopSnackBar extends StatefulWidget {
  final String message;
  final IconData icon;

  const TopSnackBar({Key? key, required this.message, required this.icon})
      : super(key: key);

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(widget.icon),
                    SizedBox(width: 8.0),
                    Text(widget.message),
                  ],
                ),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: Text('Show Snackbar'),
        );
      },
    );
  }
}


//TopSnackBar(
 // message: 'Hello, world!',
//  icon: Icons.info,
//),