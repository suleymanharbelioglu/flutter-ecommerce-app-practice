import 'package:ecommerce/common/bloc/product/product_display_state.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDisplayCubit extends Cubit<ProductDisplayState> {
  final UseCase useCase;

  ProductDisplayCubit({required this.useCase}) : super(ProductIntitialState());
  Future<void> displayProducts({dynamic params}) async {
    emit(ProductLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(LoadProductFailure());
      },
      (data) {
        emit(ProductLoaded(products: data));
      },
    );
  }

  void displayInitial() {
    emit(ProductIntitialState());
  }
}
