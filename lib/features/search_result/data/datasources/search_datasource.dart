import '../../../../core/error/exceptions.dart';
import '../../../../core/util/api_basehelper.dart';
import '../../../home/data/models/search_params.dart';
import '../models/result_model.dart';

const String getFlightsApi = "1/0/0/Economy/USD";

abstract class SearchDataSource {
  Future<SearchResultModel> getFlights({required SearchParams params});
}

class SearchDataSourceImp extends SearchDataSource {
  final ApiBaseHelper apiConsumer;

  SearchDataSourceImp({required this.apiConsumer});

  @override
  Future<SearchResultModel> getFlights({required SearchParams params}) async {
    try {
      final response = await apiConsumer.get(
        url:
            "${params.from.code}/${params.to.code}/${params.date}/$getFlightsApi",
      );

      if (response["legs"] != null) {
        return SearchResultModel.fromJson(response);
      } else {
        throw ServerException(message: response.toString());
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
