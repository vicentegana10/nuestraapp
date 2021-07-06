from numpy import random
from datetime import datetime, timedelta

def get_random_date(year, days_stay):
    try:
        date1 = datetime.strptime('{} {}'.format(random.randint(1, 366), year), '%j %Y')
        date2 = date1- timedelta(days=days_stay)
        return [str(date1.date()), str(date2.date())]
    except ValueError:
        get_random_date(year)

def create_reviews(n):
    # r1 = Review.create(rate:5, description: 'nice place')
    review_descriptions_file = open("files/review_descriptions.txt", encoding='utf-8')
    review_descriptions_list = []
    for x in review_descriptions_file:
        x = x.strip().replace('"','')
        x.replace("'","")
        review_descriptions_list.append(x)
    review_descriptions_file.close()
    reviews_list = []
    for x in range(n):
        rate = random.randint(1, 6)
        review = ("r" + str(x+1) + " = Review.create(rate:" + str(rate) + ", description: '" + random.choice(review_descriptions_list)  + "')")
        reviews_list.append(review)

    return reviews_list

def create_services():
    # ser1 =   Service.create(kind:1 )
    services_list = []
    for x in range(18):
        service = ("ser" + str(x+1) + " = Service.create(kind:" + str(x+1) + ")")
        services_list.append(service)

    return services_list

def create_users(n):
    # user1 = User.create(name: 'Juan Perez', email: 'jperez1@gmail.com', location: 'Las Condes', bio: 'im juan', role: 1)
    first_names_file = open("files/first_names.txt", encoding='utf-8')
    first_names_list = []
    for x in first_names_file:
        x = x.strip()
        first_names_list.append(x)
    first_names_file.close()

    last_names_file = open("files/last_names.txt", encoding='utf-8')
    last_names_list = []
    for x in last_names_file:
        x = x.strip()
        last_names_list.append(x)
    last_names_file.close()

    emails_file = open("files/emails.txt", encoding='utf-8')
    emails_list = []
    for x in emails_file:
        x = x.strip()
        emails_list.append(x)
    emails_file.close()

    locations_file = open("files/locations.txt", encoding='utf-8')
    locations_list = []
    for x in locations_file:
        x = x.strip()
        locations_list.append(x)
    locations_file.close()

    bios_file = open("files/bios.txt", encoding='utf-8')
    bios_list = []
    for x in bios_file:
        x = x.strip()
        bios_list.append(x)
    bios_file.close()

    users_list = []
    for x in range(n):
        password = ""
        for y in range(8):
            password += str(random.randint(1, 9))
        role = random.randint(1,101)
        if role > 95:
            role = 2
        else:
            role = 1
        emailRandom = str(random.randint(1, 999))
        emailUser = ""
        emailChosed = random.choice(emails_list)
        for letra in range(len(emailChosed)):
            if letra == 3:
                emailUser += emailRandom
            emailUser += emailChosed[letra]

        user = ("user" + str(x+1) + " = User.create(name: '" + random.choice(first_names_list) + " " +
                random.choice(last_names_list) + "', email: '" + emailUser +
                "', location: '" + random.choice(locations_list)+ "', bio: '" + random.choice(bios_list) + "', role: " + str(role) +
                ", password: '" + password + "' )")
        users_list.append(user)
    return users_list

def create_messages(n, n_users):
    #m1 = Message.create(text:"hola", status:1, recipient:user1, sender:user2)
    bios_file = open("files/bios.txt", encoding='utf-8')
    bios_list = []
    for x in bios_file:
        x = x.strip()
        bios_list.append(x)
    bios_file.close()
    messages_list = []
    for x in range(n):
        status = random.randint(1,101)
        if status > 80:
            status = 2
        else:
            status = 1
        sender = random.randint(1, n_users+1)
        while True:
            recipient = random.randint(1, n_users+1)
            if recipient != sender:
                break
        message = ("m" + str(x+1) + " = Message.create(text: '" + random.choice(bios_list) + "', status: "
        + str(status) + ", recipient: user" + str(recipient) + ", sender: user" + str(sender) + ")")
        messages_list.append(message)
    return messages_list


def create_lodgings(n, n_users):
    lodgings_list = []
    lodgings_file = open("files/lodgings.txt", encoding='utf-8')
    adjetives_file = open("files/adjetives.txt", encoding='utf-8')
    nouns_file = open("files/nouns.txt", encoding='utf-8')
    locations_file = open("files/locations.txt", encoding='utf-8')

    nouns = []
    for x in nouns_file:
        x = x.strip()
        nouns.append(x)

    adjetives = []
    for x in adjetives_file:
        x = x.strip()
        adjetives.append(x)

    lodgings = []
    for x in lodgings_file:
        x = x.strip()
        lodgings.append(x)

    locations_list = []
    for x in locations_file:
        x = x.strip()
        locations_list.append(x)
    locations_file.close()

    numbers = ["one", "two", "three", "four", "five", "six", "seven"]

    for lod in range(n):

        lodging = random.choice(lodgings)
        number = random.choice(numbers)
        fee = random.randint(1, 1000)
        location = random.choice(locations_list)
        policy = str(random.randint(25, 51)) + "% or " + str(random.randint(51, 100)) + "% " + str(
            random.randint(2, 15)) + " days before"
        user = "user" + str(random.randint(1, n_users + 1))
        services_list = []
        for x in range(1, 18):
            services_list.append("ser" + str(x))
        random.shuffle(services_list)
        services = "["
        for x in range(random.randint(1, 18)):
            services += (services_list[x] + ", ")
        services = services[:-2]
        services += "]"

        if number == "one":
            title = (
                        lodging + " one room")  # + ";" +  "one room in " + x + " with " + random.choice(adjetives) + " " + random.choice(nouns) + "\n")
            description = "one room in " + lodging + " with " + random.choice(adjetives) + " " + random.choice(nouns)
        else:
            title = (
                        lodging + " " + number + " rooms")  # + ";" +  number + " rooms in " + x + " with " + random.choice(adjetives) + " " + random.choice(nouns) + "\n")
            description = number + " rooms in " + lodging + " with " + random.choice(adjetives) + " " + random.choice(
                nouns)

        new_lodging = ("lod" + str(lod + 1) + " = Lodging.create(title: '" + title + "', fee:" + str(
            fee) + ", location: '" + location + "', policy: '" + policy + "', description: '" + description + "', user: " + user + ", services: " + services + ")")
        lodgings_list.append(new_lodging)

    lodgings_file.close()
    adjetives_file.close()
    nouns_file.close()
    locations_file.close()

    return lodgings_list

def create_stays(n, n_users, n_lodgings, n_reviews):
    stays = []
    reviews_list = []
    for x in range(n_reviews):
        reviews_list.append(x+1)
    for x in range(n):
        #st1 = Stay.create(user: user7, lodging: lod5, review: r2, check_in: '2021-01-03', check_out: '2021-01-09' )
        days = get_random_date(random.randint(2000, 2021), random.randint(2, 15))
        if len(reviews_list) > 0:
            rev = random.choice(reviews_list)
            reviews_list.remove(rev)
            stay = ("st" + str(x + 1) + " = Stay.create(user: user" + str(random.randint(1, n_users+1)) + ", lodging: lod" +
            str(random.randint(1, n_lodgings + 1)) + ", review: r" + str(rev) + ", check_in: '" + days[1] + "', check_out: '" + days[0] + "' )")
        else:
            stay = ("st" + str(x + 1) + " = Stay.create(user: user" + str(random.randint(1, n_users + 1)) + ", lodging: lod" +
            str(random.randint(1, n_lodgings + 1)) + ", check_in: '" + days[1] + "', check_out: '" + days[0] + "' )")

        stays.append(stay)
    return stays

def create_reservations(n, n_users, n_lodgings):
    reservations = []
    for x in range(n):
        #res1 = Reservation.create(user: user3, lodging: lod5, check_in: '2019-07-28', check_out: '2019-08-09')
        days = get_random_date(random.randint(2000, 2021), random.randint(2, 15))
        reservation = ("res" + str(x + 1) + " = Reservation.create(user: user" + str(random.randint(1, n_users+1)) +
         ", lodging: lod" + str(random.randint(1, n_lodgings + 1)) + ", check_in: '" + days[1] + "', check_out: '" + days[0] + "' )")

        reservations.append(reservation)
    return reservations

def start(n_users, n_lodgings, n_stays, n_reviews, n_reservations, n_messages):
    data_file = open("../seeds.rb", "w", encoding='utf-8' ) # db/seeds.rb
    data_file.write("\n#Reviews\n")
    for x in create_reviews(n_reviews):
        data_file.write(x + "\n")
    data_file.write("\n#Services\n")
    for x in create_services():
        data_file.write(x + "\n")
    data_file.write("\n#Users\n")
    for x in create_users(n_users):
        data_file.write(x + "\n")
    data_file.write("\n#Messages\n")
    for x in create_messages(n_messages, n_users):
        data_file.write(x + "\n")
    data_file.write("\n#Lodgings\n")
    for x in create_lodgings(n_lodgings, n_users):
        data_file.write(x + "\n")
    data_file.write("\n#Stays\n")
    for x in create_stays(n_stays, n_users, n_lodgings, n_reviews):
        data_file.write(x + "\n")
    data_file.write("\n#Reservations\n")
    for x in create_reservations(n_reservations, n_users, n_lodgings):
        data_file.write(x + "\n")

    successfull_writting = "\nputs('Seeds.rb successfully upload')\n"
    data_file.write(successfull_writting)

    data_file.close()
    print("End of writting")

n_users = int(input("Number of users: "))
n_lodgings = int(input("Number of lodgings: "))
n_stays = int(input("Number of stays: "))
n_reservations = int(input("Number of reservations: "))
n_messages = int(input("Number of messages: "))

while True:
    n_reviews = int(input("Number of reviews: "))
    if n_reviews > n_stays:
        print("Error, number of reviews must be less or same than stays")
    else:
        break

start(n_users, n_lodgings, n_stays, n_reviews, n_reservations, n_messages)