class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    # Affiche le profil utilisateur
    def show
      @reservations = @user.reservations.includes(:experience)
    end
  
    # Formulaire d'édition du profil
    def edit
    end
  
    # Mise à jour du profil
    def update
      if @user.update(user_params)
        redirect_to @user, notice: "Profil mis à jour avec succès !"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # Suppression du compte
    def destroy
      @user.destroy
      redirect_to root_path, notice: "Votre compte a bien été supprimé."
    end
  
    private
  
    # Récupérer l'utilisateur en fonction de l'ID
    def set_user
      @user = User.find(params[:id])
    end
  
    # Paramètres autorisés pour la mise à jour du profil
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end
  end
  