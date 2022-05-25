import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/models/response/rp_todo_model.dart';
import 'package:todo_flutter_app/services/repository/cart_repo.dart';

import '../constants/style_data.dart';

class TodoController extends GetxController {
  final TodoRepo todoRepo;

  TodoController({
    required this.todoRepo,
  });

  //Init
  final List<RpTodoModel> _todoList = [];
  bool _isLoading = false;
  bool _isListLoading = true;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  //Encapsulation
  List<RpTodoModel> get todoList => _todoList;

  bool get isLoading => _isLoading;

  bool get isListLoading => _isListLoading;

  TextEditingController get titleController => _titleController;

  TextEditingController get descriptionController => _descriptionController;

  //Todo_data add
  void addToCart(
    RpTodoModel rpTodoModel,
  ) async {
    //value not exists
    log('todo value not exists ${rpTodoModel.id ?? 0}');

    //added new todo_item
    todoRepo.insertTodo(rpTodoModel);
    var result = await todoRepo.getAllTodoList();
    if (result.isNotEmpty) {
      _todoList.assignAll(result);
      getAllTodoList();
    }
    showCustomSnackBar('Added to todo Successfully!', isError: false);
  }

  //Get all todo_list
  void getAllTodoList({
    bool reload = false,
  }) async {
    try {
      if (reload) {
        _isListLoading = true;
        update();
      }

      var product = await todoRepo.getAllTodoList();
      _todoList.assignAll(product);
      _isListLoading = false;
      update();
    } finally {
      _isListLoading = false;
      update();
    }
  }

// update todo_data
  void updateTodo(
    int id,
    String title,
    String description,
  ) async {
    try {
      _isLoading = true;
      await todoRepo.updateTodo(
        id,
        title,
        description,
      );
      getAllTodoList();
      Get.back();
      showCustomSnackBar('Update from todo Successfully!', isError: false);
    } finally {
      _isLoading = false;
      update();
    }
  }

  //todo_remove from item
  Future<void> removeFromTodo(int id) async {
    try {
      _isLoading = true;
      await todoRepo.deleteTodo(id);
      showCustomSnackBar(
        'Delete from cart Successfully!',
      );
      getAllTodoList();
    } finally {
      _isLoading = false;
      update();
    }
  }

  // update todo_status
  void updateTodoStatus(
    int id,
    int status,
  ) async {
    try {
      _isLoading = true;
      await todoRepo.updateTodoStatus(
        id,
        status,
      );
      getAllTodoList();
      Get.back();
      showCustomSnackBar('Change status Successfully!', isError: false);
    } finally {
      _isLoading = false;
      update();
    }
  }

  void setTextFiledTodoData(RpTodoModel todoModel) async {
    try {
      _isLoading = true;
      _titleController.text = todoModel.title ?? '';
      _descriptionController.text = todoModel.description ?? '';
      update();
    } finally {
      _isLoading = false;
      update();
    }
  }
}
