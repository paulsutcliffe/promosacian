# coding: utf-8
class ContactosMailer < ActionMailer::Base
  default :from => "sacian@lainadelgaza.net"

  def contact_confirmation(contact)
    @contacto = contact
    mail(:to => "#{contact.nombre} <#{contact.email}>", :reply_to => contact.email, :subject => "SACIAN")
  end

  def contact_registration_bo(contact)
    @contacto = contact
    mail(:to => "lain1004scz@entelnet.bo", :subject => "Mensaje desde la web de SACIAN Bolivia")
  end

  def contact_registration_cr(contact)
    @contacto = contact
    mail(:to => "contactoweb.cr@laininternacional.com", :subject => "Mensaje desde la web de SACIAN Costa Rica")
  end

  def contact_registration_pe(contact)
    @contacto = contact
    mail(:to => "contacto@lainadelgaza.net", :subject => "Mensaje desde la web de SACIAN Perú")
  end

end
