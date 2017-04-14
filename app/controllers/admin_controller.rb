class AdminController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret"
end