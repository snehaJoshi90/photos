import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/screens/add_task/bloc/add_task_cubit.dart';

import 'package:photos/screens/todos_list/bloc/todos_state.dart';
import 'package:photos/screens/todos_list/bloc/todos_cubit.dart';

import 'package:photos/screens/add_task/add_task_screen.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<Map<String, dynamic>> _todosList = [
    {
      "userId": '1',
      "id": '1',
      "title": "delectus aut autem",
      "completed": false
    },
    {
      "userId": '1',
      "id": '2',
      "title": "quis ut nam facilis et officia qui",
      "completed": false
    },
    {
      "userId": '1',
      "id": '3',
      "title": "fugiat veniam minus",
      "completed": false
    },
    {"userId": '1', "id": '4', "title": "et porro tempora", "completed": true},
    {
      "userId": '1',
      "id": '5',
      "title":
          "laboriosam mollitia et enim quasi adipisci quia provident illum",
      "completed": false
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TodosCubit>(context).fetchTodosList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todos '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => AddTaskCubit(),
                              child: AddTaskScreen(),
                            )));
              },
              child: const Text(
                'Add task',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: BlocBuilder<TodosCubit, TodosState>(builder: (context, state) {
          if (state.todosResponseStatus == TodosResponseStatus.loading) {
            return const Center(child: Text('loading state')
                //CircularProgressIndicator()
                );
          } else if (state.todosResponseStatus ==
              TodosResponseStatus.fetchTodosSuccess) {
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var todo = state.todosResponse![index];
                  return Card(
                      child: ListTile(
                          leading: Text(
                            '${state.todosResponse![index].id.toString()}',
                            // _todosList[index]['id'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          title: Text('${state.todosResponse![index].title}'),
                          //_todosList[index]['title']),
                          trailing: Icon(
                              color: Colors.green,
                              size: 30,
                              todo.completed == true
                                  //state.todosResponse![index].completed
                                  // _todosList[index]['completed']
                                  ? (Icons.check)
                                  : (Icons.error))));
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: state.todosResponse?.length ?? 0);
          } else if (state.todosResponseStatus == TodosResponseStatus.initial) {
            return Text('Initial State');
          } else {
            return Center(child: Text('Error${state.message}'));
          }
        }));
  }
}
