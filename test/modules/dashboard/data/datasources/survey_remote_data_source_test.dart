// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get_connect.dart';
// import 'package:mockito/mockito.dart';
// import 'package:saffron_clarity/src/core/services/network_connect.dart';
// import 'package:saffron_clarity/src/modules/dashboard/data/datasources/survey_remote_data_source.dart';
// import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';

// class MockNetworkConnect extends Mock implements NetworkConnect {}

// class MockGetConnectClient extends Mock implements GetConnect {}

// void main() {
//   late SurveyRemoteDataSourceImpl dataSource;
//   late MockNetworkConnect mockNetworkConnect;

//   setUp(() {
//     mockNetworkConnect = MockNetworkConnect();
//     dataSource = SurveyRemoteDataSourceImpl(client: mockNetworkConnect);
//   });
//   final surveyId = "6";

//   group('getSingleSurvey', () {
//     test(
//       'should preform a GET request on a URL and with application/json header',
//       () {
//         //arrange
//         when(mockNetworkConnect.getCall("any", headers: anyNamed('headers')))
//             .thenAnswer(
//           (_) async => SurveyModel()),
//         );
//         // act
//         dataSource.fetchSingleSurvey(surveyId);
//         // assert
//         verify(mockNetworkConnect.getCall(
//           'http://numbersapi.com/',
//         ));
//       },
//     );
//   });
// }
