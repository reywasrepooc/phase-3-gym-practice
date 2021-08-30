class Gym < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships

  def join_gym(member, start_year, start_month)
    Membership.create(member: member, start_year: start_year, start_month: start_month, gym: self)
  end

  def print_all_memberships
    memberships.each { |membership| membership.print_membership }
  end

  def first_member
    members.order(:start_year).first
  end

#   def self.best_value
    
#   end

end
