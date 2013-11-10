class EmailProcessor < ActiveRecord::Base
   def self.process(email)
     parse_email

    # all of your application-specific code here - creating models,
    # processing reports, etc
   end

   def parse_email
      if email.subject.include?("The Plan")
        plan = Plan.new
        plan.header = email.header
        plan.content = email.body
        plan.save
      end
      if email.subject.include?("Lab" || "lab" || "HW")
        assignment = Assignment.new
        assignment.name = email.header
        assignment.description = email.body
        assignment.save
      end
   end
end


