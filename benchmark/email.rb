class Email
  include Comparable

  attr_reader :domain, :local

  def initialize(email)
    @local, @domain = email.split(?@)
  end

  def <=>(other)
    order = domain <=> other.domain
    return order unless order == 0
    local <=> other.domain
  end
end
