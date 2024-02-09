import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<String> todos = ["Test", "Deneme", "Test2", "Deneme2"];
  //List<String> completed = ["Test5", "Deneme5", "Test3", "Deneme3"];
  List<Task> todos = [
    Task(
        title: "Study Lesson",
        description: "Study Flutter",
        isCompleted: false,
        type: TaskType.note),
    Task(
        title: "Run ",
        description: "Running 5km",
        isCompleted: false,
        type: TaskType.contest),
    Task(
        title: "Go to Party",
        description: "Partyyyy",
        isCompleted: false,
        type: TaskType.calendar),
  ];
  List<Task> completed = [
    Task(
        title: "Study Lesson",
        description: "Study Flutter",
        isCompleted: true,
        type: TaskType.note),
    Task(
        title: "Run ",
        description: "Running 5km",
        isCompleted: true,
        type: TaskType.contest),
    Task(
        title: "Go to Party",
        description: "Partyyyy",
        isCompleted: true,
        type: TaskType.calendar),
  ];
  void addNewTask(Task newTask) {
    setState(() {
      todos.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    todoService.getTodos();
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            backgroundColor: HexColor(kPrimaryColor),
            body: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  //
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(74, 55, 128, 1),
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/Header.png'),
                        fit: BoxFit.cover),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          '28 Ocak 2024 ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          'To-Do by MT',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            return TodoItem(task: todos[index]);
                          }),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tamamlananlar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: completed.length,
                        itemBuilder: (context, index) {
                          return TodoItem(
                            task: completed[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (content) => AddNewTaskScreen(
                          addNewTask: (newTask) => addNewTask(newTask),
                        ),
                      ));
                    },
                    child: Text("Yeni Görev")),
              ],
            )),
      ),
    );
  }
}
