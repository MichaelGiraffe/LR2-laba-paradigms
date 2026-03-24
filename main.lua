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
	for j=1,26 do
		mas[j]=0
	end

	local index=1
	while index<=string.len(str) do
		mas[string.byte(str,index)-96]=mas[string.byte(str,index)-96]+1
		index=index+1
	end
	index=1
	print('вывод символов')
	for index=1,26 do
		print(mas[index])
	end
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
	--тут потом придется досоздавать палиндром
	print(generated)
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
	if i==2 then
		print('добавить поиск палиндрома из файла')
	end
	if i==3 then
		ordCounter(mas,attr)
		print('новый ввод строки')
	end
end