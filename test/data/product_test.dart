import 'package:homevy/models/product_model.dart';
import 'package:homevy/services/product_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'product_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Get list product', () {
    test('returns an product if the http call completes successfully',
        () async {
      final client = MockClient();
      when(client.get(
          Uri.parse('https://api1.sib3.nurulfikri.com/api/category/22'),
          headers: {
            'Authorization':
                'Bearer 623|IXH9uWlUoSG5HcWWAB1SuqzUzYW1ttPHXfWAixqI'
          })).thenAnswer((_) async => http.Response(
          "{'code': '00','info': 'Category Berhasil Diambil','data': {}}",
          200));

      expect(await ProductService(client).getProductByCategory(),
          isA<ProductModel>());
    });
  });
}
