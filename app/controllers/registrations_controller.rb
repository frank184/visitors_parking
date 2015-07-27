class RegistrationsController < Devise::RegistrationsController
  before_destroy :unpaid_bill

  def destroy
    if unpaid_bill?
      user.errors.add("Cannot terminate account without paying all of your parkings")
    end
  end

  private

  def unpaid_bill
    unpaid = false

    current_user.vehicles.each do |v|
      if !v.paid?
        unpaid_bill = true
      end
    end

    return unpaid
  end

end
