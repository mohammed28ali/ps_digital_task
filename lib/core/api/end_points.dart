class EndPoints {
  /// base url
  static const String baseUrl = 'https://renewal.innov8egypt.com/api/v1/';

  /// end points
  // auth
  static const String loginGoogle = 'login_google';
  static const String logout = 'logout';
  static const String checkToken = 'check-token';
  // invoices
  static const String remainingAmountByCurrency =
      "invoice/remaining-amount-by-currency";
  static const String invoicesList = "invoice/list";
  static const String showInvoiceDetails = "invoice/show/";
  static const String createInvoiceAttachment = "invoice/attachment/create/";
  static const String deleteInvoiceAttachment = "invoice/attachment/delete/";
  static const String makeInvoiceSeen = "invoice/make-seen/";
  static const String makeInvoiceCall = "invoice/make-call/";
  static const String createInvoicePayment = "invoice/payment/create/";
  static const String cancelInvoicePayment = "invoice/payment/cancel/";
  static const String createInvoiceReminder = "invoice/reminder/create/";
  static const String updateInvoiceReminder = "invoice/reminder/update/";
  static const String deleteInvoiceReminder = "invoice/reminder/delete/";
  static const String generateInvoice = "invoice/generate-invoice";
  // payment methods
  static const String paymentMethodsList = "payment-method/list";
  static const String createPaymentMethod = "payment-method/create";
  static const String updatePaymentMethod = "payment-method/update/";
  static const String deletePaymentMethod = "payment-method/delete/";
  // contracts
  static const String contractList = "contract/list";
  static const String showContractDetails = "contract/show/";
  static const String createContract = "contract/create";
  static const String updateContract = "contract/update/";
  static const String deleteContract = "contract/delete/";
  static const String createContractAttachment = "contract/attachment/create/";
  static const String deleteContractAttachment = "contract/attachment/delete/";
  //contract types
  static const String contractTypesList = "contract-type/list";
  static const String createContractType = "contract-type/create";
  static const String updateContractType = "contract-type/update/";
  static const String deleteContractType = "contract-type/delete/";
  //clients
  static const String clientsList = "client/list";
  static const String createClient = "client/create";
  static const String updateClient = "client/update/";
  static const String deleteClient = "client/delete/";
  //companies
  static const String companiesList = "user/companies";
  static const String primaryCompany = "user/companies/primary";
}
