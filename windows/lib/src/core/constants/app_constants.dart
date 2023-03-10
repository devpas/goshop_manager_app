class AppConstants {
  AppConstants._();

  /// shared preferences keys
  static const String keyLangSelected = 'keyLangSelected';
  static const String keyToken = 'keyToken';
  static const String keyLocaleCode = 'keyLocaleCode';
  static const String keyFirstName = 'keyFirstName';
  static const String keyLastName = 'keyLastName';
  static const String keyAppThemeMode = 'keyAppThemeMode';
  static const String keyLanguageData = 'keyLanguageData';
  static const String keyLangLtr = 'keyLangLtr';
  static const String keyGlobalSettings = 'keyGlobalSettings';
  static const String keyTranslations = 'keyTranslations';
  static const String keySelectedCurrency = 'keySelectedCurrency';
  static const String keyLoginData = 'keyUserData';

  /// hero tags
  static const String heroTagSelectUser = 'heroTagSelectUser';
  static const String heroTagSelectAddress = 'heroTagSelectAddress';
  static const String heroTagSelectCurrency = 'heroTagSelectCurrency';

  /// app strings
  static const String emptyString = '';

  /// api urls
  static const String baseUrl = 'https://api.goshops.org';
  static const String imageBaseUrl = 'https://api.goshops.org/storage/images';

  /// locales
  static const String localeCodeEn = 'en';

  /// app based constants
  static const String appName = 'GMarket';
}

enum ShopStatus { newShop, edited, approved, rejected }

enum UploadType {
  extras,
  brands,
  categories,
  shopsLogo,
  shopsBack,
  products,
  users,
}

enum ExtrasType { color, text, image }

enum OrderStatus { newOrder, accepted, ready, onAWay, delivered, canceled }

enum UserRole { admin, seller, deliveryman, manager, user }

enum OpenEditUserFrom { dashboard, deliveryBoys, users }

enum OpenEditProductFrom { dashboard, products }
