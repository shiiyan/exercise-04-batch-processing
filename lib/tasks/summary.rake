namespace :my_task do
	desc "Make a summary of `products` table and dump it into database"
	task :summary => :environment do
		summary = Summary.new

		time_range = (Time.now.midnight - 1.day)..Time.now.midnight
	  	summary.date = Time.now - 1.day
		
	  	products_created = Product.where(created_at: time_range)
	  	products_deleted = Product.where(deleted_at: time_range)

	  	name_list_created, name_list_deleted = '',''
	  	id_list_created, id_list_deleted = '',''

	  	# summaries yesterday's change of table `products`
	  	# created part
	  	if products_created
	  		summary.count_created = products_created.count
	  		products_created.each do |product|
	  			name_list_created += product.name.concat(',')
	  			id_list_created += product.id.to_s.concat(',')
	  		end

	  		summary.name_list_created = name_list_created.chomp(',')
	  		summary.id_list_created = id_list_created.chomp(',')
	  	else
	  		summary.count_created = 0
	  	end

	  	# deleted part
	  	if products_deleted
	    	summary.count_deleted = products_deleted.count

	  		products_deleted.each do |product|
	  			name_list_deleted += product.name.concat(',')
	  			id_list_deleted += product.id.to_s.concat(',')
	  		end

	  		summary.name_list_deleted = name_list_deleted.chomp(',')
	  		summary.id_list_deleted = id_list_deleted.chomp(',')
	  	else
	  		summary.count_deleted = 0
	  	end

		if summary.save
			puts "OK"
		else
			puts "Saving Failed"
		end
	end
end