API
===
## Общие правила
### Обработка ошибок
При 40x или 50x ошибок сервер возвращает тело

```
{
    "error":"сообщение об ошибке"
}
```
##РЕГИСТРАЦИЯ
---
Студент идентифицируется по номеру зачетки. Если указанный номер существует в бд, то пользователь успешно создастя


###**Параметры:**
 - login
 - password
 - record_book_number - номер зачетки

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
  "status":"Пользователь успешно создан"
}
```

##АВТОРИЗАЦИЯ
---
Метод для получения api токена. Важный параметр для всех последующих запросов

###**Параметры:**

 - login
 - password

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


##ПОДТВЕРЖДЕНИЕ РЕГИСТРАЦИИ
---
После создания пользователя, он не может получать доступ к апи. Для получения доступа, староста должен подтвердить реистрацию пользователя

#Методы подтверждения доступные только старостам

###ЗАПРОС НЕПОДТВЕРЖДЕННЫХ ПОЛЬЗОВАТЕЛЕЙ
  староста запрашивает пользователей только для своей группы

###**Параметры:**

 - token

### GET /api/v1/approve/users

### Status 200 OK
```
[
   {  
      "login":"isamorodov",
      "student":{  
         "first_name":"Ilia",
         "last_name":"Samorodov",
         "middle_name":"kek"
      }
   },
   {  
      "login":"test",
      "student":{  
         "first_name":"test",
         "last_name":"test",
         "middle_name":"test"
      }
   }
]
```

###ПОДТВЕРЖДЕНИЕ РЕГИСТРАЦИИ
###**Параметры:**

 - token
 - user_id

### POST /api/v1/approve
```
{
	"token":"QciP/TKTeCUOWe31XvcDC9qWSBVRRDP0lNFc4yKAB15SVXddjTkWyPodpOKmjPeXXKTTWqBzTEEONf2Q1yAg6A==",
    "user_id" : "2"
}
```

### Status 200 OK
```
{
   "status":"Регистрация пользователя подтверждена успешно"
}
```
