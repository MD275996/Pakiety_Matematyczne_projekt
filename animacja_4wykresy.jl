using Plots

woda = 3.4*10^17
ludzie = 9000000000
rocznie = 1400000
function animacja1(t)
	 f(t) = woda - rocznie*ludzie*(t-2023) 
	 m(t) = woda - 0.5*rocznie*ludzie*(t-2023) - 0.5*rocznie*ludzie*0.6(t-2023)
	 n(t) = woda - 0.6*rocznie*ludzie*(t-2023)
	 x = range(2023, 2023+t, length=100)
	p2 = plot!(x, [f, m, n], title = "Dieta wegańska", label = ["0%" "50%" "100%"], lw = 3,  ylims=(0, woda))
	
end
function animacja2(t)
	f(t) = woda - rocznie*ludzie*(t-2023) 
	g(t) = woda - 0.5*rocznie*ludzie*(t-2023) - 0.5*rocznie*ludzie*0.45 *(t-2023)
	h(t) = woda - 0.45*rocznie*ludzie*(t-2023)
	
	x = range(2023, 2023+t, length=100)
   p1 = plot!(x, [f, g, h], title = "Zdrowa dieta wegańska", label = ["0%" "50%" "100%"], lw = 3, ylims=(0, woda))
   
end
function animacja3(t)
	f(t) = woda - rocznie*ludzie*(t-2023) 
	
	i(t) = woda - 0.5*rocznie*ludzie*(t-2023) - 0.5*rocznie*ludzie*0.77*(t-2023)
	j(t) = woda - 0.77*rocznie*ludzie*(t-2023)
	
	x = range(2023, 2023+t, length=100)
  p3 = plot!(x, [f, i, j], title = "Zdrowa dieta mięsna", label = ["0%" "50%" "100%"], lw = 3, ylims = (0, woda))
   
end
function animacja4(t)
	f(t) = woda - rocznie*ludzie*(t-2023) 
	k(t) = woda - 0.5*rocznie*ludzie*(t-2023) - 0.5*rocznie*ludzie*0.56*(t-2023)
	l(t) = woda - 0.56*rocznie*ludzie*(t-2023)
	x = range(2023, 2023+t, length=100)
   p4 = plot!(x, [f, k, l], title = "Dieta pesceterian", label = ["0%" "50%" "100%"], lw = 3, ylims = (0, woda))
end
anim = @animate for t in 0:57
	a=range(2024,2080,length=100)
	b(a)=0
	p1=plot(a,b,label="")
	animacja1(t)
	p2=plot(a,b,label="")
	animacja2(t)
	p3=plot(a,b,label="")
	animacja3(t)
	p4=plot(a,b,label="")
	animacja4(t)
	plot(p1, p2, p3, p4, layout=(2,2),xlabel="")
end persist=true
mp4(anim,"koniecwody2.mp4", fps = 5)