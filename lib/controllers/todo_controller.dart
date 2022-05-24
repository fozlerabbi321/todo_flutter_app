import 'dart:developer';
import 'package:get/get.dart';
import 'package:todo_flutter_app/models/response/rp_todo_model.dart';
import 'package:todo_flutter_app/services/repository/cart_repo.dart';

import '../constants/style_data.dart';

class TodoController extends GetxController {
  final TodoRepo todoRepo;

  TodoController({required this.todoRepo,});

  //Init
  final List<RpTodoModel> _todoList = [];
  bool _isLoading = false;
  bool _isListLoading = true;

  //Encapsulation
  List<RpTodoModel> get todoList => _todoList;
  bool get isLoading => _isLoading;
  bool get isListLoading => _isListLoading;


  //Todo_data add
  void addToCart(RpTodoModel rpTodoModel, ) async {
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

  ///Get all todo_list
  void getAllTodoList() async {
    try {
      _isListLoading = true;
      var product = await todoRepo.getAllTodoList();
      _todoList.assignAll(product);
      _isListLoading = false;
      update();
    } finally {
      _isLoading = false;
      update();
    }
  }
  
}
