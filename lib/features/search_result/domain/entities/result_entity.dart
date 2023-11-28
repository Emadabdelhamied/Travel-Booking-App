import 'package:equatable/equatable.dart';

class SearchResultEntity extends Equatable {
  final List<SearchDataEntity> data;

  const SearchResultEntity({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class SearchDataEntity extends Equatable {
  final String id;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String departureAirportCode;
  final String arrivalAirportCode;
  final int stopoversCount;
  final double score;

  const SearchDataEntity({
    required this.id,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.departureAirportCode,
    required this.arrivalAirportCode,
    required this.stopoversCount,
    required this.score,
  });
  @override
  List<Object?> get props => [
        id,
        departureTime,
        arrivalTime,
        duration,
        departureAirportCode,
        arrivalAirportCode,
        stopoversCount,
        score,
      ];
}
