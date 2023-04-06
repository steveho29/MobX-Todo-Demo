import 'package:flutter/material.dart';
import 'package:todo/constants/route_constants.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> with TickerProviderStateMixin {
  late Animation<double> _addButtonAnimation;
  late AnimationController _addButtonAnimationController;

  @override
  void initState() {
    _addButtonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );

    _addButtonAnimation = CurvedAnimation(
      parent: _addButtonAnimationController,
      curve: Curves.easeInOut,
    );

    _addButtonAnimationController.repeat(
      reverse: true,
      period: const Duration(
        milliseconds: 1500,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _addButtonAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: _handleAdd,
      child: AnimatedIcon(
        icon: AnimatedIcons.add_event,
        progress: _addButtonAnimation,
        size: 32.0,
      ),
    );
  }

  void _handleAdd() {
    Navigator.pushNamed(context, RouteConstants.addTodo);
  }
}
