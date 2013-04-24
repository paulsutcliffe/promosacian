# coding: utf-8
class Contacto < ActiveRecord::Base
  attr_accessible :email, :nombre, :telefono, :pais

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  PAISES = [["Perú", "pe"],
            ["Bolivia", "bo"],
            ["Costa Rica", "cr"],
            ["Guatemala", "gt"],
            ["El Salvador", "Ssv"],
            ["Uruguay", "uy"]]

  # validates_inclusion_of :pais, :in => PAISES

  validates :email, :nombre, :telefono, :presence => true

  validates :nombre, :length => { :maximum => 200 }
  validates :telefono, :length => { :maximum => 20 }
  validates :email, :length => { :maximum => 100 }, 
    :format => EMAIL_REGEX


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |contacto|
        csv << contacto.attributes.values_at(*column_names)
      end
    end
  end

end
