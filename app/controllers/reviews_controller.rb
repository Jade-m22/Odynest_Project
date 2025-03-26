class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_review, only: %i[edit update destroy]
    before_action :authorize_admin_or_owner!, only: %i[edit update destroy]

    def create
        @experience = Experience.find(params[:experience_id])
        @review = @experience.reviews.build(review_params)
        @review.user = current_user

        if params[:review][:user_pseudo].present? && current_user.username != params[:review][:user_pseudo]
            current_user.update(username: params[:review][:user_pseudo])
        end
        
        if @review.save
            redirect_to experience_path(@experience), notice: "Avis ajouté"
        else
            redirect_to experience_path(@experience), alert: "Erreur lors de l'ajout de l'avis."
        end
    end


    def edit
    end

    def update
        if @‌review.update(review_params)
            redirect_to experience_path(@review.experience), notice: "Avis mis à jour."
        else
            render :edit
        end
    end

    def destroy
        @‌review.destroy
        redirect_to experience_path(@review.experience), notice: "Avis supprim\u00E9."
    end

    private

    def set_review
        @‌review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:rating, :comment, :experience_id)
    end

    def authorize_admin_or_owner!
        redirect_to root_path unless current_user.admin? || @‌review.user == current_user
    end
end
