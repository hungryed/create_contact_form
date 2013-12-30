class InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_to inquiries_path, notice: 'Inquiry created successfully'
    else
      render :new
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])

    @inquiry.destroy
    redirect_to inquiries_path, notice: 'Story deleted successfully'
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:first_name,
        :last_name, :email, :subject, :description)
  end

end
