import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListPage extends StatelessWidget {
  ListPage({
    super.key,
    required this.taskName,
    required this.taskcompleted,
    this.onChanged,
    this.deleteFunction
  });

  final String taskName;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)?deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Slidable(

        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
         borderRadius: BorderRadius.circular(15), backgroundColor: Colors.grey,
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                checkColor: Colors.amber,
                activeColor: Colors.black,
                side: BorderSide(color: Colors.deepOrange),
              ),
              Text(taskName),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
