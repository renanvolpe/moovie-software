import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.sizeOf(context).height;
    return Container(
      height: heigth * 0.9,
      margin: EdgeInsets.symmetric(vertical: 80, horizontal: 50),
      child: Image.asset('assets/price-home.png'),
    );
  }
}
