RailsClientChecker::Engine.routes.draw do
  get 'check' => 'checker#check'
  get 'set_cookie' => 'checker#set_cookie'
  get 'get_cookie' => 'checker#get_cookie'
end
