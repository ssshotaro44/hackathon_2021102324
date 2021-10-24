Rails.application.routes.draw do
  get '/' => 'top#top'

  get 'topic/choose' => 'topic#choose'
  get 'topic/chose' => 'topic#chose'

  post 'topic/generate' => 'topic#generate'
end
