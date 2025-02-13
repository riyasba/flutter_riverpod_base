import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/feature/product/repository/product.dart';
import 'package:flutter_riverpod_base/src/models/git_repo_model.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';
import 'package:flutter_riverpod_base/src/utils/config.dart';
import 'package:flutter_riverpod_base/src/utils/snackbar_service.dart';

final productControllerProvider = Provider((ref) {
  final repo = ref.watch(productRepoProvider);
  return ProductController(repo: repo);
});

class ProductController {
  final ProductRepo _repo;
  ProductController({required ProductRepo repo}) : _repo = repo;

  Future<List<Item>?> getProducts({ BuildContext? context }) async {
    final result = await _repo.getProducts();
    print(result);
    return result.fold(
      (failure){
        print("faiked");
        if(AppConfig.devMode && context!=null){
          SnackBarService.showSnackBar(context: context, message: SnackBarMessages.productLoadFailed);
        }
        return null;
      },
      (products){
        print("---pr");
        
        return products;
      },
    );
  }
}
