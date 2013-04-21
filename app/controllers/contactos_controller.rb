# coding: utf-8
class ContactosController < InheritedResources::Base
  actions :all, :except => [ :show, :edit, :update ]
  before_filter :authenticate_admin!, :except => [:new, :create]
  
  def index
    @contactos = Contacto.order(:created_at)

    filename = "contactos_sacian_" + Date.today.strftime("%b%m%Y").gsub(/[^0-9a-z]/, "_") + ".csv"

    respond_to do |format|
      format.html
      format.csv { send_data @contactos.to_csv, :type => 'text/csv; charset=utf-8; header=present',
      :filename => filename }
    end

  end

  def create
    @contacto = Contacto.new(params[:contacto])

    create! do |success, failure|
      success.html do
        ContactosMailer.confirmacion_de_contacto(@contacto).deliver
        ContactosMailer.notificacion_de_contacto(@contacto).deliver

        flash[:notice] = "Tu mensaje fue enviado con exito."
        redirect_to root_path
      end

      failure.html do
        flash[:notice] = "No se envió el mensaje, corrige los campos y vuelve a intentar."
        render :action => "new"
      end

    end
  end

  protected
    def collection
      @contactos ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 10)
    end
end
