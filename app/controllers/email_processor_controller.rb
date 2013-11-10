class EmailProcessorController < ApplicationController

  def create
      Rails.logger.info params
      email = EmailProcessor.new(
        :to => params[:envelope][:to],
        :from => params[:envelope][:from],
        :subject => params[:headers]['Subject'],
        :body => params[:plain]
      )
      # if email.save
      #   render :text => 'Success', :status => 200
      # else
      #   render :text => email.errors.full_messages, :status => 422, :content_type => Mime::TEXT.to_s
      # end
  end
end