class Admins::ContactsController < Admins::ApplicationController
  before_action :authenticate_admin!

  def index
    @side_user = User.find(params[:user_id])
    contacts = Contact.where(user_id: @side_user.id)
  	@contacts = contacts.page(params[:page])
  	#@new_contact =Contact.new
  end

  def show
    @side_user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
  	#@new_contact =Contact.new
  end

  # def create
  # 	user = User.find(params[:user_id])
  # 	#contact = user.contacts.build(contact_params)
  # 	contact.save
  # 	redirect_to user_contacts_path
  # end

  def update
    contact = Contact.find(params[:id])
    contact.update(reply_params)
    redirect_to admins_admin_contact_path(admin_id: current_admin.id, id: contact.id)
  end

  def list
    @contacts = Contact.page(params[:page])
  end

 private

  def contact_params
  	params.require(:contact).permit(:title, :content)
  end

  def reply_params
    params.require(:contact).permit(:reply)
  end
end
