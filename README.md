### Как сдавать

По ссылке https://classroom.github.com/a/0ccOHsA1 создаётся репозиторий и PR для комментариев, туда коммитить в master, комментарии читать.

Для удобства созданы заготовки решений в файлах `Task*`.

### Сроки сдачи

1. Мягкий дедлайн: 22 февраля, 23:59 MSK. Каждое из 8 заданий оценивается от 0 до 1 балла. Усложнённое задание приносит ещё 1 балл.
2. Жесткий дедлайн: 25 февраля, 23:59 MSK. Каждое задание оценивается максимум в 0.75.

### Проверка и самопроверка

Некоторые тесты уже написаны, надо их раскомментировать. Часть из них придётся доработать напильником. Придумывайте и дописывайте свои тесты по аналогии с существующими.

Модульные тесты и тесты свойств пишутся функциями с именами, начинающимися с `unit_` и `prop_` соответственно.

Запускаются тесты командой `stack test`.

### Задачи

В заданиях [2..5] разрешено использовать автоматический `deriving` только для `Show`. Остальные инстансы необходимо реализовывать самостоятельно.

#### 1. Проредуцировать следующие лямбда-термы:

1.1. `((λ p. (λ q. ((q (p r)) s))) ((q ((λ p. p) r)) s))`

1.2. `((λ a. λ b. (λ x. x) b a (a b x) ((λ a. (λ b. a)) x)) (λ b. b)) [x := b]`

#### 2. Дни недели

Определите свой тип данных для дней недели. Реализуйте следующие функции:

1. `nextDay` вычисляет следующий за переданным день недели.
2. `afterDays` вычисляет день недели, который наступит после заданного через переданное число дней.
3. `isWeekend` проверяет, является ли день недели выходным.
4. `daysToParty` выводит число дней, оставшихся до пятницы.

#### 3. Натуральные числа Пеано

Этот тип данных для натуральных чисел определяется следующим образом:

```haskell
data Nat = Z | S Nat
```

Реализуйте следующие операции (которые должны быть реализованы полностью самостоятельно) без промежуточной конвертации в Integer:

1. Сложение двух натуральных чисел.

2. Умножение двух натуральных чисел.

3. Вычитание натуральных чисел.

4. Превращение целых чисел в натуральные и наоборот.

5. Проверка натуральных чисел на равенство.

6. Сравнение натуральных чисел.

##### Усложнённая версия

Дополнительно требуется реализовать следующие функции:

1. Проверка натурального числа на чётность.

2. Целочисленное деление натуральных чисел.

3. Остаток от деления натурального числа на другое.

#### 4. Задачи на двоичные деревья

Тип данных для двоичного дерева имеет два конструктора:
1. Лист дерева, не содержит данных.
2. Узел дерева. Содержит данное и имеет двух детей.

_Двоичное дерево_ называется _двоичным деревом поиска_ если оно удовлетворяет следующему условию: значения всех элементов в левом поддереве меньше значения в узле, а значения элементов в правом поддереве больше либо равны значению в узле.

Обратите внимание, что одно значение может находиться в дереве в нескольких копиях.

Реализуйте следующие операции с _двоичным деревом поиска_:

1. Проверка дерева на пустоту.
2. Подсчёт размера дерева (то есть числа элементов в нём).
3. Проверка вхождения заданного элемента в дерево (используйте тот факт, что дерево является деревом поиска).
4. Вставка нового элемента в _двоичное дерево поиска_.
5. Функцию `fromList`, которая создаёт дерево из списка элементов.
6. Функцию, которая удаляет заданный элемент из дерева.

#### 5. Инстанс Foldable для Tree

Реализуйте инстанс `Foldable` для типа `Tree` из предыдущей задачи.
Инстанс должен быть реализован таким образом, чтобы выполнялось свойство: `toList . fromList ≡ sort`.

#### Задание 6. Разбиваемся

##### Базовая версия

Используя свёртку, реализуйте функцию `splitOn`, которая разбивает список на подсписки по элементу.

```haskell
ghci> splitOn '/' "path/to/file"
["path", "to", "file"]
```

Стоит обратить внимание, что функция `splitOn` всегда возвращает непустой список элементов. Это должно быть отражено в типе. Пример приведён для обычного списка, хотя это решение не полностью корректное.

##### Усложнённая версия

Дополнительно реализуйте функцию (опять же, используя свёртку) `joinWith`, обратную `splitOn`.

```haskell
ghci> joinWith '/' ["path", "to", "file"]
"path/to/file"
```

Стоит обратить внимание на то, что функция `joinWith` может принимать и пустой список.

#### 7. Задания на моноиды

##### Упражнение 1.
###### Базовая версия

Напишите функцию, принимающую список списков внутри `Maybe` и возвращающую конкатенацию всех внутренних списков.

```haskell
ghci> maybeConcat [Just [1,2,3], Nothing, Just [4,5]]
[1,2,3,4,5]
```

###### Усложнённая версия

Функция должна принимать произвольный набор `Either`, где и `Left` и `Right` содержат некоторые моноидальные элементы, и необходимо вернуть пару из результатов моноидального объединения отдельно элементов внутри `Left` и отдельно элементов внутри `Right`.

```haskell
ghci> eitherConcat [Left (Sum 3), Right [1,2,3], Left (Sum 5), Right [4,5]]
(Sum {getSum = 8}, [1,2,3,4,5])
```

##### Упражнение 2.

###### Базовая версия

Реализуйте инстансы алгебраических классов типов для следующих структур данных. Ваши инстансы должны удовлетворять законам для этих структур.

1. `Semigroup` для `data NonEmpty a = a :| [a]`.
2. `Semigroup` для типа данных `data ThisOrThat a b = This a | That b | Both a b`.

###### Усложнённая версия

Дополнительно реализуйте следующие инстансы:

1. `Semigroup` и `Monoid` для строк, объединяемых при помощи `'.'`.

```haskell
ghci> Name "root" <> Name "server"
Name "root.server"
```

2. `Semigroup` и `Monoid` для `newtype Endo a = Endo { getEndo :: a -> a }`.


#### 8. В модуле `Data.Function` определена функция `fix`, которая является аналогом комбинатора неподвижной точки:

Реализовать с помощью fix следующие функции:
```haskell
iterateElement :: a -> [a]
iterateElement = undefined
```
Данная функция должна удовлетворять равенству:
```haskell
iterateElement x == [x, x..]
```

```haskell
fibonacci :: Integer -> Integer
fibonacci = undefined

factorial :: Integer -> Integer
factorial = undefined

mapFix :: (a -> b) -> [a] -> [b]
mapFix = undefined
```
Последняя функция должна удовлетворять следующему равенству:
```haskell
mapFix f xs == map f xs
```
