class UsersController < ApplicationController
	def index
		@service = Service.find(params[:service_id])
		@users = @service.users.all

		respond_to do |format|
			format.html 	# index.html.erb
			format.json 	{ render :json => @users }
		end
	end

	def new
		@service = Service.find(params[:service_id])
		@user = @service.users.new

		respond_to do |format|
			format.html 	# new.html.erb
			format.json		{ render :json => @post }
		end
	end

	def create
		@service = Service.find(params[:service_id])
		@user = @service.users.create(params[:user])

		respond_to do |format|
			if @user.save
				StatsMix.track('New Signups', 1, {'Service' => @user.service.name})
				format.html 	{ redirect_to(@user, 
								  :notice => 'Post was succesfully created.') }
				format.json		{ render :json => @user,
								  :status => :created, :location => @user }
			else
				format.html 	{ render :action => "new" }
				format.json		{ render :json => @user.errors,
								  :status => :unprocessable_entity }
			end
		end
	end

	def show
		@service = Service.find(params[:service_id])
		@user = @service.users.find(params[:id])

		respond_to do |format|
			format.html 	# show.html.erb
			format.json		{ render :json => @user }
		end
	end

	def edit
		@service = Service.find(params[:service_id])
		@user = @service.users.find(params[:id])
	end

	def update
		@service = Service.find(params[:service_id])
		@user = @service.users.find(params[:id])

		respond_to do |format|
			if @user.update_attributes(params[:user])
				format.html 	{ redirect_to(@user,
								  :notice => 'User was successfully updated.') }
				format.json		{ render :json => {}, :status => :ok }
			else
				format.html 	{ render :action => "edit" }
				format.json		{ render :json => @user.errors,
								  :status => :unprocessable_entity }
			end
		end
	end

	def destroy
		@service = Service.find(params[:service_id])
		@user = @service.users.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :ok }
		end
	end
end
