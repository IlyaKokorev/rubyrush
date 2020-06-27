# encoding: utf-8

# Объявили пустой массив
array = []

puts 'Какой длины будет массив случайных чисел?'
number = gets.to_i

index = 0

# Цикл должен сделать ровно number число итераций
while index < number do
  # Записываем произвольное число от 0 до 100 в массив
  array << rand(100)

  index += 1
end

# Выводим получившийся массив
puts array.to_s

# Объявляем переменную которая будет хранить максимальное найденное
# в массиве значение
max_value = 0

# Пробегаем по нашему массиву и ищем самое большое число
for item in array do
  # Если текущий элемент больше максимального значения то записываем значение
  # этого элемента в качестве нового максимального значения
  if item > max_value
    max_value = item
  end
end

# В итоге в max_value останется наибольшее из просмотренных в массиве чисел
puts 'Самое большое число:'
puts max_value.to_s

# Также можно воспользоваться методом .max
# puts array.to_s
# puts 'Максимальное значение: ' + array.max.to_s
