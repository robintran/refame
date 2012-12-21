class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :remember_me, :plugins

  has_and_belongs_to_many :roles, :join_table => :roles_users
  has_many :plugins, :class_name => "UserPlugin", :order => "position ASC", :dependent => :destroy

  def name
    "#{first_name} #{last_name}"
  end

  def plugins=(plugin_names)
    if persisted? # don't add plugins when the user_id is nil.
      UserPlugin.delete_all(:user_id => id)
      plugin_names.each_with_index do |plugin_name, index|
        plugins.create(:name => plugin_name, :position => index) if plugin_name.is_a?(String)
      end
    end
  end

  def authorized_plugins
    plugins.collect(&:name) | ::Refinery::Plugins.always_allowed.names
  end

  def can_delete?(user_to_delete = self)
    user_to_delete.persisted? &&
      !user_to_delete.has_role?(:superuser) &&
      ::Role[:refinery].users.any? &&
      id != user_to_delete.id
  end

  def can_edit?(user_to_edit = self)
    user_to_edit.persisted? && (
      user_to_edit == self ||
      self.has_role?(:superuser)
    )
  end

  def add_role(title)
    raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(::Role)
    roles << ::Role[title] unless has_role?(title)
  end

  def has_role?(title)
    raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(::Role)
    roles.any?{|r| r.title == title.to_s.camelize}
  end

  def create_first
    if valid?
      # first we need to save user
      save
      # add refinery role
      add_role(:refinery)
      # add superuser role
      add_role(:superuser) if ::Role[:refinery].users.count == 1
      # add plugins
      self.plugins = Refinery::Plugins.registered.in_menu.names
    end

    # return true/false based on validations
    valid?
  end

  def get_errors
    error_list = {}
    self.errors.messages.each do |key, val|
      if val.to_s.include?('confirmation')
        val.each do |error|
          error_list[:password_confirmation] = key.to_s.capitalize + ' ' + error if error.include?('confirmation')
          error_list[:password] = key.to_s.capitalize + ' ' + error if !error.include?('confirmation')
        end
      else
        error_list[key.to_sym] = key.to_s.capitalize + ' ' + val[0]
      end
    end unless self.valid?
    error_list
  end
end

