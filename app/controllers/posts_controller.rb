class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def like 
        @post = Post.find(params[:id])
        @post.increment!(:likes)
        redirect_to post_path(@post)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        puts @post.content.length
        if @post.valid?
            @post.update(likes: 0)
            redirect_to post_path(@post)
        else
            render "new"
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            render "edit"
        end
    end


    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end



end
