using PlotlyJS
kraje = ["USA","Kanada","Argentyna","Chile","Meksyk","Brazylia","UE","Niemcy","Francja","Hiszpania","Ukraina","Polska","Chiny","Rosja","Izrael","Indonezja","Bangladesz","Indie","Australia","Nigeria","Etiopia"]
w = plot([
    bar(name="Wieprzowina", x=kraje, y=[30,21,20,27,30,18.5,33.5,16,31,10,15,38,23.7,31,1.3,5,3,1,20,2,2])
    bar(name="Wołowina", x=kraje, y=[26,25.5,42,22.4,15,40,10.6,5,9.4,5,6,2,1.4,49,20,1,4,0.2,19.5,2,0.6])
    bar(name="Drób", x=kraje, y=[51,50,48,37,50,20,24.3,64,13.1,30,15,25,20,31,64.5,22,3,2.5,44,1,0.6,])
], Layout(barmode="stack"))
