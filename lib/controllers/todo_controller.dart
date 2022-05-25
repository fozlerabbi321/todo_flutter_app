import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/style_data.dart';
import '../models/response/rp_todo_model.dart';
import '../services/repository/todo_repo.dart';

class TodoController extends GetxController {
  final TodoRepo todoRepo;

  TodoController({
    required this.todoRepo,
  });

  //Init
  final List<RpTodoModel> _todoList = [];
  final List<RpTodoModel> _todoSearchList = [];
  RpTodoModel? _selectedTodoModel;
  bool _isLoading = false;
  bool _isListLoading = true;
  int _todoSelectedPosition = 0;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  //Encapsulation
  List<RpTodoModel> get todoList => _todoList;

  List<RpTodoModel> get todoSearchList => _todoSearchList;

  RpTodoModel? get selectedTodoModel => _selectedTodoModel;

  bool get isLoading => _isLoading;

  bool get isListLoading => _isListLoading;

  int get todoSelectedPosition => _todoSelectedPosition;

  TextEditingController get titleController => _titleController;

  TextEditingController get descriptionController => _descriptionController;

  //Todo_data add
  void addToTodo(
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
    String search = '',
    bool isSearch = false,
  }) async {
    try {
      _isListLoading = true;
      var product = await todoRepo.getAllTodoList(search: search);
      if (isSearch) {
        _todoSearchList.assignAll(product);
      } else {
        _todoList.assignAll(product);
      }
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
    String description, {
    bool isMobile = true,
  }) async {
    try {
      _isLoading = true;
      await todoRepo.updateTodo(
        id,
        title,
        description,
      );
      getAllTodoList();
      if(isMobile){
        Get.back();
      }
      showCustomSnackBar('Update from todo Successfully!', isError: false);
    } finally {
      _isLoading = false;
      update();
    }
  }

  //todo_remove from item
  Future<void> removeFromTodo(
    int id, {
    bool isSearch = false,
    String search = '',
  }) async {
    try {
      _isLoading = true;
      await todoRepo.deleteTodo(id);
      showCustomSnackBar(
        'Delete from todo Successfully!',
      );
      getAllTodoList(isSearch: isSearch, search: search);
    } finally {
      _isLoading = false;
      update();
    }
  }

  // update todo_status
  void updateTodoStatus(
    int id,
    int status, {
    bool isSearch = false,
    String search = '',
  }) async {
    try {
      _isLoading = true;
      await todoRepo.updateTodoStatus(
        id,
        status,
      );
      getAllTodoList(isSearch: isSearch, search: search);
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
      _selectedTodoModel = todoModel;
      update();
    } finally {
      _isLoading = false;
      update();
    }
  }

  //todo_remove from item
  Future<void> updateSelectedPosition(int position) async {
    try {
      _isLoading = true;
      _todoSelectedPosition = position;
      update();
    } finally {
      _isLoading = false;
      update();
    }
  }
}
