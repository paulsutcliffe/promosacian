# coding: utf-8
class ContactosController < InheritedResources::Base
  actions :all, :except => [ :show, :edit, :update]
  before_filter :authenticate_admin!, :except => [:terminos, :new, :create]

  before_filter :detect_pais

  def detect_pais
    @country_code = request.location.country_code
    case @country_code
    when "PE"
      @pais = 'Perú'
    when "BO"
      @pais = 'Bolivia'
    when "CR"
      @pais = 'Costa Rica'
    else
      @pais = 'Perú'
    end
  end

  def index
    @contactos = Contacto.order(:created_at).reverse_order.paginate(:page => params[:page], :per_page => 100)

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
        case @contacto.pais
        when 'bo'
          ContactosMailer.contact_registration_bo(@contacto).deliver
          ContactosMailer.contact_confirmation_bo(@contacto).deliver
        when 'pe'
          ContactosMailer.contact_registration_pe(@contacto).deliver
          ContactosMailer.contact_confirmation_pe(@contacto).deliver
        when 'cr'
          ContactosMailer.contact_registration_cr(@contacto).deliver
          ContactosMailer.contact_confirmation_cr(@contacto).deliver
        end

        flash[:notice] = "Gracias por participar, pronto nos estaremos comunicando contigo para programar la consulta."
        redirect_to root_path
      end

      failure.html do
        flash[:notice] = "No se envió el mensaje, corrige los campos y vuelve a intentar."
        render :action => "new"
      end

    end
  end

  def terminos

  end

  protected
    def collection
      @contactos ||= end_of_association_chain.paginate(:page => params[:page], :per_page => 1)
    end
end
