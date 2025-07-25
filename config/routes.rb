Rails.application.routes.draw do
  root "menu#index"
  post "menu/order", to: "menu#order", as: "place_order"
end