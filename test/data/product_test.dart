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
    final client = MockClient();
    test('returns an product if the http call completes successfully',
        () async {
      when(client.get(
          Uri.parse('https://api1.sib3.nurulfikri.com/api/category/22'),
          headers: {
            'Authorization':
                'Bearer 623|IXH9uWlUoSG5HcWWAB1SuqzUzYW1ttPHXfWAixqI'
          })).thenAnswer((_) async => Future.value(http.Response(
          '''{"code":"00","info":"Category Berhasil Diambil","data":{"id":22,"name":"furniture","created_at":"2022-11-15T06:37:05.000000Z","updated_at":"2022-11-15T06:37:05.000000Z","deleted_at":null,"products":[{"id":11,"name":"Kursi","category_id":22,"image":"http://api1.sib3.nurulfikri.com/storage/product//fpse41G6ZLZAHNtOPXlobMHURzJykoZaDZVfigSQ.jpg","image_path":"public/product//fpse41G6ZLZAHNtOPXlobMHURzJykoZaDZVfigSQ.jpg","harga":4000000,"deskripsi":"Kursi kerja","stock":100,"created_at":"2022-11-15 06:11:17","updated_at":"2022-11-15 06:11:17","deleted_at":null},{"id":12,"name":"Meja Kerja","category_id":22,"image":"http://api1.sib3.nurulfikri.com/storage/product//mFop2jOsGXahYHRN48uL4FYPygjIAgljiW0VvNvO.jpg","image_path":"public/product//mFop2jOsGXahYHRN48uL4FYPygjIAgljiW0VvNvO.jpg","harga":1500000,"deskripsi":"Meja nyaman untuk kerja","stock":70,"created_at":"2022-11-15 08:11:21","updated_at":"2022-11-15 08:11:21","deleted_at":null}]}}''',
          200)));

      expect(
          await ProductService().getProductByCategory(
              '623|IXH9uWlUoSG5HcWWAB1SuqzUzYW1ttPHXfWAixqI', client),
          isA<ProductModel>());
    });
  });
}
