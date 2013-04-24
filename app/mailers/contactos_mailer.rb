# coding: utf-8
class ContactosMailer < ActionMailer::Base
  default :from => "info@sacian.com"

  def contact_confirmation(contact)
    @contacto = contact
    mail(:to => "#{contact.nombre} <#{contact.email}>", :reply_to => contact.email, :subject => "SACIAN")
  end
  
  def contact_registration_uy(contact)
    @contacto = contact
    mail(:to => "lainuru@montevideo.com.uy", :subject => "Mensaje desde la web de SACIAN Uruguay")
  end
  
  def contact_registration_bo(contact)
    @contacto = contact
    mail(:to => "lain1004scz@entelnet.bo", :subject => "Mensaje desde la web de SACIAN Bolivia")
  end
  
  def contact_registration_cr(contact)
    @contacto = contact
    mail(:to => "laincr@racsa.co.cr", :subject => "Mensaje desde la web de SACIAN Costa Rica")
  end
  
  def contact_registration_gt(contact)
    @contacto = contact
    mail(:to => "lessguatemala@terra.com.gt", :subject => "Mensaje desde la web de SACIAN Guatemala")
  end
  
  def contact_registration_pe(contact)
    @contacto = contact
    mail(:to => "contacto@lainadelgaza.net", :subject => "Mensaje desde la web de SACIAN Perú")
  end
  
  def contact_registration_sv(contact)
    @contacto = contact
    mail(:to => "lainelsalvador@amnetsal.com", :subject => "Mensaje desde la web de SACIAN El Salvador")
  end

end
