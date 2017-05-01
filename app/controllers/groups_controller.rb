class GroupsController < ApplicationController
  def create
    groupName = params[:groupName]
    emails = params[:groupEmails]
    p "=========== #{emails} ============"
    return render json: { errors: "Group name can't be blank" }, status: 400 if groupName == ""
    creator = User.find(session[:user_id])
    #return render json: { errors: "You must provide at least one email" }, status: 400 unless emails

    group = Group.new(name: groupName, admin_id: session[:user_id])
    if emails && group.save
      emails.each do |email|
        user = User.find_by(email: email)
        if user
          group.members << user
        else
          return render json: {errors: "Invalid email(s)" }, status: 422
        end
      end
      group.members << creator
      render json: { group_id: group.id }
    end
    if group.save
      group.members << creator
      render json: { group_id: group.id }
    end
  end

  def joined_groups
    user = User.find(session[:user_id])
    groups = user.groups
    render json: { groups: groups }
  end

  def admin_groups
    user = User.find(session[:user_id])
    admin_groups = user.created_groups
    render json: { admin_groups: admin_groups }
  end
end
