namespace :db do
  task :model_queries => :environment do
    puts("Query 0: Random User and Lodging for the rest of queries")
    users_count = User.all.count
    user_id_example = rand(1..(users_count+1))
    lodgings_count = Lodging.all.count
    lodging_id_example = rand(1..(lodgings_count+1))
    result = User.find_by(id:user_id_example) #.select{|c| c.id.to_s + " " + c.name} # {|x| "id: " + x.id.to_s + ", name: " + x.name + ", email: " + x.email}
    puts("Random User = id: " + result.id.to_s + ", name: " + result.name + ", bio: " + result.bio)
    result = Lodging.find_by(id:lodging_id_example) #.map {|x| "id: " + x.id.to_s + ", title: " + x.title + ", location: " + x.location}
    puts("Random_Lodging = id: " + result.id.to_s + ", title: " + result.title + ", location: " + result.location)
    puts("EOQ","") # End Of Query -- always add this line after a query.


    query_1 = "Query 1\nGet all lodgings created by a user, for this example the user with id=" + user_id_example.to_s
    puts(query_1)
    result = User.find_by(id:user_id_example).lodgings.map { |x| "lodging_id:" + x.id.to_s + ", title: " + x.title }
    puts(result)
    puts("EOQ","")


    query_2 = "Query 2\nGet all users who have stayed in a location, for this example location with id=" + lodging_id_example.to_s
    puts(query_2)
    result = Lodging.find_by(id:lodging_id_example).stays.map {|x| "user_id:" + x.user.id.to_s + ", name: " +  x.user.name + ", check_in_date: " + x.check_in.to_s} # { |x| "id:" + x.user_id.to_s + ", name: " + User.find_by(id:x).name }
    puts(result)
    puts("EOQ","")

    query_3 = "Query 3\nGet all reservations related to a location, for this example location with id=" + lodging_id_example.to_s
    puts(query_3)
    result =  Lodging.find_by(id:lodging_id_example).reservations.map {|x| "user: " + x.user.name + ", check_in: " + x.check_in.to_s + ", check_out: " +  x.check_out.to_s}
    puts(result)
    puts("EOQ","")

    query_4 = "Query 4\nGet all reviews of a given host"
    puts(query_4)
    result = "We only made guest reviews"
    puts(result)
    puts("EOQ","")

    query_5 = "Query 5\nGet all reviews of a given guest, for this example user with id=" + user_id_example.to_s
    puts(query_5)
    result = User.find_by(id:user_id_example).stays.select{|c| c.review != nil}.map {|x| "review_rate:" + x.review.rate.to_s + ", description: " + x.review.description}
    puts(result)
    puts("EOQ","")

    query_6 = "Query 6\nGet the average rating of a location, for this example lodging with id=" + lodging_id_example.to_s
    puts(query_6)
    result = Lodging.find_by(id:lodging_id_example).stays.select{|c| c.review != nil}.map {|x| x.review.rate}
    #puts(result)

    avg_rate = 0
    for x in result do
      avg_rate += x
    end
    if result.length() > 0
      avg_rate = "avg_rate: " + ((avg_rate.to_f / result.length().to_f).to_s)
    else
      avg_rate = "0 reviews, no avg_rate"
    end

    puts(avg_rate)
    puts("EOQ","")

    query_7 = "Query 7\nGet all messages in a user’s inbox, for this example the user with id=" + user_id_example.to_s
    puts(query_7)
    result = Message.all.where("recipient_id = ? and status = 2", user_id_example).map {|x| "message_id: " + x.id.to_s + ", sender_id: " + x.sender_id.to_s + ", text: " + x.text}
    puts(result)
    puts("EOQ","")

    query_8 = "Query 8\nGet all messages sent by a user to other users, for this example the user with id=" + user_id_example.to_s
    puts(query_8)
    result = Message.all.where("sender_id = ?", user_id_example).map {|x| "message_id: " + x.id.to_s + ", recipient_id: " + x.recipient_id.to_s + ", status: "+ x.status.to_s + ", text: " + x.text}
    puts(result)
    puts("EOQ","")

    query_9 = "Query 9\nGet all users with administrative privileges in the system."
    puts(query_9)
    result = User.all.where("role = 2").map {|x| "user_id:" + x.id.to_s + ", name: " + x.name}
    puts(result)
    puts("EOQ","")
    query_10 = "Query 10\nCreate a user with the same email that User.first."
    puts(query_10)
    user_1_email = User.first.email
    begin
      User.create!(name: 'Javier Soto', email: user_1_email, location: 'Lo Barnechea', bio: 'I love to copy emails.', role: 1)

    rescue => e
      puts(e.message)
    end
    puts("EOQ","")

    query_11 = "Query 11\nCreate a user with email not well-formed."
    puts(query_11)

    begin
      User.create!(name: 'Vicente Gana', email: 'vganagmail.com', location: 'Lo Barnechea', bio: 'A 21 years old idiot that does not know how to write his email.', role: 1)

    rescue => e
      puts(e.message)
    end
    puts("EOQ","")

    #User.first.destroy
    #Lodging.first.destroy



  end
end
