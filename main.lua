--генерация чисел и кручение шаурмы с Джони Кейджем
--ctrl+i для выравниваний отступов

--что можно использовать
--string.char()
--string.byte()
--string.len()
--.upper() .lower()
--.match()


--function palindrome(string(слово))
--	for(local i=1,i<слово.length(),)--i=1 тк массив символов с единицы начинается
--end

function Привет(имя)
	print("обед уютненько очки с усами")
	print(имя)
end

math.randomseed(os.time())
local число=math.random(100,300)

print('английская буква a')
print(string.byte('z'))
print('русская буква а')
print(string.byte('а'))
print(string.byte('к'))


print("Привет!")
print("загадано число", число)
--ветвления
local хорошая погода=true
local починили_комп=false

if хорошая_погода then
	print("иду играть в пс4")
elseif починили_комп then
	print("урааа в доту")
else
	print("плачем")
end

Привет("Кто-то")

local a=io.read()
print(a)