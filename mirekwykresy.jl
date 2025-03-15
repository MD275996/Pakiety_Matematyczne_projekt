using PlotlyJS

function pomnoz_liste(lista, liczba, ludzie)
    for i in 1:length(lista)
        mnoznik = liczba * ludzie[i]
        lista[i] *= mnoznik
    end
    return lista
end

europa = ["Niemcy","Francja","Hiszpania","Ukraina","Polska"]
wieprzowina = [16,31,10,15,38]
wołowina = [5,9.4,5,6,2]
drób = [64,13.1,30,15,25]
ludzie = [83000000,68000000,47500000,44000000,38000000]
pomnoz_liste(wieprzowina,6000,ludzie)
pomnoz_liste(wołowina,15000,ludzie)
pomnoz_liste(drób,4000,ludzie)
a = plot([
    bar(name="Zużyte litry wody na wieprzowine", x=europa, y=wieprzowina)
    bar(name="Zużyte litry wody na wołowine", x=europa, y=wołowina)
    bar(name="Zużyte litry wody na drób", x=europa, y=drób)
], Layout(barmode="stack"))

swiat = ["USA","UE","Chiny","Rosja"]
wieprzowina2 = [30,33.5,23.7,31]
wołowina2 = [26,10.6,1.4,49]
drób2 = [51,24.3,20,31]
ludzie2 = [332000000,747000000,1412000000,143000000]
pomnoz_liste(wieprzowina2,6000,ludzie2)
pomnoz_liste(wołowina2,15000,ludzie2)
pomnoz_liste(drób2,4000,ludzie2)
b = plot([
    bar(name="Zużyte litry wody na wieprzowine", x=swiat, y=wieprzowina2)
    bar(name="Zużyte litry wody na wołowine", x=swiat, y=wołowina2)
    bar(name="Zużyte litry wody na drób", x=swiat, y=drób2)
], Layout(barmode="stack"))


Ameryka = ["Kanada","Argentyna","Chile","Meksyk","Brazylia"]
wieprzowina3 = [21,20,27,30,18.5]
wołowina3 = [25.5,42,22.4,15,40]
drób3 = [50,48,37,50,20]
ludzie3 = [38000000,46000000,19500000,127000000,214000000]
pomnoz_liste(wieprzowina3,6000,ludzie3)
pomnoz_liste(wołowina3,15000,ludzie3)
pomnoz_liste(drób3,4000,ludzie3)
c = plot([
    bar(name="Zużyte litry wody na wieprzowine", x=Ameryka, y=wieprzowina3)
    bar(name="Zużyte litry wody na wołowine", x=Ameryka, y=wołowina3)
    bar(name="Zużyte litry wody na drób", x=Ameryka, y=drób3)
], Layout(barmode="stack"))

azjaafryka = ["Izrael","Indonezja","Bangladesz","Indie","Australia","Nigeria","Etiopia"]
wieprzowina4 = [1.3,5,3,1,20,2,2]
wołowina4 = [20,1,4,0.2,19.5,2,0.6]
drób4 = [64.5,22,3,2.5,44,1,0.6]
ludzie4 = [9300000,274000000,169500000,1408000000,26000000,213500000,120300000]
pomnoz_liste(wieprzowina4,6000,ludzie4)
pomnoz_liste(wołowina4,15000,ludzie4)
pomnoz_liste(drób4,4000,ludzie4)
d = plot([
    bar(name="Zużyte litry wody na wieprzowine", x=azjaafryka, y=wieprzowina4)
    bar(name="Zużyte litry wody na wołowine", x=azjaafryka, y=wołowina4)
    bar(name="Zużyte litry wody na drób", x=azjaafryka, y=drób4)
], Layout(barmode="stack"))
