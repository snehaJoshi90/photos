import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photos/screens/add_task/bloc/add_task_state.dart';
import 'package:photos/screens/add_task/bloc/add_task_cubit.dart';
import 'package:photos/screens/add_task/model/add_task_response.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 // int selectedOption = 1;
  bool completed = false;

  AddTaskCubit? addTaskCubit;

  @override
  void initState() {
    super.initState();

    addTaskCubit = BlocProvider.of<AddTaskCubit>(context);
    addTaskCubit?.addTaskDetails(completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add new task'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              BlocBuilder<AddTaskCubit, AddTaskState>(
                  builder: (context, state) {
                if (state.addTaskResponseStatus ==
                    AddTaskResponseStatus.loading) {
                  return CircularProgressIndicator();
                } else if (state.addTaskResponseStatus ==
                    AddTaskResponseStatus.addTaskSuccess) {
                  final addTask = state.addTaskResponse;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('User Id: '),
                          Text(
                            '${addTask?.userId}',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      ),
                      Row(
                        children: [Text('Task Id:${addTask?.id}')],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        controller: addTaskCubit?.titleController,
                        decoration: const InputDecoration(
                            hintText: 'Description about task'),
                        maxLength: 100,
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter task details';
                          }
                          return null;
                        },
                      ),
                      ListTile(
                        title: const Text('Complete'),
                        leading: Radio(
                            value: true,
                            groupValue: completed,
                            //selectedOption,
                            onChanged: (value) {
                              setState(() {
                               // selectedOption = value ?? 0;
                                completed = value ?? false;
                              });
                            }),
                      ),
                      ListTile(
                        title: const Text('incomplete'),
                        leading: Radio(
                            value: false,
                            groupValue: completed,
                            //selectedOption,
                            onChanged: (value) {
                              setState(() {
                               // selectedOption = value ?? 0;
                                completed = value ?? false;
                              });
                            }),
                      )
                    ],
                  );
                } else if (state.addTaskResponseStatus ==
                    AddTaskResponseStatus.initial) {
                  return Center(
                    child: Text('Initial state'),
                  );
                } else {
                  return Center(
                    child: Text('Error'),
                  );
                }
              }),
              Positioned(
                  bottom: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addTaskCubit?.addTaskDetails(completed);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Successfully saved. '),
                            ),
                          );
                        }
                      },
                      child: Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
