or i in 1..10
#def quadratic_equation
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
p qe = "#{a}x^2 + #{b}x + #{c}"
d = b*b - 4*a*c

	if (d < 0)
		p "nqma koreni"
	else 
		p x1=(-b-Math.sqrt(d))/(2*a)                 
 		p x2=(-b+Math.sqrt(d))/(2*a)  
	end

end
