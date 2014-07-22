require 'nokogiri'
require 'pdfkit'

p=1
while p<=ARGV[0].to_i

qe = []
re = []
ce = []
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
h = rand(-9..10)
if (h == 0)
	h = rand(-9..10)
end
j = rand(-9..10)
if (j == 0)
	j = rand(-9..10)
end
k = rand(-9..10)
if (k == 0)	
	k = rand(-9..10)
end
l = rand(-9..10)
ce[i] =  "#{i}: #{h}x^3 + #{j}x^2 + #{k}x + l = 0"
p qe[i] =  "#{i}: #{a}x^2 + #{b}x + #{c} = 0"
#ar << qe

d = b*b - 4*a*c

	if (d < 0)
		r = 1
		p "nqma koreni"
	else 
		x1=(-b-Math.sqrt(d))/(2*a)
 		x2=(-b+Math.sqrt(d))/(2*a)
	end
	if (d < 0)	
	re[i] = "nqma koreni"
	else	
	p x1.round(3)
	p x2.round(3)
	re[i]  = "#{i}: X1 = #{x1} X2 = #{x2}"
	end
builder = Nokogiri::HTML::Builder.new do |doc|
	doc.html {
		doc.body{
			doc.table(:border=>"5", :align=>"center", :width=>"600") {
				doc.tr {
					doc.td(:border=>"0"){doc.text("#{qe[1]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[2]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[3]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[4]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[5]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[6]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[7]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[8]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[9]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[10]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[1]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[2]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[3]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[4]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[5]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[6]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[7]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[8]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[9]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{ce[10]}")}
					doc.tr(:border=>"0"){}
	
	
				}
}
}
			}
end

fileHtml = File.new("uravneniq#{p}.html", "w+")
	fileHtml.puts builder.to_html
fileHtml.close()
builder = Nokogiri::HTML::Builder.new do |doc|
	doc.html {
		doc.body{
			doc.table(:border=>"5", :align=>"center", :width=>"600") {
				doc.tr {
					doc.td(:border=>"0"){doc.text("#{qe[1]} #{re[1]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[2]} #{re[2]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[3]} #{re[3]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[4]} #{re[4]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[5]} #{re[5]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[6]} #{re[6]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[7]} #{re[7]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[8]} #{re[8]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[9]} #{re[9]}")}
					doc.tr(:border=>"0"){}
					doc.td(:border=>"0"){doc.text("#{qe[10]} #{re[10]}")}
					doc.tr(:border=>"0"){}
					
	
				}
}
}
			}
end

fileHtml = File.new("resheniq#{p}.html", "w+")
	fileHtml.puts builder.to_html
fileHtml.close()
`wkhtmltopdf uravneniq#{p}.html uravneniq#{p}.pdf`
`wkhtmltopdf resheniq#{p}.html resheniq#{p}.pdf`
end

p+=1
end
