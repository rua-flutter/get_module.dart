# Get Module

**Get Module** helps developers split the project by dividing it into multiple independent, pluggable, easy-to-manage modules.

And it makes many community packages easier to install and manage.


[![pub package](https://img.shields.io/pub/v/get_module?style=flat)](https://github.com/rua-flutter/get_modular.dart/tree/main/get_modular) ![license](https://img.shields.io/github/license/rua-flutter/get_modular.dart?style=flat)  [![stars](https://img.shields.io/github/stars/rua-flutter/get_modular.dart?style=social)](https://github.com/rua-flutter/get_modular.dart)

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
    runAppModule(const App()).finalModule
  ]);
}

class App extends StatelessWidget {
  // your entry widget
}

class UserModule extends Module {
  Future<void> install async {
    // module installation
  }
}
```



