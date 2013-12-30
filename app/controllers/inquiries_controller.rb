class InquiriesController < ApplicationController

  def index

  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_to inquiries_path, notice: 'Inquiry created successfully'
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:first_name,
        :last_name, :email, :subject, :description)
  end

end
