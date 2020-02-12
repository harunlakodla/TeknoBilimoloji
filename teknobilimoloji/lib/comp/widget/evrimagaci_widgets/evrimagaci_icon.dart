import 'package:flutter/material.dart';

class EvrimAgaci_Icon extends StatelessWidget {
  const EvrimAgaci_Icon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
              top: 10.0,
              left: 10.0,
              child: Container(
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0)
                ),
                child: Image.network('https://yt3.ggpht.com/a/AGF-l7-XN6eHABcoWxkqATMiGD-k1szOnhzlzLqx1Q=s900-c-k-c0xffffffff-no-rj-mo',fit: BoxFit.cover,),
              ),
            );
  }
}