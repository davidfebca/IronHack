class ContactsController < ApplicationController
  include Paperclip::Glue
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  def has_my_pattern(st)
    st =~ /VALID_EMAIL_REGEX/
  end
  def index
    @contacts =  Contact.order('name DESC')
  end
  def create
    email = params[:contact][:email]
    if params[:contact][:name].blank?
      #throw error
      redirect_to("/contacts")
      return;
    end
    if email.blank? || has_my_pattern(email) == false
      #throw error
      redirect_to("/contacts")
      return;
    end
    contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phone => params[:contact][:phone],
      :email => email,
      :image => params[:contact][:image])
      contact.save
      redirect_to("/contacts")
  end
  def details
    id = params[:id].to_i
    @contact = Contact.find id
    if @contact.blank?
      #we should throw a 404 error
    end
  end
  def favorite
    id = params[:id].to_i
    contact = Contact.find id
    if contact.blank?
      #throw http 404 exception
    end
    contact.favorite = true
    contact.save
    redirect_to("/contacts")
  end
  def search
    text = params[:text]
    @contacts = Contact.where("name LIKE ?", text)
  end
end
