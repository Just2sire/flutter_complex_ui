import 'package:complex_ui/core/utils/extensions.dart';
import 'package:complex_ui/uis/home_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawerScreen extends StatefulWidget {
  const CustomDrawerScreen({super.key});

  @override
  State<CustomDrawerScreen> createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController drawerAnimationController;
  bool _canBeDragged = false;
  final minDragStartEdge = 80.0;
  final maxDragStartEdge = 350.0;

  @override
  void initState() {
    super.initState();
    drawerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  /// Determines if a horizontal drag gesture can start based on the current
  /// drawer state and the drag's starting position.
  ///
  /// [details] provides information about the drag gesture's start.
  void _onDragStart(DragStartDetails details) {
    final isDragOpenFromLeft =
        drawerAnimationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    final isDragCloseFromRight =
        drawerAnimationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  /// Updates the drawer's position during a horizontal drag gesture.
  ///
  /// If the drag is allowed (`_canBeDragged` is true), this method calculates
  /// how much the drawer should move based on the drag's delta and updates
  /// the animation controller's value.
  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      final delta = details.primaryDelta! / (context.width / 2);
      drawerAnimationController.value += delta;
    }
  }

  /// Handles the end of a horizontal drag gesture, determining whether to
  /// fling the drawer open or closed, or to animate it to a specific state.
  ///
  /// If the drawer is fully open or closed, this method does nothing.
  /// If the drag velocity exceeds a threshold, the drawer is flung open or
  /// closed based on the direction. Otherwise, the drawer is animated to
  /// either the open or closed state depending on whether it is more than
  /// halfway open.
  void _onDragEnd(DragEndDetails details) {
    if (drawerAnimationController.isDismissed ||
        drawerAnimationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      final visualVelocity =
          details.velocity.pixelsPerSecond.dx / context.width;
      drawerAnimationController.fling(velocity: visualVelocity);
    } else if (drawerAnimationController.value < 0.5) {
      drawerAnimationController.reverse();
    } else {
      drawerAnimationController.forward();
    }
  }

  /// Toggles the drawer's animation between the open and closed states.
  ///
  /// If the drawer is currently closed, it will open; if open, it will close.
  void toggleAnimation() {
    if (drawerAnimationController.isDismissed) {
      drawerAnimationController.forward();
    } else {
      drawerAnimationController.reverse();
    }
  }

  @override
  void dispose() {
    drawerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxSlide = context.width / 2;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragEnd: _onDragEnd,
        onHorizontalDragUpdate: _onDragUpdate,
        child: AnimatedBuilder(
          animation: drawerAnimationController,
          child: HomeScreen(toggleDrawer: toggleAnimation),
          builder: (context, child) {
            final scaleValue = 1 - (drawerAnimationController.value * 0.5);
            final slideValue = drawerAnimationController.value * maxSlide;
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 50,
                            horizontal: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Custom UI",
                                style: context.textTheme.headlineSmall!
                                    .copyWith(
                                      color: context.colorScheme.onSecondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                "First UI",
                                style: context.textTheme.titleLarge!.copyWith(
                                  color: context.colorScheme.onSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Flexible(child: SizedBox()),
                    ],
                  ),
                ),
                Transform(
                  transform:
                      Matrix4.identity()
                        ..translate(slideValue)
                        ..scale(scaleValue),
                  alignment: Alignment.centerLeft,
                  child: child,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// <<======================================================================>>

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({required this.child, super.key});
  final Widget child;

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController drawerAnimationController;
  bool _canBeDragged = false;
  final minDragStartEdge = 80.0;
  final maxDragStartEdge = 350.0;

  @override
  void initState() {
    super.initState();
    drawerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  /// Determines if a horizontal drag gesture can start based on the current
  /// drawer state and the drag's starting position.
  ///
  /// [details] provides information about the drag gesture's start.
  void _onDragStart(DragStartDetails details) {
    final isDragOpenFromLeft =
        drawerAnimationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    final isDragCloseFromRight =
        drawerAnimationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  /// Updates the drawer's position during a horizontal drag gesture.
  ///
  /// If the drag is allowed (`_canBeDragged` is true), this method calculates
  /// how much the drawer should move based on the drag's delta and updates
  /// the animation controller's value.
  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      final delta = details.primaryDelta! / (context.width / 2);
      drawerAnimationController.value += delta;
    }
  }

  /// Handles the end of a horizontal drag gesture, determining whether to
  /// fling the drawer open or closed, or to animate it to a specific state.
  ///
  /// If the drawer is fully open or closed, this method does nothing.
  /// If the drag velocity exceeds a threshold, the drawer is flung open or
  /// closed based on the direction. Otherwise, the drawer is animated to
  /// either the open or closed state depending on whether it is more than
  /// halfway open.
  void _onDragEnd(DragEndDetails details) {
    if (drawerAnimationController.isDismissed ||
        drawerAnimationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      final visualVelocity =
          details.velocity.pixelsPerSecond.dx / context.width;
      drawerAnimationController.fling(velocity: visualVelocity);
    } else if (drawerAnimationController.value < 0.5) {
      drawerAnimationController.reverse();
    } else {
      drawerAnimationController.forward();
    }
  }

  /// Toggles the drawer's animation between the open and closed states.
  ///
  /// If the drawer is currently closed, it will open; if open, it will close.
  void toggleAnimation() {
    if (drawerAnimationController.isDismissed) {
      drawerAnimationController.forward();
    } else {
      drawerAnimationController.reverse();
    }
  }

  @override
  void dispose() {
    drawerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxSlide = context.width / 2;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragEnd: _onDragEnd,
        onHorizontalDragUpdate: _onDragUpdate,
        child: AnimatedBuilder(
          animation: drawerAnimationController,
          child: widget.child,
          builder: (context, child) {
            final scaleValue = 1 - (drawerAnimationController.value * 0.5);
            final slideValue = drawerAnimationController.value * maxSlide;
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                  ),
                ),
                Transform(
                  transform:
                      Matrix4.identity()
                        ..translate(slideValue)
                        ..scale(scaleValue),
                  alignment: Alignment.centerLeft,
                  child: child,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
