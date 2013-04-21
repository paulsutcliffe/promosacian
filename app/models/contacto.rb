class Contacto < ActiveRecord::Base
  attr_accessible :email, :nombre, :telefono

  validates :email, :nombre, :telefono, :presence => true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |contacto|
        csv << contacto.attributes.values_at(*column_names)
      end
    end
  end

end
