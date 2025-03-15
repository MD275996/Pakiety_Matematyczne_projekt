#=
siema tu marek dzisiaj pokaze wam jak się robi analizę za pomocą dataframe'a
będziemy obliczać na podstawie takich zapotrzebowań:
kcal: 2600
bialko: 80g
tluszcz: 30% z pozyskiwanych kcal
węglowodany: 240g

=#
#Załadowanie bibliotek
using CSV,PlotlyJS, DataFrames

##

#Pobranie danych
foods_df = DataFrame(CSV.File("water_footprint_nowy2.csv"))
wege = foods_df[:,"Produkt"]
mieso = ["Beef","Chicken meat","Goat meat", "Lamb", "Pork"]
for i in 1:length(mieso), j in 1:length(wege)-1
    if mieso[i] == wege[j]
        deleteat!(wege,j)
    end
end

#stworzyliśmy dwa dataframe'y, mięso i wege
mieso_df = foods_df[in.(foods_df.Produkt,Ref(mieso)),:]
wege_df = foods_df[in.(foods_df.Produkt,Ref(wege)),:]

##

#---------------------------------BIAŁKO-------------------------------------
#Analiza białka,wybieramy produkty bezmięsne o największej zawartości białka
top_bialko = sort!(wege_df,[order(:Bialko, rev=true)])[1:40,:]

#stwarzamy dane wege
trace_wege = scatter(top_bialko,
    x=:zuzycie_wody_na_100_g,
    y=:Bialko,
    text=:Produkt,
    mode="markers",
    name="Wege",
    marker_size=8,
    marker_color="blue")

#stwarzamy dane mięso
trace_mieso = scatter(mieso_df,
    x=:zuzycie_wody_na_100_g,
    y=:Bialko,
    text=:Produkt,
    mode="markers",
    name="Mięso",
    marker_size=8,
    marker_color="red")

#kreujemy layout
layout = Layout(;
    title="Zależność białka od zużycia wody",
    plot_bgcolor="rgb(254, 247, 234)",
    paper_bgcolor="rgb(254, 247, 234)",
    xaxis=attr(title="Ślad wodny",
        showgrid=true,
        gridcolor="rgb(125,125,125)",
        zeroline=true,
        zerolinecolor="rgb(0,0,0)",
        showline=true,
        linecolor="rgb(20,20,20)"
        ),
    yaxis=attr(title="Białko",
        showgrid=true,
        gridcolor="rgb(125,125,125)",
        zeroline=true,
        zerolinecolor="rgb(0,0,0)",
        showline=true,
        linecolor="rgb(20,20,20)"
        ))

#stwarzamy wykres
bialko_scatter = plot([trace_wege,trace_mieso],layout)

##

#ograniczamy produkty bezmięsne 3 produktem mięsnym o najmniejszym zużyciu wody
ograniczenie_bialko = sort!(mieso_df,[order(:zuzycie_wody_na_100_g,rev=true)])[3,2]
wyniki_bialko = top_bialko[top_bialko.zuzycie_wody_na_100_g .< ograniczenie_bialko,:]

bialko_100_dni = [(wyniki_bialko[i,1], round((80/wyniki_bialko[i,4])*100,digits=2),(wyniki_bialko[i,2]*(80/wyniki_bialko[i,4]))*100)  for i in 1:15]
sort!(bialko_100_dni, by=last, rev=true)

trace2 = bar(;
    x = [bialko_100_dni[i][1] for i in 1:15],
    y = [bialko_100_dni[i][3] for i in 1:15],
    text = [bialko_100_dni[i][2] for i in 1:15],
    name = "Wege",
    marker_color = "blue",
    )

trace1 = bar(;
    x = [mieso_df[i,1] for i in 1:5],
    y = [(mieso_df[i,2]*(80/mieso_df[i,4]))*100 for i in 1:5],
    text = [string(round((80/mieso_df[i,4])*100,digits=2))*"g" for i in 1:5],
    name = "Mięso",
    marker_color = "red",
    )
layout = Layout(;
    title="Zużycie wody przy uzupełnianiu białka danym produktem przez 100 dni",
    yaxis = attr(
        title="Zużyta woda[m³]"
    ))

plot([trace1,trace2],layout)


##

#------------------------------TŁUSZCZE-----------------------------------------
#Analiza tłuszczy, wybieramy produkty bezmięsne o największej zawartości białka
top_tluszcze = sort!(wege_df,[order(:Tluszcze, rev=true)])[1:40,:]

#stwarzamy dane wege
trace_wege = scatter(top_tluszcze,
    x=:zuzycie_wody_na_100_g,
    y=:Tluszcze,
    text=:Produkt,
    mode="markers",
    name="Wege",
    marker_size=8,
    marker_color="blue")

#stwarzamy dane mięso
trace_mieso = scatter(mieso_df,
    x=:zuzycie_wody_na_100_g,
    y=:Tluszcze,
    text=:Produkt,
    mode="markers",
    name="Mięso",
    marker_size=8,
    marker_color="red")
    
#kreujemy layout
layout = Layout(;title="Zależność tłuszczy od zużycia wody",
    plot_bgcolor="rgb(254, 247, 234)",
    paper_bgcolor="rgb(254, 247, 234)",
    xaxis=attr(title="Ślad wodny",
        showgrid=true,
        gridcolor="rgb(125,125,125)",
        zeroline=true,
        zerolinecolor="rgb(0,0,0)",
        showline=true,
        linecolor="rgb(20,20,20)"
        ),
    yaxis=attr(title="Tłuszcze",
        showgrid=true,
        gridcolor="rgb(125,125,125)",
        zeroline=true,
        zerolinecolor="rgb(0,0,0)",
        showline=true,
        linecolor="rgb(20,20,20)"
        ))

#stwarzamy wykres
tluszcze_scatter = plot([trace_wege,trace_mieso],layout)

##


#ograniczamy produkty bezmięsne 3 produktem mięsnym o najmniejszym zużyciu wody
ograniczenie_tluszcze = sort(mieso_df,order(:zuzycie_wody_na_100_g, rev=true))[3,2]

wyniki_tluszcze = top_tluszcze[top_tluszcze.zuzycie_wody_na_100_g .< ograniczenie_tluszcze,:]   # z olejami
#wyniki_tluszcze = top_tluszcze[(top_tluszcze.zuzycie_wody_na_100_g .< ograniczenie_tluszcze) .& (top_tluszcze.Tluszcze .< 90),:]

(780/wyniki_tluszcze[1,3]) 

tluszcze_100_dni = [(wyniki_tluszcze[i,1],string(round((780/wyniki_tluszcze[i,3])*wyniki_tluszcze[i,5],digits=2))*"g" ,(wyniki_tluszcze[i,2]*(780/wyniki_tluszcze[1,3]))) for i in 1:20 ]
sort!(tluszcze_100_dni, by=last, rev=true)

trace2 = bar(;
    x = [tluszcze_100_dni[i][1] for i in 1:15],
    y = [tluszcze_100_dni[i][3] for i in 1:15],
    text = [tluszcze_100_dni[i][2] for i in 1:15],
    name = "Wege",
    marker_color = "blue",
    )

# trace2 = bar(;
#     x = [tluszcze_100_dni[i][1] for i in 1:20],
#     y = [tluszcze_100_dni[i][3] for i in 1:20],
#     text = [tluszcze_100_dni[i][2] for i in 1:20],
#     name = "Wege",
#     marker_color = "blue",
#     )

trace1 = bar(;
    x = [mieso_df[i,1] for i in 1:5],
    y = [mieso_df[i,2]*(780/mieso_df[1,3]) for i in 1:5],
    text = [string(round((780/mieso_df[i,3])*mieso_df[i,5],digits=2))*"g"  for i in 1:5],
    name = "Mięso",
    marker_color = "red",
    )
layout = Layout(;
    title="Zużycie wody przy uzupełnianiu tłuszczy danym produktem przez 100 dni",
    yaxis = attr(
        title="Zużyta woda[m³]"
    ))

plot([trace1,trace2],layout)
#plot(trace2,layout)


##
#---------------------------------WĘGLOWODANY-------------------------------------

#Analiza węglowodanów, wybieramy produkty bezmięsne o największej zawartości białka
top_wegle = sort!(wege_df,[order(:Weglowodany, rev=true)])[1:40,:]

#stwarzamy dane wege
trace_wege = scatter(top_wegle,
    x=:zuzycie_wody_na_100_g,
    y=:Weglowodany,
    text=:Produkt,
    mode="markers",
    name="Wege",
    marker_size=8,
    marker_color="blue")

#stwarzamy dane mięso
trace_mieso = scatter(mieso_df,
    x=:zuzycie_wody_na_100_g,
    y=:Weglowodany,
    text=:Produkt,
    mode="markers",
    name="Mięso",
    marker_size=8,
    marker_color="red")

#kreujemy layout
layout = Layout(;
    title="Zależność węglowodanów od zużycia wody",
    plot_bgcolor="rgb(254, 247, 234)",
    paper_bgcolor="rgb(254, 247, 234)",
    xaxis=attr(title="Ślad wodny",
        showgrid=true,
        gridcolor="rgb(125,125,125)",
        zeroline=true,
        zerolinecolor="rgb(0,0,0)",
        showline=true,
        linecolor="rgb(20,20,20)"
        ),
    yaxis=attr(title="Węglowodany",
        showgrid=true,
        gridcolor="rgb(125,125,125)",
        zeroline=true,
        zerolinecolor="rgb(0,0,0)",
        showline=true,
        linecolor="rgb(20,20,20)"
        ))

#stwarzamy wykres
wegle_scatter = plot([trace_wege,trace_mieso],layout)

##


#ograniczamy produkty bezmięsne 3 produktem mięsnym o najmniejszym zużyciu wody
ograniczenie_wegle = sort!(mieso_df,[order(:zuzycie_wody_na_100_g,rev=true)])[3,2]
wyniki_wegle = top_wegle[top_wegle.zuzycie_wody_na_100_g .< ograniczenie_wegle,:]

wegle_100_dni = [(wyniki_wegle[i,1],string(round((240/wyniki_wegle[i,6])*100,digits=2))*"g" ,(wyniki_wegle[i,2]*(240/wyniki_wegle[i,6]))*100 ) for i in 1:15]
sort!(wegle_100_dni, by=last, rev=true)

trace2 = bar(;
    x = [wegle_100_dni[i][1] for i in 1:15],
    y = [wegle_100_dni[i][3] for i in 1:15],
    text = [wegle_100_dni[i][2] for i in 1:15],
    name = "Wege",
    marker_color = "blue",
    )

# trace2 = bar(;
#     x = [wegle_100_dni[i][1] for i in 1:20],
#     y = [wegle_100_dni[i][3] for i in 1:20],
#     text = [wegle_100_dni[i][2] for i in 1:20],
#     name = "Wege",
#     marker_color = "blue",
#     )

trace1 = bar(;
    x = [mieso_df[i,1] for i in 1:5],
    y = [(mieso_df[i,2]*(240/mieso_df[i,6]))*100 for i in 1:5],
    text = [string(round((240/mieso_df[i,6])*100,digits=2))*"g" for i in 1:5],
    name = "Mięso",
    marker_color = "red",
    )
layout = Layout(;
    title="Uzupełnianie węglowodanów danym produktem przez 100 dni",
    yaxis = attr(
        title="Zużyta woda[m³]"
    ))

plot([trace1,trace2],layout)
#plot(trace2,layout)

##
end_plot_scatter = [bialko_scatter tluszcze_scatter wegle_scatter]