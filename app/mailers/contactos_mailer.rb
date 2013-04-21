# coding: utf-8
class ContactosMailer < ActionMailer::Base
  default :from => "info@sacian.com"

  def confirmacion_de_contacto(contacto)
    @contacto = contacto
    mail(:to => "info@sacian.com", :subject => "Mensaje desde la web")
  end

  def notificacion_de_contacto(contacto)
    @contacto = contacto
    mail(:to => contacto.email, :reply_to => contacto.email, :subject => "Mensaje Enviado Sacián")
  end
end
