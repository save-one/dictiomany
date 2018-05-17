class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  	@new_contact =Contact.new
  end

  def show
  	@new_contact =Contact.new
  end

  def create
  	user = User.find(params[:user_id])
  	contact = user.contacts.build(contact_params)
  	contact.save
  	redirect_to user_contacts_path
  end

 private

  def contact_params
  	params.require(:contact).permit(:title, :content)
  end
end
