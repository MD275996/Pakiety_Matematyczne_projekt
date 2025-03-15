using CSV, Plots, DataFrames, Printf

kraje = DataFrame(CSV.File("kraje.csv"))
show(kraje,allrows=true,allcols=true)

x = kraje[:,"kraje"]
y = kraje[:,"meat"]
colours = [:red, :yellow, :orange, :green]
bar(x, y, ylabel="konsumpcja mięsa na osobę w ciągu roku", legend = false)
#xlabel!("")

water_pork = 6000
water_beef = 15000
water_chicken = 4000
y1=[kraje[:,"beef"].*water_beef/1000,kraje[:,"pork"].*water_pork/1000,kraje[:,"poultry"].*water_chicken/1000]
bar(x, y1, alpha = 0.4, ylabel="zużycie wody w m³")
y2=[(kraje[:,"beef"].*water_beef+kraje[:,"pork"].*water_pork+kraje[:,"poultry"].*water_chicken)/1000]
y3=[(kraje[:,"beef"].*water_beef+kraje[:,"pork"].*water_pork+kraje[:,"poultry"].*water_chicken)/1000 .*kraje[:,"populacja(mln)"]]
bar(x, y2, ylabel="zużycie wody w m³ na osobę")
bar(x, y3, ylabel="zużycie wody w m³ jako kraj")