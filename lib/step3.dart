import 'package:flutter/material.dart';

class Step3Page extends StatefulWidget {
  Step3Page({Key? key}) : super(key: key);

  @override
  _BackdropPageState createState() => _BackdropPageState();
}

class _BackdropPageState extends State<Step3Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const _panelHeaderHeight = 32.0;

  // getter about Animation Status
  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      value: 1.0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // widget for backdrop layout
  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Stack(
        children: [
          const Center(
            
            child: Text('base'),
          ),
          Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            elevation: 12,
            child: Column(
              children: [
                Container(
                  height: _panelHeaderHeight,
                  child: const Center(child: Text('panel')),
                ),
                const Expanded(child: Center(child: Text('content'),))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Step2'),
        leading: IconButton(
            onPressed: () {
              _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _controller.view,
            )),
      ),
      body: LayoutBuilder(builder: _buildStack),
    );
  }
}
