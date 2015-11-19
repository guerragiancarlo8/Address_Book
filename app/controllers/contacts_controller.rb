class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(created_at: :desc).all
	end
	def new
		render 'new'
	end

	def show
		@contact = Contact.find(params[:id])

	end

	def create
		contact = Contact.new(
			:name => params[:contact][:name],
			:address => params[:contact][:address],
			:phone_number => params[:contact][:phone_number],
			:email_address => params[:contact][:email_address])

		if contact.valid?
			contact.save
		else
			redirect_to("/contacts/index")
		end
		redirect_to("/contacts/index")
	end
end

