#program potrzebny do jednokrotnego użytku, został już wykonany

import csv, requests

#we get the rows from the csv
with open("water_footprint.csv", newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    produkts = []
    for row in reader:
        produkts.append(row)


for i in range(len(produkts)):
    #we request to get the food id from our csv file food names
    url = "https://api.nal.usda.gov/fdc/v1/foods/search"
    params = {"query": produkts[i]["Produkt"], "api_key":"bPjeqMawn9LPpXeKDQv1E5nzyjEHd4e5liasfDaR"}
    r = requests.get(url, params=params)
    anwser_dict = r.json()
    food_id = anwser_dict["foods"][0]["fdcId"]

    print("=============================================================")
    print("Searching: " + produkts[i]["Produkt"])
    print("Got: " + anwser_dict["foods"][0]["description"])
    print("=============================================================")
    input()

    #robimy request dla danego produktu o dane spożycze
    # url = "https://api.nal.usda.gov/fdc//v1/food/"+str(food_id)
    # params = {"api_key":"bPjeqMawn9LPpXeKDQv1E5nzyjEHd4e5liasfDaR"}
    # r = requests.get(url, params=params)
    # anwser_dict = r.json()["foodNutrients"]
    # print(produkts[i]["Produkt"])

#     here_fats = 0
#     here_protein = 0
#     here_energy = 0
#     here_carbohydrates = 0

#     for el in anwser_dict:
#         if el["nutrient"]['id'] == 1004:
#             here_fats = el["amount"]
#         elif el["nutrient"]['id'] == 1003:
#             here_protein = el["amount"]
#         elif el["nutrient"]['id'] == 1008:
#             here_energy = el["amount"]
#         elif el["nutrient"]['id'] == 1005:
#             here_carbohydrates = el["amount"]

#     produkts[i]["Energia(kcal)"] = here_energy
#     produkts[i]["Bialko"] = here_protein
#     produkts[i]["Tluszcze"] = here_fats
#     produkts[i]["Weglowodany"] = here_carbohydrates





# csv_columns = ['Produkt', "zuzycie_wody_na_kg", "Energia(kcal)", "Bialko", "Tluszcze", "Weglowodany"]
# csv_file = "water_footprint_nowy.csv"
# try:
#     with open(csv_file, 'w') as csvfile:
#         writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
#         writer.writeheader()
#         for data in produkts:
#             writer.writerow(data)
# except IOError:
#     print("I/O error")

# #=======================================================poprawka===========================================
# #poprawka aby w pliku było zużycie wody na 100 g

# with open("water_footprint_nowy.csv", newline='') as csvfile:
#     reader = csv.DictReader(csvfile)
#     produkts = []
#     for row in reader:
#         produkts.append(row)

# for el in produkts:
#     el["zuzycie_wody_na_100_g"] = float(el["zuzycie_wody_na_kg"])/10 
#     del(el["zuzycie_wody_na_kg"])

# csv_columns = ['Produkt', "zuzycie_wody_na_100_g", "Energia(kcal)", "Bialko", "Tluszcze", "Weglowodany"]
# csv_file = "water_footprint_nowy2.csv"
# try:
#     with open(csv_file, 'w') as csvfile:
#         writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
#         writer.writeheader()
#         for data in produkts:
#             writer.writerow(data)
# except IOError:
#     print("I/O error")