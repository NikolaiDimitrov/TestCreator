ar = []
ar2 = []

for i in 1..10
a = rand(-9..10)
if (a == 0)
	a = rand(-9..10)
end
b = rand(-9..10)
if (b == 0)
	b = rand(-9..10)
end
c = rand(-9..10)
if (c == 0)	
	c = rand(-9..10)
end
p "Number #{i}"
p qe = ["Number #{i} #{a}x^2 + #{b}x + #{c}\n"]
ar << qe
d = b*b - 4*a*c

	if (d < 0)
		r = 1
		p "nqma koreni"
	else 
		p x1=(-b-Math.sqrt(d))/(2*a)                 
 		p x2=(-b+Math.sqrt(d))/(2*a)  
	end
	if (d < 0) 
		xe = ["Number #{i} d < 0 => nqma realni koreni\n"]
		ar2 << xe	
	else
		xe = ["Number #{i} X1 = #{x1} X2 = #{x2}\n"]
		ar2 << xe
	end
File.open("uravneniq.txt","w") do |file|
	ar.each do |element|
		file.write(element[0])
	end

end
File.open("resheniq.txt","w") do |file|
	ar2.each do |element|
		file.write(element[0])
	end

end
end
