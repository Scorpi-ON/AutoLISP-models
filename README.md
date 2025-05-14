# AutoLISP-models

Набор курсовых работ по архитектуре и проектированию графических систем, представляющих собой программы на AutoLISP для
построения различных твердотельных 3D-моделей в AutoCAD

<details>
  <summary><h2>Скриншоты</h2></summary>
  <p><a href="./models/holder.lsp">Подставка для телефона</a></p>
  <img src="https://github.com/user-attachments/assets/a5b66648-2894-4bd3-95c4-a8ac220f3e7b" width=70%>
  <br>
  <br>
  <p><a href="./models/organizer.lsp">Канцелярский органайзер</a></p>
  <img src="https://github.com/user-attachments/assets/e8a06721-64b0-4a9e-99a6-dbe22a5a988d" width=70%>
  <br>
  <br>
  <p><a href="./models/extender.lsp">Удлинитель</a></p>
  <img src="https://github.com/user-attachments/assets/eb5b976c-de2e-414d-9cde-4782961f7f4d" width=70%>
  <br>
  <br>
  <p><a href="./models/lamp.lsp">Настольная лампа</a></p>
  <img src="https://github.com/user-attachments/assets/efef61ce-982e-4efe-b506-47ef1a2cb51f" width=70%>
  <br>
  <br>
  <p><a href="./models/budilnik.lsp">Будильник</a></p>
  <img src="https://github.com/user-attachments/assets/40729233-ffe4-4ea2-b9c8-dc686d952f6a" width=70%>
  <br>
  <br>
  <p><a href="./models/router.lsp">Wi-Fi роутер</a></p>
  <img src="https://github.com/user-attachments/assets/e47a6fe7-ed08-4b6b-9a1d-4ace917a9ed4" width=70%>
  <br>
  <br>
  <p><a href="./models/rook.lsp">Шахматная ладья</a></p>
  <img src="https://github.com/user-attachments/assets/4646f659-f0ee-4547-a118-bebe93daeaf3" width=70%>
</details>

## Требования

- уникальность модели (аналогичные модели не должны быть сданы ранее)
- достаточная сложность модели (согласовывается с преподавателем)
- задание параметров моделей перед построением (не менее 10, включая количественные)
- возможность выбора параметров по умолчанию
- проверка корректности при ручном вводе
- отличия стиля кода между работами для имитации выполнения разными людьми

## Установка и запуск

0. Клонируйте репозиторий и перейдите в его папку.
1. Установите русскоязычную версию [AutoCAD](https://www.autodesk.com/products/autocad).
2. Перейдите в `Меню / Управление / Загрузить приложение` и в открывшемся окне выберите файл нужной модели.
3. Если загрузка прошла успешно, то появится сообщение:

```
Команда: _appload <модель>.lsp успешно загружено.
```

4. В консоли AutoCAD выполните команду:

```lisp
(c:<модель>)
```

Затем введите запрашиваемые параметры (или нажимайте Enter для выбора значений по умолчанию).
