class MembersController < ApplicationController
  def create
    @house = House.find(params[:house_id])
    @member = Member.new(member_params)
    @member.house = @house

    if @member.save
      flash[:notice] = "Member added successfully"
      redirect_to "/houses/#{params['house_id']}"
    else
      flash[:notice] = @member.errors.full_messages.join(' | ')
      @members = Member.all
      render :new
    end

  end

  def new
    @member = Member.new
    @house = House.find(params[:house_id])
  end

  private
  def member_params
    params.require(:member).permit(:first_name, :last_name)
  end
end
