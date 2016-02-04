API
===
туру-туту

РЕГИСТРАЦИЯ
---
Студент идентифицируется по номеру зачетки. Если указанный номер существует в бд, то пользователь успешно создастя
> 
**Параметры:** 
> - login
> - password
> - record_book_number - номер зачетки
### POST /api/v1/registration
```
{
    "login":"isamorodov",
    "password":"0123456789",
    "record_book_number" : "123123"
}
```

### Status 200 OK
```
{
  "login":"isamorodov",
  "password":"0123456789"
}
```

АВТОРИЗАЦИЯ
---
Метод для получения api токена. Важный параметр для всех последующих запросов

**Параметры:** 
> - login
> - password

### POST /api/v1/authorization
```
{
    "login":"isamorodov",
    "password":"0123456789"
}
```

### Status 200 OK
```
{
  "access_token": "pIjIY7jUee0/+JgNUgaJWDEV0Ky8EgqVJRVYxsRDCMCO7TSPXqpysW/9Sgwt5Jg5txlKMnXfKAIiDfwMALJqAQ=="
}
```