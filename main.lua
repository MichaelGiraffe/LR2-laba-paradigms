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

math.randomseed(os.time())

function Привет(имя)
	print("обед уютненько очки с усами")
	print(имя)
end



function ordCounter(mas,str)
	str=str:lower()
	for j=1,26 do
		mas[j]=0
	end

	local index=1
	while index<=string.len(str) do
		mas[string.byte(str,index)-96]=mas[string.byte(str,index)-96]+1
		index=index+1
	end
	index=1
	print('сделано')
end

function generatePal(mas_copy)
	local generated=''
	local found
	local rand_index
	while true do
		found=false
		for index=1,5 do
			rand_index=math.random(1,26)
			if(mas_copy[rand_index])>=2 then
				generated=generated..string.char(96+rand_index)
				mas_copy[rand_index]=mas_copy[rand_index]-2
				found=true
				break
			end
		end

		if found==false then
			for index=1,26 do
				if(mas_copy[index])>=2 then
					generated=generated..string.char(96+index)
					mas_copy[index]=mas_copy[index]-2
					found=true
					break
				end
			end
			if found==false then
				break
			end
		end
	end
	
	local center=''
	for index=1,5 do
		rand_index=math.random(1,26)
		if(mas_copy[rand_index])>=1 then
			center=string.char(96+rand_index)
			break
		end
	end
	if center=='' then
		for index=1,26 do
			if(mas_copy[index])>=1 then
				center=string.char(96+index)
				break
			end
		end
	end
	
	--создаем палиндром
	generated=generated..center..string.reverse(generated)
	--выводим палиндром
	print(generated)
end


-- Функция проверки на равенство совпадения кол-ва символов из файла
function canBuild(str, mas)
	local temp_mas = {}
	for i = 1, 26 do 
		temp_mas[i] = mas[i] 
	end

	str = str:lower()
	for j = 1, #str do
		local byte = string.byte(str, j)
		local index = byte - 96

		if index >= 1 and index <= 26 then
			if temp_mas[index] > 0 then
				temp_mas[index] = temp_mas[index] - 1
			else
				return false
			end
		end
	end
	return true
end
--функция для подбора списка слов из словаря
function findSimilar(filename, current_mas)
	local file = io.open(filename, "r")
	if not file then
		print("Файл " .. filename .. " не найден.")
		return
	end

	print("--- Подходящие ---")
	local found_any = false
	for line in file:lines() do
		-- Убираем лишние пробелы/переносы
		local word = line:gsub("%s+", "")
		if word ~= "" and canBuild(word, current_mas) then
			print(line)
			found_any = true
		end
	end
	file:close()

	if not found_any then
		print("Палиндромов из словаря не обнаружено")
	end
end



mas={}
--задаем нули в массиве
for i=1,26 do
	mas[i]=0
end

local vvod=io.read()
ordCounter(mas,vvod)
while true do
	print('1 сгенерировать палиндром')
	print('2 вывести палиндромы, которые можно составить')
	print('3 ввести новое слово')
	print('0-выход')
	i=tonumber(io.read())
	if i==0 then
		break
	end
	if i==1 then
		local attr=vvod
		local mas_copy={}
		for i=1,26 do
			mas_copy[i]=mas[i]
		end
		ordCounter(mas,attr)
		generatePal(mas_copy)
	end
	if i == 2 then
		-- Передаем имя файла и наш основной массив с буквами
		findSimilar("palindromsDictEng.txt", mas)
	end
	if i==3 then
		vvod = io.read()
        ordCounter(mas, vvod)
	end
end