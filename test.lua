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

function ordCounter(mas,str) 
	local index=1
	while index<=string.len(str) do
		mas[string.byte(str,index)-96]=mas[string.byte(str,index)-96]+1
		index=index+1
	end
	print('сделано')
end

function generatePal(mas)
	print('сделать ф-ию, генерирующую палиндром')
end

function findPal(mas)
	print('hello')
end

math.randomseed(os.time())
local число=math.random(100,300)

print('английская буква a')
print(string.byte('z'))


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
local mas={}

--задаем нули в массиве
for i=1,26 do
	mas[i]=0
end




local i=-5
--делаем меню
while true do
	local a=io.read()
	
	print('1-ввести новое слово')
	print('2-придумать любой палиндром')
	print('3-найти палиндром в словаре (only english)')
	print('0-выход')
	i=tonumber(io.read())
	if(i==1) then
		ordCounter(mas,a)
	end
	if(i==0) then
		break
	end
end
