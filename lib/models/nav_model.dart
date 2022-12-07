

import 'package:flutter/material.dart';

class Screens {
  const Screens(this.label, this.icon);
  final String label;
  final IconData icon;
 
}

const List<Screens> allScreens = <Screens>[
  Screens('Home', Icons.home, ),
  Screens('List', Icons.list,),
  Screens('Chat', Icons.message,),
  Screens('Profile', Icons.person,),

];