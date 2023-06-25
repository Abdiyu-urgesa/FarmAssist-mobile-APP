import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 5),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/porfile.jpg'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', 'Abdisa W ', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', '0961543704', CupertinoIcons.phone),
              const SizedBox(height: 10),
              itemProfile('Address', 'abc address, xyz city', CupertinoIcons.location),
              const SizedBox(height: 10),
              itemProfile('Email', 'abdisawake5@gmail.com', CupertinoIcons.mail),
              const SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary:Colors.green ,
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Text(
                          'change password',
                          )
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                     width: 150,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary:Colors.green ,
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Text(
                          'Edit Profile',
                          )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
