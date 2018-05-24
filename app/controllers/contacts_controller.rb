class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    contacts = Contact.where(user_id: @user.id)
  	@contacts = contacts.page(params[:page])
  	@new_contact =Contact.new
  end

  def show
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
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
