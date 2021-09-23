Rails.application.routes.draw do
  resources :courses, only: [:index, :create]

  post "/signuppro", to: "professors#create"
  post "/signupstu", to: "students#create"

  get "/mepro", to: "professors#show"
  get "/mestu", to: "students#show"
  delete "/destroy", to: "courses#destroy"


  post "/loginprofessor", to: "sessions#createprofessor"
  post "/loginstudent", to: "sessions#createstudent"

  delete "/logoutpro", to: "sessions#destroyprofessor"
  delete "/logoutstu", to: "sessions#destroystudent"

end
