class HousesController < ApplicationController
  def index
    @houses = House.all.order(:created_at)
  end

  def show
    @house = House.find(params[:id])
    @members = @house.members
    @member = Member.new
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      flash[:notice] = "House added successfully"
      redirect_to @house
    else
      flash[:notice] = @house.errors.full_messages.join(' | ')
      render :new
    end
  end

  private
  def house_params
    params.require(:house).permit(:name, :author, :source, :motto)
  end
end
