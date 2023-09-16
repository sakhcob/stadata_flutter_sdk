// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/news_category/domain/entities/news_category.dart';
import 'package:stadata_flutter_sdk/src/features/news_category/domain/respositories/news_category_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton()
class GetAllNewsCategory
    implements
        UseCase<ApiResponse<List<NewsCategory>>, GetAllNewsCategoryParam,
            NewsCategoryRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<NewsCategory>>>> call(
    GetAllNewsCategoryParam param,
  ) =>
      repo.get(
        lang: param.lang,
        domain: param.domain,
      );

  @override
  NewsCategoryRepository get repo => getIt<NewsCategoryRepository>();
}

class GetAllNewsCategoryParam extends Equatable {
  const GetAllNewsCategoryParam({
    required this.domain,
    this.lang = DataLanguage.id,
  });
  final String domain;
  final DataLanguage lang;
  @override
  List<Object> get props => [domain, lang];
}
