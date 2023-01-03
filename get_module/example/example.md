# Examples

```dart
void main() {
  GetModular([
    // third-party modules installed from pub
    GetSplashScreenModule(),
    YamlConfigModule(),
    SqliteModule(),
    GetEasyLoadingModule(),
    // your own project modules
    UserModule().dependsOn([SqliteModule, YamlConfigModule]), // you specific order by using .dependsOn()
    HomeModule().silenceOnError, // you can silence errors and keep code going
    ChatModule().silenceOnError,
    GalleryModule().silenceOnError,
    GetMaterialAppModule(),
  ]);
}

class UserModule extends GetModule {
  @override
  List<GetPage> get pages => [
    GetPage(
      name: '/',
      page: () => const EntryPage(),
    ),
  ];

  @override
  Map<String, Map<String, String>> get translations => {
    'en': {},
    'zh_CN': {},
  };
  
  Future<void> install() async {
    // module installation
  }
}
```