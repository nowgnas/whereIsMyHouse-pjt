# 요구사항

## 기본

| 구현 기능           | 비고                                                        |
|-----------------|-----------------------------------------------------------|
| 메인 페이지          |                                                           |
| 회원 관리 페이지       | 회원 정보 등록 <br>회원정보 수정<br>회원정보 삭제<br>회원정보 검색                |
| 로그인 / 로그아웃 페이지  |                                                           |
| 실거래가 검색, 결과 페이지 | 전체 검색 화면 - 10<br>상세 검색 - 10<br>동별 화면 - 5<br>아파트별 검색 화면 -5 |

## 추가

- 비밀번호 찾기, 사이트맵, 메뉴 구성 화면
- 관심 지역 동네 업종 정보
- 관심 지역 대기 오염 정보
- 웹사이트 소개, 공지사항 관리 화면

---

# Where Is My Home

### Member

|이름 |
|--|
|이상원|
|정원철 |

## AOP를 사용해 예외처리 관리하기

AOP는 관점지향 프로그래밍으로 로직을 기준으로 핵심 관점과 부과적인 관점으로 나눠서 보고 그 관점을 기준으로 각각을 모듈화 하는 것이다.

핵심 기능은 비즈니스 로직을 구현하는 과정에서 비즈니스 로직이 처리하려는 목적 기능을 말한다. 클라이언트로부터 상품 정보 등록 요청을 받아 DB에 저장하고, 상품 정보를 조회하는 비즈니스 로직을 구현할 경우, 정보를
저장하는 것과 정보 데이터를 보여주는 부분이 핵심이다.

클래스들은 Aspect를 재활용하여 사용할 수 있다. Service 비즈니스 로직에서 트랜잭션이라는 부가 기능 관심사를 분리할 수 있다.

```java

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(NullPointerException.class)
    public ResponseEntity<ErrorResponse> NullPointerException(NullPointerException n) {
        n.printStackTrace();
        ErrorResponse response = new ErrorResponse(404, n.getMessage());
        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(SQLSyntaxErrorException.class)
    public ResponseEntity<ErrorResponse> SqlSyntaxErrorException(SQLSyntaxErrorException s) {
        System.out.println("sql syntax error");
        ErrorResponse response = new ErrorResponse(404, s.getMessage());
        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(BadSqlGrammarException.class)
    public ResponseEntity<ErrorResponse> BadSqlGrammarException(BadSqlGrammarException b) {
        b.printStackTrace();
        ErrorResponse response = new ErrorResponse(404, b.getMessage());
        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(Exception.class)
    public String Exception(Exception e) {
        System.out.println("Exception");
        return "sql grammar error";
    }

    @ExceptionHandler(RuntimeException.class)
    public String RuntimeException(RuntimeException r) {
        System.out.println("run time exception");
        return "run time exception";
    }

    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<ErrorResponse> NotFoundException(NotFoundException n) {
        ErrorResponse response = new ErrorResponse(404, n.getMessage());
        return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
    }

}
```

`GlobalExceptionHandler.java`이다. 발생할 수 있는 예외들을 정의해 놓은 파일이다. ControllerAdvice 어노테이션으로 모든 controller에 대한 예외를 처리해 준다. 각
메서드에는 ExceptionHandler 어노테이션이 붙어 있다. ExceptionHandler는 어떤 예외 클래스에 대한 처리를 할지 정의해 주는 것이다. ExceptionHandler로 예외 클래스를 지정해 주기
때문에 각 메서드들의 이름은 큰 의미가 없다. 웹 서비스에서 일부러 예외를 발생시켜 확인해 보자.

```java
// ErrorResponse.java

@Getter
public class ErrorResponse {
    private String message;
    private int status;

    public ErrorResponse(int i, String message) {
        this.status = i;
        this.message = message;
    }
}
```

위 코드는 `GlobalExceptionHandler.java`에서 사용하는 `ErrorResponse` 객체이다.

## BadSqlGrammarException

```xml

<select id="login" resultType="Member" parameterType="map">
    select *
    from member_
    where id = #{id}
    and pw = #{pw};
</select>
```

위 코드는 mybatis(mybatis 설명은 생략한다)로 정의한 사용자 로그인 쿼리이다. `from member`가 올바른 쿼리이며, `member_`로 쿼리에서 오류를 발생시켜보았다. 로그인 요청을 하게되면
BadSqlGrammarException이 발생하게 된다.

![스크린샷 2022-10-26 오후 8.46.10.png](/readme-image/pic1.png)

```java
@ExceptionHandler(BadSqlGrammarException.class)
public ResponseEntity<ErrorResponse> BadSqlGrammarException(BadSqlGrammarException b){
        System.out.println("bad grammar");
        ErrorResponse response=new ErrorResponse(404,b.getMessage());
        return new ResponseEntity<>(response,HttpStatus.BAD_REQUEST);
        }
```

ExceptionHandler에 예외 클래스를 정의해 준다. ErrorResponse 객체로 오류 발생 시 반환할 객체를 생성하고 ResponseEntity로 반환해 준다.
![](/readme-image/pic2.png)

postman으로 로그인 요청을 보낸 후 받은 응답 body이다. 요청에 대한 응답은 ErrorResponse 객체를 받은 것을 확인할 수 있다. errors와 code는 정의하지 않아 null로 반환되었다. 코드
위쪽의 이미지에서 BadSqlGrammarException이 콘솔에 찍혀 있는것을 확인할 수 있다.

## NullPointerException

다시 사용자 로그인을 사용해 NullPointerException을 발생시켜 본다. 위에서 로그인 쿼리는 다시 되돌려 놓는다. 이번에는 데이터베이스에 존재하지 않는 정보로 로그인을 시도한다.

![](/readme-image/pic3.png)

id가 p이고 pw가 1234인 사용자는 데이터에 존재하지 않는다. 이 데이터를 가지고 로그인 요청을 하게되면 NullPointerException이 발생한다.

![](/readme-image/pic4.png)

```java
@ExceptionHandler(NullPointerException.class)
public ResponseEntity<ErrorResponse> NullPointerException(NullPointerException n){
        n.printStackTrace();
        ErrorResponse response=new ErrorResponse(404,n.getMessage());
        return new ResponseEntity<>(response,HttpStatus.BAD_REQUEST);
        }
```

ExceptionHandler에 NullPointerException으로 예외 클래스를 정의해 준다. 데이터베이스에 존재하지 않는 사용자이므로 NullPointerException가 발생하는 것을 볼 수 있다.
ErrorResponse로 응답 객체를 만들고 ResponseEntity로 json 형태로 반환하게 되면 다음과 같은 응답을 얻을 수 있다.

![](/readme-image/pic5.png)

에러의 메세지와 지정해준 상태 코드가 담겨 응답으로 반환된다. errors와 code 데이터는 추가하지 않아 null을 반환하게 된다.

## Interceptor를 사용한 login required 구현

웹 서비스의 사용자가 로그인이 되어 있는지 확인하기 위한 interceptor를 구현해 본다. client에서 요청된 url로 넘어가는 과정에서 조건을 충족하는지 확인하는 미들웨어 역할을 한다.

### Interceptor 정의하기

```java

// WebConfig.java
@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {
    private final MemberInterceptor memberInterceptor;

    private static final List<String> interceptorUrlPatterns = Arrays.asList("/user/*", "/board/*");
    private static final List<String> excludeInterceptorUrlPatterns = Arrays.asList("/user/login", "/user/register", "/board", "house");

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(memberInterceptor)
                .addPathPatterns(interceptorUrlPatterns)
                .excludePathPatterns("/user/login", "/user/register");
    }
}

```

`WebMvcConfigurer`를 implements하여 addInterceptors를 override한다. Interceptor를 적용할 url 패턴과 제외할 패턴을 지정할 수 있다.

```java

@Component
public class MemberInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 컨트롤러 메서드에 매핑된 uri가 호출 되면 실행 되는 메서드 controller 진입 직전 수행
        HttpSession session = request.getSession(false);
        if (session != null) {
            Member member = (Member) session.getAttribute("member");
            if (member.getName() == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                System.out.println("member null");
                return false;
            }
            request.setAttribute("member", member);
            return true;
        }
        response.sendRedirect(request.getContextPath() + "/login");
        return false;
    }
}
```

`MemberInterceptor`클래스에 HandlerInterceptor를 implements한다. 3가지의 메서드를 override할 수 있으며, controller의 메서드에 도달하기 전에
동작하는 `preHandler`를 사용한다.
session이 존재하면 session에서 로그인 시 저장된 member 객체를 얻어온다. member 객체가 존재하는 경우 request의 속성에 member를 추가해 준다. Controller에서는
HttpServletRequest에서 member 속성을 받아 현재 로그인된 사용자의 정보를 사용할 수 있다.
session이 존재하지 않거나 member 객체가 존재하지 않은 경우 로그인을 하도록 한다.

# WebCam

![webcam](https://user-images.githubusercontent.com/55802893/199490364-1ae102a2-4123-4929-be1f-f4fe33ee86ea.png)

- header 부분에 `#Selfie`를 클릭하게 되면 위와 같은 웹캡을 사용할 수 있는 모달창이 뜬다.

# 아파트 실거래가 조회

![](https://user-images.githubusercontent.com/55802893/199491055-b6898682-99cb-46b9-b4e1-41f4d543a991.png)

- 시, 군구, 동, 년도, 월을 선택한 후 `매매정보가져오기`를 클릭하게 되면 아파트 실거래 정보를 얻을 수 있다.
- 아파트 이름을 클릭하게 되면 해당 아파트의 좌표로 지도가 이동한다.

# 게시판

## 게시판 목록 조회

![](https://user-images.githubusercontent.com/55802893/199528095-162180ac-76ab-4b7b-8bdd-c5c9ec1549e1.png)

- 사용자들이 작성한 게시판이다. 글을 조회할 때마다 글 번호인 index가 갱신되며 제목, 작성자, 작성 날짜가 보인다.

## 게시글 작성하기

![](https://user-images.githubusercontent.com/55802893/199530508-c8eb62d1-ab49-4182-a4f1-d33bfb980e3f.png)
![스크린샷 2022-11-03 오전 12 29 57](https://user-images.githubusercontent.com/55802893/199531521-46fb6130-945e-47c0-a8bc-e007eb48ef47.png)

- 게시글의 제목과 내용, 파일을 선택하고 제출을 누르면 게시글이 작성되고 파일은 `resources/static/files`에 저장된다.

## 게시판 상세 보기

![](https://user-images.githubusercontent.com/55802893/199528882-043a1e37-9c02-4f4c-87e0-858e69632633.png)

```java
@GetMapping("detail/{code}")
public String detail(@PathVariable String code,HttpServletRequest req){
        BoardDto boardDto=boardService.select(code);
        req.setAttribute("detail",boardDto);
        return"board/detail";
        }
```

- 게시판 상세보기 페이지이다. 목록에서는 GET요청으로 글의 id를 query string으로 담아 요청한다.
- @PathVariable 어노테이션으로 query string 값을 받아 올 수 있다.
- 상세보기 페이지에서 내용을 수정한 뒤 `제출`을 누르게 되면 게시글의 정보가 수정된다.
