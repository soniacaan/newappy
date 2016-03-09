class MicropostsController < ApplicationController


  before_filter :admin_user, only: [:destroy, :edit, :update, :create, :new]


# GET /microposts
  # GET /microposts.json
  def index

    @microposts = Micropost.paginate(page: params[:page])
   
  end

  def show
      @micropost = Micropost.find(params[:id])
     
   


       respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @micropost }
        end
  end

  # GET /microposts/1
  # GET /microposts/1.json
  

  # GET /microposts/new
  def new
    @micropost = Micropost.new

  end

  # GET /microposts/1/edit
  def edit
    @micropost = Micropost.find(params[:id])

  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = current_user.microposts.build(micropost_params)


    respond_to do |format|
      if @micropost.save
        format.html { redirect_to root_url(:anchor => "ideas"), notice: 'Micropost was successfully created.' }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
       @micropost = Micropost.find(params[:id])
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
    
  end

  private
    

    # Confirms an admin user.
    def admin_user
      unless current_user && current_user.admin?
      redirect_to login_url, notice: "admin can only do this action." 
      end
    end

    def micropost_params
      params.require(:micropost).permit(:title, :body, :picture, :type_micro)
    end


    


end 



