class Login
  include ActiveAttr::BasicModel
  include ActiveAttr::MassAssignment
  attr_accessor :email, :password
end
