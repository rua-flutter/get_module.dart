# Get Module

**Get Module** helps developers split the project by dividing it into multiple independent, pluggable, easy-to-manage modules.

And it makes many community packages easier to install and manage.


[![pub package](https://img.shields.io/pub/v/get_module?style=flat)](https://github.com/rua-flutter/get_module.dart/tree/main/get_module) ![license](https://img.shields.io/github/license/rua-flutter/get_module.dart?style=flat)  [![stars](https://img.shields.io/github/stars/rua-flutter/get_module.dart?style=social)](https://github.com/rua-flutter/get_module.dart)

## Goal

- Pluggable
- Independent
- Easy to install and manage



## Quick Start

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



