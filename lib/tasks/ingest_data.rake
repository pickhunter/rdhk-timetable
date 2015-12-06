require 'rubygems'
require 'roo'

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