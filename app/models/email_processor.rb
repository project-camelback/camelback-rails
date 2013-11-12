class EmailProcessor < ActiveRecord::Base
   def self.process(email)

      assignment = Assignment.new
      string = email.body
      url, full_name, name = string.match(/(https*:\/\/github.com\/(flatiron-school\/([\w-]+)))/).captures
      assignment.name = name #bare repo name
      assignment.url = url #url for flatiron fork
      assignment.full_name = full_name #repo name with org
      assignment.save

      #  if email.subject.include? "The Plan"
      #   plan = Plan.new
      #   plan.header = email.subject
      #   plan.content = email.body
      #   plan.save
      # end
      # if email.subject.include?("Lab" || "lab" || "HW")
      # end
   end
end


