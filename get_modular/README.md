# Get Modular

**Get Modular** help developers split the project by dividing it into multiple independent, pluggable, easy-to-manage modules.

And make many community packages easier to install and manage.



## Goal

- Pluggable
- Independent
- Easy to install



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



