require 'securerandom'


def random_operation
	random = rand(3)
	operation = ("&" if random == 0) || ("|" if random == 1) || "^"
	return operation
end

def first_type_question

	orig = SecureRandom.hex(2)
	insert = SecureRandom.hex(2)

	rand_shift = rand(5..9)
	a = orig|(insert << rand_shift)

end


def second_type_question
	orig = SecureRandom.hex(2)
	insert = SecureRandom.hex(2)

	rand_shift = rand(5..9)
		a = orig | (insert << rand_shift )
	shift = rand(6...8)
		b = orig | (insert << rand_shift )
	operation = random_operation
	result = a operation b

end


def third_type_question
	testValue = SecureRandom.hex(4)
	a = 0;
	rand = rand(10)
	
	if (testValue & (1 << rand))
		a = 1
	else 
		a = 2
end

def fourth_type_questions
	i = SecureRandom.hex(2)
	rand = rand(10) 
	operation = random_operation
	
	left = SecureRandom.hex(2)
	result = left operation (1 << rand)
end

def fifth_type_questions

value1 = SecureRandom.hex(4)
value2 = SecureRandom.hex(4)

rand1 = rand(10)
rand2 = rand(10)
result = (value1 << rand1)^(value2 >> rand2)
end

def sixth_type_questions
	testValue = SecureRandom.hex(4)
	a = 0
	result = 0

	if ((result=testValue&testValue ^ testValue|(1<<4)))
		a = 1
	else
		a = 2
	end

def seventh_type_questions 
	value1 = rand(128..512)
	value2 = rand(128..512)

	shift = rand(2..4)
	shift2 = rand(2..4)

	result = (value1 << shift)^(value2>>shift2)
	end
end
end
