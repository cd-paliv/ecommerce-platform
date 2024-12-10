# Permisos de la aplicación

### Tipos
Hay tres tipos de permisos:
- Administrador: puede ver y administrar todo.
- Manager: puede ver y administrar todo menos usuarios con rol ``Administrador''
- Employee: puede ver todo y administrar ventas y productos.

### Implementación
Para llevar a cabo el manejo de sesiones y permisos, se utilizaron las siguientes gemas:
```ruby
gem "cancancan"
gem "bcrypt", "~> 3.1.7"
```

La gema `cancancan` permitió la definición y uso de la clase Ability, en la cual se define qué acciones puede realizar cada tipo de usuario:

```ruby
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    user.admin? ? can(:manage, :all) : user.manager? ? (can(:manage, :all) && cannot(:manage, User, role: "admin")) : user.employee? ? (can(:manage, Sale) && can(:manage, Product)) : nil

    can :read, Product
  end
end
```

Así, los permisos del usuario loggeado pueden ser verificados con la funciones `can?` y `cannot?` en views y controllers.

La gema `bcrypt` permite encriptar las contraseñas de los usuarios y asegurar su almacenamiento seguro en la base de datos. En el modelo `User`, se utilizó el método `has_secure_password`, el cual permite validar la presencia de la contraseña al crear un usuario; autenticar los usuarios con el método `authentcate`; y almacena la contraseña de manera segura en la base de datos con `password_digest`