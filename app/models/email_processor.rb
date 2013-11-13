class EmailProcessor < ActiveRecord::Base
   def self.process(email)
      
      subject_parse = email.subject.to_s
      string_parse = email.raw_body

      if subject_parse.match(/(The Plan)/)
         plan = Plan.new 
         # Rails.logger.warn(string_parse)    
         Rails.logger.warn(string_parse.match(/^(Day(\S|\s)+)^#/).to_s)
         # plan.content = string_parse.match(/^(Day(\S|\s)+)^#/).to_s
         # Rails.logger.warn(plan.content)       
         plan.save
      end

      if subject_parse.match(/(HW|hw|Hw|Homework|lab|Lab)/)
         assignment = Assignment.new
         # string_parse.match(/(https*:\/\/github.com\/(flatiron-school\/([\w-]+)))/)
         url, full_name, name = string_parse.match(/(https*:\/\/github.com\/(flatiron-school\/([\w-]+)))/).captures
         assignment.name = name.to_s #bare repo name
         assignment.url = url.to_s #url for flatiron fork
         assignment.full_name = full_name.to_s #repo name with org
         assignment.instructor = (string_parse.match(/Avi Flombaum|Scott C. Reynolds|Jonathan Grover|Spencer Rogers/)).to_s
         assignment.save
      end
   end
end


