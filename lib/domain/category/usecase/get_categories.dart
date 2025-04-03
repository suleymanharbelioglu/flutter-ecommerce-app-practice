import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/domain/category/repository/category.dart';
import 'package:ecommerce/service_locator.dart';

class GetCategoriesUseCase extends UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
 return await  sl<CategoryRepository>().getCategories();
  }
}