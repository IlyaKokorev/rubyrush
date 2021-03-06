# Ввод данных, игра «Южное Бутово» 

 В этом уроке мы научимся вводить данные в программу из консоли и напишем небольшую текстовую игру с использованием полученных ранее знаний.

### План урока

1. Команда `gets`, получение данных от пользователя через консоль
1. Как с использованием переменных, оператора `if` и команды `gets` написать простенькую текстовую игру-квест «Прогулка в Южном Бутово»


<!-- youtube starts here -->
<script>
var videoPlan = {}
</script>

<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-0">
<iframe src="https://www.youtube.com/embed/eFFONaW14xA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
videoPlan["video-0"] = [{"begin":"0:06","comment":"Приветствие и план урока"},{"begin":"1:40","comment":"Ввод данных в программу из консоли"},{"begin":"4:20","comment":"Работа с кодировкой UTF-8"},{"begin":"5:50","comment":"Обработка ввода пользователя"},{"begin":"8:15","comment":"Пишем квест «Южное Бутово»"},{"begin":"13:08","comment":"Итоги урока"}]
</script>
</div>

 <!-- youtube ends here --> 

### Команда gets

Мы уже знакомы с командой `puts`, которая выводит строку на экран (put string):

```ruby
puts "Привет, я строка, меня вывели на экран!"
```

У этой команды есть друг, команда `gets`, которая «берёт строку»  (get string) и кладёт её в переменную, которой мы хотим присвоить значение строки, введённой пользователем во время выполнения программы:

```ruby
my_string = gets
```

Если выполнить программу, состоящую из одной только этой строчки, то программа сразу после запуска будет ждать, пока пользователь наберёт какие-то символы и после набора нажмёт клавишу Ввод (Enter).

После нажатия `Enter` все эти символы (вместе со специальным символом перевода строки `\n`, который обозначает нажатую клавишу `Enter`) попадут в переменную `my_string`.

### Ввод данных в программу из командной строки

Продемонстрируем на примере: как обычно мы создадим в рабочей директории `c:\rubytut` папку `lesson5` и напишем в ней программу, которая спрашивает у пользователя, как его зовут:

```ruby
puts "Привет! Как тебя зовут?"
name = gets
puts "Привет, " + name + ", как дела?"
```

Не забудьте сохранить ваш файл в кодировке `UTF-8`, в Sublime это делается с помощью пунктов меню: "File" → "Save with Encoding" → "UTF-8".

Программа `gets.rb` выводит на экран приветствие и ждёт, пока пользователь введёт своё имя и потом нажмёт Enter, после этого программа здоровается с пользователем, назвав его по имени (тому самому, что он только что ввёл) и спрашивает, как у него дела. :)

Для того, чтобы склеить строку из нескольких строк мы используем оператор `+` - он работает очень просто:

```ruby
puts "а" + "б"
```

Выведет на экран `аб`.

```ruby
puts "а" + " и " + "б"
```

Выведет на экран `а и б`. Ну, вы поняли.

В Windows строка будет передана в программу из консоли в кодировке Windows и в программе может возникнуть ошибка, вы увидите абракадабру или что похуже.

Потому что мы работаем в кодировке `UTF-8`, к результату работы (строке, полученной от пользователя) мы с помощью точки применим метод `encode("UTF-8")`.

- [Что такое кодировка?](https://ru.wikipedia.org/wiki/%D0%9D%D0%B0%D0%B1%D0%BE%D1%80_%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB%D0%BE%D0%B2)
- [Подробнее о методах работы с кодировками в Ruby (на английском)](http://ruby-doc.org/core-2.2.0/Encoding.html).

Также мы уберём из результата, полученного `gets`, последний символ — перенос строки (\n = Enter). Для этого мы используем метод `chomp`. [Подробнее о методе chomp](https://ru.wikibooks.org/wiki/Ruby/%D0%A1%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D1%87%D0%BD%D0%B8%D0%BA/String#String.23chomp).

Получится вот так:

```ruby
puts "Привет! Как тебя зовут?"
name = gets.encode("UTF-8").chomp
puts "Привет, " + name + ", как дела?"
```

### Пишем текстовый квест с нелинейным сюжетом

![Стереотипный портрет типичных жителей Южного Бутово](http://goodprogrammer.ru/system/rich_texts/000/000/118f43e82816caa415728a70bc448dd88a290296887/0.jpg?1429438465 "Стереотипный портрет типичных жителей Южного Бутово")

Текст готовой программы вы можете посмотреть здесь, а ниже мы объясним по шагам, что в ней происходит.

```ruby
puts "Вы решили прогуляться в Южном Бутово и наткнулись на спортивных ребят
1. Попытаться убежать
2. Продолжать идти"

choice = gets.chomp

if choice == "1"
  abort "Ребя без труда догнали вас и побили. Не знаю, за что"
else
  puts "Один из ребят вышел вперёд и спросил \"Сиги есть?\"
  1. Дать прикурить
  2. -- Не курю"

  choice = gets.chomp

  if choice == "1"
    abort "Прикурив, ребята отправились дальше"
  else
    abort "Ребята расстроились и побили вас. Теперь уже ясно, за что"
  end
end
```

Сначала мы выводим вводную строку на экран, чтобы познакомить пользователя с происходящим.

```ruby
puts "Вы решили прогуляться в Южном Бутово и наткнулись на спортивных ребят
1. Попытаться убежать
2. Продолжать идти"
```

Сразу после этого (прямо той же строкой) мы выводим пользователю пронумерованные варианты ответов. Мы хотим, чтобы он ввёл только цифру — номер выбранного варианта.

С помощью оператора `gets` мы ждём от пользователя ввода строки, которая, если пользователь всё понял правильно, будет состоять из одного символа - номера выбранного варианта. Мы сохраняем выбранный вариант во временную переменную `choice`.

```ruby
choice = gets.chomp
```

Потом мы с помощью оператора `if-else` сравниваем выбранный вариант со строкой (`'1'` или `'2'`) и в этом случае показываем пользователю другую строку, связанную с выбранным вариантом.

```ruby
if choice == "1"
```

В этой ветви можно абсолютно аналогично спросить у пользователя, какой вариант он выберет, сохранить его в переменную `choice` и снова развить сюжет с помощью `if-else`.

Как видите `if` можно вкладывать внутрь другого `if` сколько угодно раз.

![Вложенные if-else](http://goodprogrammer.ru/system/rich_texts/000/000/119338505138ef7b79b878a6240204738485b64be6f/1.png?1429438465 "Вложенные if-else")

### Команда abort

Если в какой-то момент повествование дошло до своей кульминации и нам нужно его прекратить, сказав пользователю последнюю строку, то мы делаем это с помощью команды `abort`:

```ruby
abort "Ну вот и всё!"
puts "Меня нет"
```

Эта команда, как и `puts`, выведет на экран строку, которую ей передали, а потом немедленно закончит выполнение программы. Следующую строку `'Меня нет'` мы на экране уже не увидим.

Итак, в этом уроке мы научились пользоваться командой `gets`, а также командами `encode`, `chomp` и `abort`.

И применили в деле оператор `if-else`, написав простой текстовый квест.
В материалах к уроку вы найдете более сложную версию игрушки «Прогулка в Южном Бутово». Обязательно сыграйте в нее и изучите исходник.

А в следующем уроке мы узнаем, что такое массивы, зачем они нужны и почему их так любят программисты.

Также мы подробнее расскажем вам о том, как выполняется программа.
