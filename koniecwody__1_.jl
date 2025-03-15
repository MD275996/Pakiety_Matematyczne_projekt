using Plots

woda = 3.4*10^17
ludzie = 9000000000
rocznie = 1400000
function animacja(t)
	 f(t) = woda - 0.93*rocznie*ludzie*(t-2023) - 0.07*rocznie*ludzie*0.5 *(t-2023)
	 g(t) = woda - 0.5*rocznie*ludzie*(t-2023) - 0.5*rocznie*ludzie*0.5 *(t-2023)
	 h(t) = woda - 0.5*rocznie*ludzie*(t-2023)
	 x = range(2023, 2023+t, length=100)
	 #xlims!(0, 70)
	 ylims!(0, woda)
	plot!(x, [f, g, h], title = "Rok $(t+2023)", label = ["7%" "50%" "100%"], lw = 3, ylims=(0, woda))
end
anim = @animate for t in 0:55
	a=range(2024,2080,length=100)
	b(a)=0
	plot(a,b,label="")
    animacja(t)
end persist=true
mp4(anim,"koniecwody1.mp4", fps = 5)