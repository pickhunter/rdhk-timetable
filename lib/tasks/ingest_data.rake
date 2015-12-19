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