require 'spec_helper'

describe Contacto do
  it "has a valid factory" do
    expect(create(:contacto)).to be_valid
  end

  it "is valid with nombre, email y telefono" do
    expect(build(:contacto)).to be_valid
  end
  it "is invalid without nombre" do
    expect(build(:contacto, nombre: nil)).to \
      have(1).errors_on(:nombre)
  end
  it "is invalid without an email address" do
    expect(build(:contacto, email: nil)).to  \
      have(2).errors_on(:email)
  end
  it "is invalid without telefono" do
    expect(build(:contacto, telefono: nil)).to \
      have(1).errors_on(:telefono)
  end
end
