import 'dart:ffi';

import 'package:ecommerce/core/init/base/base_viewmodel.dart';
import 'package:ecommerce/features/main/home/model/product_model.dart';
import 'package:ecommerce/features/main/home/services/usecase/home1_usecase.dart';
import 'package:ecommerce/features/state/state_renderer.dart';
import 'package:ecommerce/features/state/state_renderer.impl.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class HomePage1ViewModel extends BaseViewModel
    with HomePage1ViewModelInputs, HomePage1ViewModelOutputs {
  final _productController = BehaviorSubject<Products>();
  final HomeUseCase _useCase;
  HomePage1ViewModel(this._useCase);
  @override
  void init() {
    _getHome();
  }

  _getHome() async {
    // ignore: void_checks
    (await _useCase.execute(Void)).fold(
        (failure) => {
              inputState.add(ErrorState(
                  StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message))
            },
        (products) => {
          debugPrint(products.productData[0].desc),
              inputState.add(ContentState()),
              inputProduct.add(products)
            });
  }

  @override
  Sink get inputProduct => _productController.sink;

  @override
  Stream<Products> get outputProduct =>
      _productController.stream.map((products) => products);

  @override
  void dispose() {
    _productController.close();
  }
}

abstract class HomePage1ViewModelInputs {
  Sink get inputProduct;
}

abstract class HomePage1ViewModelOutputs {
  Stream<Products> get outputProduct;
}
