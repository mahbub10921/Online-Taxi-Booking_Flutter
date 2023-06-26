import 'package:flutter/material.dart';

class BlinkingButton extends StatefulWidget {
  @override
  _BlinkingButtonState createState() => _BlinkingButtonState();
}

class _BlinkingButtonState extends State<BlinkingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _animationController.value < 0.5 ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
        onPressed: () {
          // Button's onPress functionality here
        },
        child: Text('Blinking Button'),
      ),
    );
  }
}

// Example usage:
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blinking Button Example'),
      ),
      body: Center(
        child: BlinkingButton(),
      ),
    );
  }
}
