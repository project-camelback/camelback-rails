class EmailProcessor < ActiveRecord::Base
   def self.process(email)
      
      subject_parse = email.subject
      string_parse = email.body

      if subject_parse.match(/(The Plan)/)
         plan = Plan.new
         plan.content = string_parse.match(/^(Day(\S|\s)+)^#/)
         plan.save

      elsif subject_parse.match(/(HW|hw|lab|Lab|Hw)/)
         assignment = Assignment.new
         
         if string_parse.match(/(https*:\/\/github.com\/(flatiron-school\/([\w-]+)))/)
            url, full_name, name = string_parse.match(/(https*:\/\/github.com\/(flatiron-school\/([\w-]+)))/).captures
            assignment.name = name #bare repo name
            assignment.url = url #url for flatiron fork
            assignment.full_name = full_name #repo name with org
            assignment.save
         end
      end
   end
end


