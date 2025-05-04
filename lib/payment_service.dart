// payment_service.dart

class PaymentService {
  // This simulates a fake payment process
  static Future<bool> createPaymentMethod({
    required String cardNumber,
    required int expMonth,
    required int expYear,
    required String cvc,
  }) async {
    // Simulate some network delay
    await Future.delayed(const Duration(seconds: 2));

    // Always return success, no matter what input
    print('✅ Mock Payment Success');
    return true;
  }
}
