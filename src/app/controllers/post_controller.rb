class PostController < BaseController

	before_filter :get_post, only: ['show', 'edit', 'delele']
	
	def index
		@posts = Post.all	
	end

	def show
		
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(permit_param)
		if @post.save
			flash[:notice] = 'create success'
			redirect_to @post
		else
			render action: 'new'
		end
	end

	def edit
		
	end

	def update
		@post.attributes = params[:post]
		if @post.save
			flash[:notice] = 'update success'
			redirect_to @post
		else
			render action: 'new'
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = 'delete success!'
		redirect_to :index
	end

	private
	def permit_param
		params.require(:post).premit!
	end

	def get_post
		@post = Post.find_by(id: params[:id])
		if @post.present?
			flash[:error] = 'Post not found'
			redirect_to_back and return
		end
	end
end
