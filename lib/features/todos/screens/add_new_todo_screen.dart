import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';


class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {

  TextEditingController titleTEController=TextEditingController();
  TextEditingController descriptionTEController=TextEditingController();

  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();

  Future _sendData()async{
    final db=FirebaseFirestore.instance.
    collection('Todo').doc(DateTime.now().toString()).set({
      'title':titleTEController.text.toString(),
      'desc':descriptionTEController.text.toString(),
      'createdDate':DateTime.now().toString(),
      'status':'Pending..'

      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Add new todo',style: TextStyle(
          color: Colors.white
        ),),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleTEController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                validator: (String? value){
                  if(value?.trim().isEmpty??true){
                    return 'Enter a title';
                  }else{
                    return null;
                  }
                } ,
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: descriptionTEController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                validator: (String? value){
                  if(value?.trim().isEmpty??true){
                    return 'Enter a description';
                  }else{
                    return null;
                  }
                } ,
              ),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()==false){
                  return;
                }
                  _sendData();
                  Navigator.pop(context,);
              }, child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}