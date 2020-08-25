# 매치 메이킹

매치 메이킹은 소프트웨어 공학 실무에서 진행하는 프로젝트입니다.  
나에게 딱 맞는 리그오브레전드 듀오를 찾아줍니다. 친구도 사귀고! 티어도 올리고!

<br>

### 팀원

세계 최고의 팀워크를 자랑합니다.  
[김도훈](https://github.com/kimdohun0104): Flutter mobile developer, designer  
[이제성](https://github.com/jepangLee): Back-end developer, PM  
[정재훈](https://github.com/littlemenu): Back-end developer  
[최승민](https://github.com/choi-seung-min): Flutter mobile developer  

<br>

### 주요 기능

1. 매치: 실시간으로 듀오 메이트와 매칭됩니다.
2. 메이킹: 하루에 5명씩 나에게 적합한 듀오 메이트를 추천받습니다.
3. 채팅: 매칭 또는 메이킹으로 만난 메이트와 채팅할 수 있습니다.

<br>

### 아키텍처 다이어그램

![](https://user-images.githubusercontent.com/36754680/91151983-55dccb80-e6f9-11ea-8015-a89d7f9be022.jpg)

#### Presentation Layer(표현 계층)

Presentation Layer는 UI 구성 및 업데이트 로직이 위치한 계층입니다.  

UI는 ChangeNotifier를 구현하는 모델 객체를 관찰합니다. 모델의 상태가 변경되었을 때 notifyListeners()를 호출함으로써 UI를 업데이트합니다.  

모델은 서비스 인터페이스에 대한 참조를 가지고 있습니다. UI의 요청에 따라 적절한 서비스에 접근하여 상태를 업데이트합니다. 모델은 Provider 패턴을 사용하여 접근 가능 범위를 한정합니다. 

#### Data Layer(데이터 계층)

매치-메이킹은 캐싱, 매핑과 같은 복잡한 데이터 가공을 요구하지 않습니다. 그렇기 때문에 저흐는 계층 구조가 깊어지는 것을 최대한 피하고자 노력했습니다.  

Service들은 Infrastructure에 직접 접근하는 클래스입니다. 모델 테스트가 가능하도록 Interface를 Presentation 계층에 노출하고 구현체에 직접 접근하지 못하도록 설계했습니다. 

#### Infrastructure

 API Server: 매치-메이킹 API와 정보를 저장하는 데이터베이스

Firebase: 매치 메이킹은 파이어베이스 인프라를 적극사용합니다.

1.  Authentication - 빠른 개발을 위해서 모든 인증 시스템을 파이어베이스 인프라로 통합했습니다.
2. Firebase remote config - 외부로 노출할 수 없는 중요한 정보(api key 등)를 안전하게 저장하고 쉽게 접근할 수 있도록 사용합니다.
3. Crashlytics, Analytics - 앞으로의 서비스 발전을 위해 적용될 예정입니다. 

<br>

### 에러 처리

다양한 에러에 대한 사용자 경험을 적절하게  제공하기 위해서 에러 처리에 대한 고민을 많이 했습니다. 

#### Exception 일반화

API Server와 Firebase에서 사용하는 Exception은 다소 차이가 있습니다. 이로 인해서 발생하는 문제점은 큽니다.  

모델에서 에러 처리를 하기 위해서 먼저 어떤 인프라가 제공하는 Exception인지 고려해야합니다. 그 후엔 Exception의 code를 비교하여 정확한 에러 원인을 파악하고 처리합니다. 이런 로직을 모델에 넣는다면, 모델이 비대해질 가능성이 높습니다. 게다가 표현 계층에서 이런 처리를 하는 것이 부자연스럽습니다.  

그래서 선택한 방법은 일반화된 Exception을 정의하는 것입니다. Http Status를 기준으로 커스텀 Exception을 정의했습니다.

![](https://user-images.githubusercontent.com/36754680/91159256-c63c1a80-e702-11ea-8049-3e087baeb06f.png)

 그리고 기존 에러를 커스텀 Exception으로 변환하여 다시 예외를 발생시키는 Handler를 구현했습니다. 

```  dart
class FirebaseErrorHandler {
  static void throwProperException(Exception e) {
    if (e is PlatformException) {
      switch (e.code) {
        case 'ERROR_EMAIL_ALREADY_IN_USE': throw ConflictException();
        case 'ERROR_USER_NOT_FOUND': throw NotFoundException();
        case 'ERROR_WRONG_PASSWORD': throw UnauthorizedException();
      }
    }
    throw InternalException();
  }
}

class NetworkErrorHandler {
  static void throwProperException(Response response) {
    switch (response.statusCode) {
      case HttpStatus.notFound:  throw NotFoundException(message: jsonDecode(response.body)['message']);
      case HttpStatus.unauthorized: throw UnauthorizedException();
    }
  }
}
```

#### 예외에 적절한 사용자 경험 제공

예외에 대응하는 방법은 크게 화면 이동과 메세지가 대표적입니다. 이런 특징을 이용하여 테스트가 가능하면서도 간단한 예외 처리를 구현했습니다.

코드를 통해서 확인해봅시다.

``` dart
Future signUp(String email, String password, String reType) async {
    if (!isEmail(email)) {
      return Future.error(Message('이메일이 유효하지 않습니다'));
    }

    if (password != reType) {
      return Future.error(Message('비밀번호 재입력이 일치하지 않습니다'));
    }

    if (password.length < 6) {
      return Future.error(Message('비밀번호가 안전하지 않습니다'));
    }

    try {
      await _firebaseAuthService.signUp(email, password);
    } on ConflictException {
      return Future.error(Message('이미 존재하는 이메일입니다'));
    } on InternalException {
      return Future.error(Message('서버에 문제가 발생했습니다'));
    }
  }

context
        .read<SignUpModel>()
        .signUp(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _reTypeController.text.trim(),
        )
        .then((value) => Navigator.pop(context))
        .catchError((err) => context.showSnackbar((err as Message).message))
        .whenComplete(() => progressDialog.hide());
```

<br>

### 패키지 의존성

* UI-related

  - [cupertino_icons](https://pub.dev/packages/cupertino_icons)

  - [progress_dialog](https://pub.dev/packages/progress_dialog)
  - [fluttertoast](https://pub.dev/packages/fluttertoast)

* Auth

  * [firebase_auth](https://pub.dev/packages/firebase_auth)
  * [flutter_facebook_login](https://pub.dev/packages/flutter_facebook_login)
  * [flutter_twitter_login](https://pub.dev/packages/flutter_twitter_login)
  * [google_sign_in](https://pub.dev/packages/google_sign_in)

* State management

  * [provider](https://pub.dev/packages/provider)

* Data

  * [http](https://pub.dev/packages/http)
  * [http_interceptor](https://pub.dev/packages/http_interceptor)
  * [json_annotation](https://pub.dev/packages/json_annotation)
  * [json_serializable](https://pub.dev/packages/json_serializable)
  * [shared_preferences](https://pub.dev/packages/shared_preferences)

* Test

  * [Mockito](https://pub.dev/packages/mockito)

* Util
  * [validators](https://pub.dev/packages/validators)
  * [firebase_remote_config](https://pub.dev/packages/firebase_remote_config)
  * [intl](https://pub.dev/packages/intl)
  * [build_runner](https://pub.dev/packages/build_runner)
