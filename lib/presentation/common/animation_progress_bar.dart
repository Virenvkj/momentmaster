import 'package:flutter/widgets.dart';
import 'package:momentmaster/core/constants/app_colors.dart';
import 'package:momentmaster/core/constants/app_constants.dart';

class FAProgressBar extends StatefulWidget {
  const FAProgressBar({
    super.key,
    this.currentValue = 0,
    this.maxValue = 100,
    this.size = 30,
    this.animatedDuration = const Duration(milliseconds: 300),
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    this.borderRadius = 8,
    this.border,
    this.backgroundColor = const Color(0x00FFFFFF),
    this.progressColor = const Color(0xFFFA7268),
    this.changeColorValue,
    this.changeProgressColor = const Color(0xFF5F4B8B),
    this.displayText,
    this.displayTextStyle =
        const TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
  });
  final int currentValue;
  final int maxValue;
  final double size;
  final Duration animatedDuration;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final double borderRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final Color progressColor;
  final int? changeColorValue;
  final Color changeProgressColor;
  final String? displayText;
  final TextStyle displayTextStyle;

  @override
  _FAProgressBarState createState() => _FAProgressBarState();
}

class _FAProgressBarState extends State<FAProgressBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  double _currentBegin = 0;
  double _currentEnd = 0;

  @override
  void initState() {
    _controller =
        AnimationController(duration: widget.animatedDuration, vsync: this);
    _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
        .animate(_controller);
    triggerAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(FAProgressBar old) {
    triggerAnimation();
    super.didUpdateWidget(old);
  }

  void triggerAnimation() {
    setState(() {
      _currentBegin = _animation.value;
      _currentEnd = widget.currentValue / widget.maxValue;
      _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
          .animate(_controller);
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedProgressBar(
        animation: _animation,
        widget: widget,
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  const AnimatedProgressBar({
    super.key,
    required Animation<double> animation,
    this.widget,
  }) : super(listenable: animation);
  final widget;

  double transformValue(x, begin, end, before) {
    double y = (end * x - (begin - before)) * (1 / before);
    return y < 0 ? 0 : ((y > 1) ? 1 : y);
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = widget.animation;
    Color? progressColor = widget.progressColor;

    if (widget.changeColorValue != null) {
      final colorTween = ColorTween(
        begin: widget.progressColor,
        end: widget.changeProgressColor,
      );
      progressColor = colorTween.transform(transformValue(
        animation.value,
        widget.changeColorValue,
        widget.maxValue,
        5,
      ));
    }

    List<Widget> progressWidgets = [];
    Widget progressWidget = Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(50),
              bottomRight: const Radius.circular(50),
              topLeft: widget.currentValue > 90
                  ? const Radius.circular(50)
                  : const Radius.circular(0),
              topRight: widget.currentValue > 90
                  ? const Radius.circular(50)
                  : const Radius.circular(0),
            ),
          ),
        ),
        Column(
          children: [
            AppConstants.sizer(0.008, 0, context),
            Row(
              children: [
                AppConstants.sizer(0, 0.01, context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.02,
                  height: MediaQuery.of(context).size.width * 0.02,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                AppConstants.sizer(0, 0.01, context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.01,
                  height: MediaQuery.of(context).size.width * 0.01,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                AppConstants.sizer(0, 0.01, context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.012,
                  height: MediaQuery.of(context).size.width * 0.012,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            AppConstants.sizer(0.005, 0, context),
            Row(
              children: [
                AppConstants.sizer(0, 0.01, context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.01,
                  height: MediaQuery.of(context).size.width * 0.01,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                AppConstants.sizer(0, 0.01, context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.015,
                  height: MediaQuery.of(context).size.width * 0.015,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                AppConstants.sizer(0, 0.005, context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.01,
                  height: MediaQuery.of(context).size.width * 0.01,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                AppConstants.sizer(0, 0.003, context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.015,
                  height: MediaQuery.of(context).size.width * 0.015,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
    progressWidgets.add(progressWidget);

    if (widget.displayText != null) {
      Widget textProgress = Container(
        alignment: widget.direction == Axis.horizontal
            ? const FractionalOffset(0.95, 0.5)
            : (widget.verticalDirection == VerticalDirection.up
                ? widget.currentValue < 40
                    ? const FractionalOffset(0.5, -1.0)
                    : const FractionalOffset(0.5, -0.2)
                : const FractionalOffset(0.5, 0.95)),
        child: Text(
          (animation.value * widget.maxValue).toInt().toString() +
              widget.displayText,
          softWrap: true,
          style: widget.displayTextStyle,
        ),
      );
      progressWidgets.add(textProgress);
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: widget.direction == Axis.vertical ? widget.size : null,
        height: widget.direction == Axis.horizontal ? widget.size : null,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: widget.border,
        ),
        child: Flex(
          direction: widget.direction,
          verticalDirection: widget.verticalDirection,
          children: <Widget>[
            Expanded(
              flex: (animation.value * 100).toInt(),
              child: Stack(
                children: progressWidgets,
              ),
            ),
            Expanded(
              flex: 100 - (animation.value * 100).toInt(),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
