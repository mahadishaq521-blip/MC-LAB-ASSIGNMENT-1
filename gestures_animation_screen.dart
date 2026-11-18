import 'package:flutter/material.dart';

class GesturesAnimationScreen extends StatefulWidget {
  const GesturesAnimationScreen({super.key});

  @override
  State<GesturesAnimationScreen> createState() => _GesturesAnimationScreenState();
}

class _GesturesAnimationScreenState extends State<GesturesAnimationScreen> {
  bool _isExpanded = false;
  Color _boxColor = Colors.deepPurpleAccent;
  double _opacity = 1.0;

  String _gestureFeedback = 'Perform a gesture below!';
  String _dragFeedback = 'Drag in the box area';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures & Animations'),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '6. Animated Widget Demonstration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.tealAccent),
            ),
            const SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                    _boxColor = _isExpanded ? Colors.tealAccent : Colors.deepPurpleAccent;
                    _opacity = _opacity == 1.0 ? 0.6 : 1.0;
                  });
                },
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    width: _isExpanded ? 220 : 140,
                    height: _isExpanded ? 220 : 140,
                    decoration: BoxDecoration(
                      color: _boxColor,
                      borderRadius: BorderRadius.circular(_isExpanded ? 30 : 16),
                      boxShadow: [
                        BoxShadow(
                          color: _boxColor.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _isExpanded ? 'Tap to Shrink' : 'Tap to Expand',
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Divider(color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              '5. Five Flutter Gestures Demonstration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.tealAccent),
            ),
            const SizedBox(height: 8),
            Text(
              _gestureFeedback,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => setState(() => _gestureFeedback = 'Detected: onTap! (Single Tap)'),
              onDoubleTap: () => setState(() => _gestureFeedback = 'Detected: onDoubleTap!'),
              onLongPress: () => setState(() => _gestureFeedback = 'Detected: onLongPress!'),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade800),
                ),
                child: const Center(
                  child: Text(
                    'Tap, Double-Tap, or Long-Press Here',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _dragFeedback,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragFeedback = 'Horizontal Drag: dx = \${details.delta.dx.toStringAsFixed(1)}';
                });
              },
              onVerticalDragUpdate: (details) {
                setState(() {
                  _dragFeedback = 'Vertical Drag: dy = \${details.delta.dy.toStringAsFixed(1)}';
                });
              },
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.tealAccent.withOpacity(0.3)),
                ),
                child: const Center(
                  child: Text(
                    'Swipe horizontally or drag vertically inside this area',
                    style: TextStyle(color: Colors.tealAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
