class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC") #全てのレコードを@postに代入
  end

  def create
    Post.create(content: params[:content], checked: false)
    render ison:{ post: post}
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
