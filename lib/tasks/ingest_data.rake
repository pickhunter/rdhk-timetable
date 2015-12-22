require 'rubygems'
require 'roo'


task :ingest_timeslots  => :environment do
		Timeslot.transaction do
	Timeslot.destroy_all
	end
	 ex = Roo::Excel.new("./public/timeslots.xls")
		
	    # ex.default_sheet = ex.sheets[0] #Mention the sheet number
	    # puts s
	    # puts ex.sheets	
	    # puts Time.now - Time.now.seconds_since_midnight + 1.seconds + 9.hours
	    ex.default_sheet = ex.sheets[0]
	    (1..ex.last_row).each do |line| #start and end of row
	    day = ex.cell(line,'A')
	    starthour = ex.cell(line,'B')

	    starttime = Time.now - Time.now.seconds_since_midnight + 1.seconds + starthour.hours + 5.hours + 30.minutes
	    puts starttime
	    endtime= starttime + 1.hours      

	    @timeslot = Timeslot.create(:day => day,:starttime => starttime, :endtime => endtime)

	    end  
end

task :ingest_rooms  => :environment do
		Room.transaction do
	Room.destroy_all
	end
	 ex = Roo::Excel.new("./public/rooms.xls")
		
	    # ex.default_sheet = ex.sheets[0] #Mention the sheet number
	    # puts s
	    # puts ex.sheets	
	    # puts Time.now - Time.now.seconds_since_midnight + 1.seconds + 9.hours
	    ex.default_sheet = ex.sheets[0]
	    (1..ex.last_row).each do |line| #start and end of row
	    name = ex.cell(line,'A')
	    type1 = ex.cell(line,'B')
	    puts name   

	    @room = Room.create(:name => name,:room_type => type1)

	    end  
end

task :ingest_teacher  => :environment do
	 ex = Roo::Excel.new("./public/teachers.xls")
	(0..5).each do |s|
		
	    # ex.default_sheet = ex.sheets[0] #Mention the sheet number
	    # puts s
	    # puts ex.sheets	
	    ex.default_sheet = ex.sheets[s]
	    (1..ex.last_row).each do |line| #start and end of row
	    code = ex.cell(line,'A')
	    name = ex.cell(line,'B')         

	    @teacher = Teacher.create(:code => code,:name => name)
	    @dept = Department.find_by(:code => ex.sheets[s])
	    @dept.teachers << @teacher

	    end
	 end   
end

task :ingest_subject  => :environment do
	 ex = Roo::Excel.new("./public/subjects.xls")
	(0..5).each do |s|
		
	    # ex.default_sheet = ex.sheets[0] #Mention the sheet number
	    puts s
	    # puts ex.sheets	
	    ex.default_sheet = ex.sheets[s]
	    (1..ex.last_row).each do |line| #start and end of row
	    code = ex.cell(line,'A')
	    name = ex.cell(line,'B')   
	    sem = ex.cell(line,'C')  
	    type = "lec"    

	    @subject = Subject.create(:code => code,:name => name, :semester => sem, :sub_type => type)
	    @dept = Department.find_by(:code => ex.sheets[s])
	    @dept.subjects << @subject

	    end
	 end   
end

task :ingest_batches  => :environment do

	Batch.transaction do
	Batch.destroy_all
	BatchSubject.destroy_all
	end

	sub1 = Subject.find_by_code("HS111")
	sub2 = Subject.find_by_code("MA111")
	sub3 = Subject.find_by_code("PH111")
	sub4 = Subject.find_by_code("EC111")
	sub5 = Subject.find_by_code("CI111")
	sub6 = Subject.find_by_code("MA112")
	sub7 = Subject.find_by_code("PH112")

	 ex = Roo::Excel.new("./public/batches.xls")
	# (0..5).each do |s|
		
	    ex.default_sheet = ex.sheets[0] #Mention the sheet number
	    # puts s
	    # puts ex.sheets	
	    # ex.default_sheet = ex.sheets[s]
	    (1..ex.last_row).each do |line| #start and end of row
	    code = ex.cell(line,'A')
	    year = ex.cell(line,'B')     

	    batch = Batch.create(:name => code,:year => year)
		    if(line >= 0 && line<=19)
		    batch.subjects << sub1
		    batch.subjects << sub2
		    batch.subjects << sub3
		    batch.subjects << sub4
		    batch.subjects << sub5
			elsif (line>=20 && line<=23)
		    batch.subjects << sub1
		    batch.subjects << sub6
		    batch.subjects << sub7
		    batch.subjects << sub4
		    batch.subjects << sub5
			end


	    end
	 # end   
end


task :ingest_batches2  => :environment do


	sub1 = Subject.find_by_code("PD311")
	sub2 = Subject.find_by_code("MA201")
	sub3 = Subject.find_by_code("CI311")
	sub4 = Subject.find_by_code("EC314")
	sub5 = Subject.find_by_code("CI312")
	sub6 = Subject.find_by_code("CI313")
	sub7 = Subject.find_by_code("MA301")
	sub8 = Subject.find_by_code("EC311")
	sub9 = Subject.find_by_code("EC312")
	sub10 = Subject.find_by_code("EC313")
	sub11 = Subject.find_by_code("EC315")
	sub12 = Subject.find_by_code("10BT312")
	sub13 = Subject.find_by_code("BT311")
	sub14 = Subject.find_by_code("BT313")
	sub15 = Subject.find_by_code("GE301")
	sub16 = Subject.find_by_code("15BT312")

	 ex = Roo::Excel.new("./public/batches2.xls")
	# (0..5).each do |s|
		
	    ex.default_sheet = ex.sheets[0] #Mention the sheet number
	    # puts s
	    # puts ex.sheets	
	    # ex.default_sheet = ex.sheets[s]
	    (1..ex.last_row).each do |line| #start and end of row
	    code = ex.cell(line,'A')
	    year = ex.cell(line,'B')     

	    batch = Batch.find_by_name(code)
		    if(line >= 7 && line<=19)
		    batch.subjects << sub1
		    batch.subjects << sub2
		    batch.subjects << sub3
		    batch.subjects << sub4
		    batch.subjects << sub5
		    batch.subjects << sub6
			elsif (line>=1 && line<=6)
		    batch.subjects << sub1
		    batch.subjects << sub7
		    batch.subjects << sub8
		    batch.subjects << sub9
		    batch.subjects << sub10
		    batch.subjects << sub11
			elsif (line>=20 && line<=23)
			batch.subjects << sub1
		    batch.subjects << sub12
		    batch.subjects << sub13
		    batch.subjects << sub14
		    batch.subjects << sub15
		    batch.subjects << sub16
			end


	    end
	 # end   
end


task :ingest_batches3  => :environment do


	sub1 = Subject.find_by_code("PD511")
	sub2 = Subject.find_by_code("CI511")
	sub3 = Subject.find_by_code("CI512")
	sub4 = Subject.find_by_code("CI513")
	sub5 = Subject.find_by_code("EC514")
	sub6 = Subject.find_by_code("CI521")
	sub7 = Subject.find_by_code("CI401")
	sub8 = Subject.find_by_code("EC511")
	sub9 = Subject.find_by_code("EC512")
	sub10 = Subject.find_by_code("EC513")
	sub11 = Subject.find_by_code("BT511")
	sub12 = Subject.find_by_code("BT512")
	sub13 = Subject.find_by_code("BT513")
	sub14 = Subject.find_by_code("BT514")

	 ex = Roo::Excel.new("./public/batches3.xls")	
	# (0..5).each do |s|
		
	    ex.default_sheet = ex.sheets[0] #Mention the sheet number
	    # puts s
	    # puts ex.sheets	
	    # ex.default_sheet = ex.sheets[s]
	    (1..ex.last_row).each do |line| #start and end of row
	    code = ex.cell(line,'A')
	    year = ex.cell(line,'B')     

	    batch = Batch.find_by_name(code)
		    if(line >= 7 && line<=14)
		    batch.subjects << sub1
		    batch.subjects << sub2
		    batch.subjects << sub3
		    batch.subjects << sub4
		    batch.subjects << sub5

			elsif (line>=15 && line<=19)
			batch.subjects << sub1
		    batch.subjects << sub2
		    batch.subjects << sub3
		    batch.subjects << sub6
		    batch.subjects << sub5

			elsif (line>=1 && line<=6)
		    batch.subjects << sub1
		    batch.subjects << sub7
		    batch.subjects << sub8
		    batch.subjects << sub9
		    batch.subjects << sub10
			elsif (line>=20 && line<=23)
			batch.subjects << sub1
			batch.subjects << sub11
		    batch.subjects << sub12
		    batch.subjects << sub13
		    batch.subjects << sub14

			end


	    end
	 # end   
end