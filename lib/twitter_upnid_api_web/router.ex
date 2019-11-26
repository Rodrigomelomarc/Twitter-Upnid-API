defmodule TwitterUpnidApiWeb.Router do
  use TwitterUpnidApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug TwitterUpnidApiWeb.Auth.Pipeline
  end

  scope "/api/v1", TwitterUpnidApiWeb do
    pipe_through :api
  
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api/v1", TwitterUpnidApiWeb do
    pipe_through [:api, :auth]
    
    resources "/tweets", TweetController, except: [:new, :edit, :update, :delete]
    post "/tweets/like/:id", TweetController, :like_tweet
    post "/tweets/retweet/:id", TweetController, :do_a_retweet
    get "/tweets/retweet/:id", TweetController, :show_tweet_and_list_retweets

    post "/answer/:id", AnswerController, :create
    post "/answer/like/:id", AnswerController, :like_a_answer
  end
end
