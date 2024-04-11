import 'package:flutter/material.dart';

class FlipImageWidget extends StatefulWidget {
  const FlipImageWidget({Key? key}) : super(key: key);

  @override
  _FlipImageWidgetState createState() => _FlipImageWidgetState();
}

class _FlipImageWidgetState extends State<FlipImageWidget> {
  bool _isFrontImage = true;

  void _toggleImage() {
    setState(() {
      _isFrontImage = !_isFrontImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleImage,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(20),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: _isFrontImage
                ? const AssetImage('assets/images/homeImages/Tarjeta.jpg')
                : const AssetImage('assets/images/tarjetaAtras.png'),
            fit: BoxFit.fill,
          ),
        ),
        
      ),
    );
  }
}
