import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/todos/widgets/reuse_card.dart';

import 'add_new_todo_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('ToDo List',
        style: TextStyle(
          color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Todo').snapshots(),
          builder: ( context,  snapshot) {  
            if(snapshot.hasData){
              return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,index){
              final todo=snapshot.data!.docs[index];
              return buildCard(
                title: todo['title'], 
                desc: todo['desc'], 
                createdDate: todo['createdDate'], 
                status: todo['status'],
                onDelete: ()async{
                   await FirebaseFirestore.instance
                   .collection('Todo')
                   .doc(todo.id)
                   .delete();
                });
            });
            }else{
              return Center(
                child: Text('Loading'),
              );
            }
            
          },
        ),
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            Navigator.push(context, 
            MaterialPageRoute(builder: (c)=>AddNewTodoScreen()));
          },
          child: Icon(Icons.add),),
    );
  }
}

